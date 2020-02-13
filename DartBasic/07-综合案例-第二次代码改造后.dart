// 第一次改造完后 发现：
// 首先，Item 类与 ShoppingCar 类中都有一个 name 属性，在 Item 中表示商品名称，
// 在 ShoppingCar 中则表示用户名；
// 然后，Item 类中有一个 price 属性，
// ShoppingCar 中有一个 price 方法，它们都表示当前的价格。
// 考虑到 name 属性与 price 属性（方法）的名称与类型完全一致，
// 在信息表达上的作用也几乎一致，因此可以在这两个类的基础上，
// 再抽象出一个新的基类 Meta，用于存放 price 属性与 name 属性。
// 同时，考虑到在 ShoppingCar 类中，
// price 属性仅用做计算购物车中商品的价格（而不是像 Item 类那样用于数据存取），
// 因此在继承了 Meta 类后，改写了 ShoppingCar 类中 price 属性的 get 方法：

// 第二次修改后
class Meta {
  double price;
  String name;
  // 成员变量初始化语法糖
  Meta(this.name, this.price);
}

class Item extends Meta {
  Item(name, price) : super(name, price);
  // 重载+运算符，将商品对象合并为套餐商品
  Item operator + (Item item) => Item(name + item.name, price + item.price);
}

abstract class PrintInfo {
  printIinfo() => print(getInfo());
  getInfo();
}

// class ShoppingCar extends Meta {
// with表示以非继承的方式复用了另一个类的成员变量及函数
class ShoppingCar extends Meta with PrintInfo { // 混入PrintInfo
  DateTime date;
  String code;
  List<Item> bookings;
  // 改造前
  // double get price {
  //   double sum = 0.0;
  //   for(var i in bookings) {
  //     sum += i.price;
  //   }
  //   return sum;
  // }
  // 改造后
  // 把迭代求和改写为归纳合并
  double get price => bookings.reduce((value, element) => value + element).price;

  // 改造前
  // ShoppingCar(name, this.code) : date = DateTime.now(),super(name, 0);
  // 改造后
  // 默认初始化方法，转发到withCode里
  ShoppingCar({name}) : this.withCode(name: name, code: null);
  // withCode初始化方法，使用语法糖和初始化列表进行赋值，并调用父类初始化方法
  ShoppingCar.withCode({name, this.code}) : date = DateTime.now(), super(name, 0);

  // 改造前
  // getInfo() {
  //   return '购物车信息：' +
  //       '\n--------------------' +
  //       '\n用户名：' + name +
  //       '\n优惠码：' + code +
  //       '\n总价：' + price().toString() +
  //       '\n日期：' + date.toString() +
  //       '\n--------------------';
  // }

  // 在 Dart 中，我们可以通过对字符串插入变量或表达式，
  // 并使用多行字符串声明的方式，来完全抛弃不优雅的字符串拼接，实现字符串格式化组合。
  // 改造后
  // ??运算符表示为code不为null，则用原值，否则使用默认值"没有优惠码"类似js中三目运算
  getInfo() => '''
    购物车信息：
    -------------------
    用户名：$name
    优惠码：${ code ?? '没有优惠码' }
    总  价：$price
    日  期：$date
    -------------------
  ''';
}

void main() {
  // 改造前
  // ShoppingCar sc = ShoppingCar('尼古拉斯', '123456');
  // sc.bookings = [Item('车厘子', 10.0), Item('草莓', 20.0)];
  // print(sc.getInfo());

  // 首先，在对 ShoppingCar 的构造函数进行了大量简写后，
  // 我们希望能够提供给调用者更明确的初始化方法调用方式，
  // 让调用者以“参数名: 参数键值对”的方式指定调用参数，
  // 让调用者明确传递的初始化参数的意义。
  // 在 Dart 中，这样的需求，我们在声明函数时，
  // 可以通过给参数增加{}实现。其次，对一个购物车对象来说，
  // 一定会有一个有用户名，但不一定有优惠码的用户。
  // 因此，对于购物车对象的初始化，我们还需要提供一个不含优惠码的初始化方法，
  // 并且需要确定多个初始化方法与父类的初始化方法之间的正确调用顺序。

  // 改造后
  // ShoppingCar sc = ShoppingCar.withCode(name: '尼古拉斯', code: '123456');
  // sc.bookings = [Item('车厘子', 10.0), Item('草莓', 20.0)];
  // print(sc.getInfo());

  // ShoppingCar sc2 = ShoppingCar(name: '李四');
  // sc2.bookings = [Item('香蕉', 15.0), Item('西瓜', 40.0)];
  // print(sc2.getInfo());

  // 再次改造后（混入PrintInfo， 使用级联 .. ）
  ShoppingCar.withCode(name: '尼古拉斯', code: '123456')
  ..bookings = [Item('车厘子', 10.0), Item('草莓', 20.0)]
  ..printIinfo();

  ShoppingCar(name: '李四')
  ..bookings = [Item('香蕉', 15.0), Item('西瓜', 40.0)]
  ..printIinfo();
}
