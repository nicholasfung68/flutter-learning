void main() {
  print('Welcome to learn DART');
  // // 数值类型 num
  // // 只有两种子类： 64位int、符合ieee754标准的64位double
  // int x = 1;
  // int hex = 0xEEADBEEF;
  // double y = 1.1;
  // double exponents = 1.13e5;
  // int roundY = y.round();
  // print(x);
  // print(hex);
  // print(y);
  // print(exponents);
  // print(roundY);

  // // 检查变量是否为 0，在 Dart 中需要显示地与 0 做比较：
  // // 这是与js很不同的地方，需要特别注意！！！
  // var number = 0;
  // print(number == 0); // true
  // print(number == 1); // false
  // print(number == false); // false
  // print(number == true); // false

  // // 定义多行字符串的构建， 使用三个单引号或者三个双引号
  // var s3 = """This is a
  // multi-line string.""";
  // var s4 = '''This is my
  // first time to learn flutter''';
  // print(s3);
  // print(s4);

  // // List类型(可以理解为数组类型)
  // var arr1 = <String>['one', 'two', 'three']; // arr是String类型数组
  // var arr2 = List<int>.of([1, 2, 3]); // arr2是int型数组
  // // Map类型(可以理解为键值对类型）
  // var map1 = { "name":"Nicholas", 'age': 18 };
  // var map2 = new Map();
  // arr1.add('aaa');
  // // arr2.add(1.2); // 因为类型不一致，编译器会提示类型不一致，从而导致编译报错
  // arr2.forEach((v) => print('${v}')); // 不同于js中es6 的`${}`, 需要区分开来
  // print(arr2 is List<int>); // true
  // map2['name'] = 'Flutter';
  // map2['age'] = 5;
  // map1.forEach((k, v) => print('${k} : ${v}'));
  // map2.forEach((k, v) => print('${k} : ${v}'));

  // // 定义常量
  // // 通过var定义变量，通过final、const来定义常量
  // // const，表示变量在编译期间即能确定的值；
  // // final 则不太一样，用它定义的变量可以在运行时确定值，而一旦确定后就不可再变
  // // const 适用于定义编译常量（字面量固定值）的场景，而 final 适用于定义运行时常量的场景
  // // const必须直接赋一个字面量，而不能是一个变量或者公式
  // // 举个例子：
  // final name = 'Nicholas';
  // const count = 1;
  // var x = 70;
  // var y = 30;
  // final z = x / y;

  // 小结
  // 在 Dart 中，所有类型都是对象类型，都继承自顶层类型 Object，因此一切变量都是对象，数字、布尔值、函数和 null 也概莫能外
  // 未初始化变量的值都是 null
  // 为变量指定类型，这样编辑器和编译器都能更好地理解你的意图。
  // 代码末尾以 英文分号 结束，不可缺少
}
