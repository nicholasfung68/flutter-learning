// 简易购物车 改造代码（简化代码）

// Item 类与 ShoppingCar 类的初始化部分。
// 它们在构造函数中的初始化工作，仅仅是将 main 函数传入的参数进行属性赋值。
// 在 Dart 里，我们可以利用语法糖以及初始化列表，来简化这样的赋值过程，从而直接省去构造函数的函数体

// 定义商品Item类
class Item {
  double price;
  String name;
  // 第一次修改前
  // Item(name, price) {
  //   this.name = name;
  //   this.price = price;
  // }
  // 第一次修改后
  Item(this.name, this.price);
}

// 定义购物车类
class ShoppingCar {
  String name;
  DateTime date;
  String code;
  List<Item> bookings;

  price() {
    double sum = 0.0;
    for(var i in bookings) {
      sum += i.price;
    }
    return sum;
  }

  // 第一次修改前
  // ShoppingCar(name, code) {
  //   this.name = name;
  //   this.code =code;
  //   this.date = DateTime.now();
  // }
  // 第一次修改后
  ShoppingCar(this.name, this.code) : date = DateTime.now();

  getInfo() {
    return '购物车信息：' +
            '\n--------------------' +
            '\n用户名：' + name +
            '\n优惠码：' + code +
            '\n总  价：' + price().toString() +
            '\n日  期：' + date.toString() +
            '\n--------------------';
  }
}

void main() {
  ShoppingCar sc = ShoppingCar('尼古拉斯', '123456');
  sc.bookings = [Item('车厘子', 10.0), Item('草莓', 20.0)];
  print(sc.getInfo());
}
