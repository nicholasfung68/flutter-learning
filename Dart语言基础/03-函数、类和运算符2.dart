// 有时候类的实例化需要根据参数提供多种初始化方式。
// 除了可选命名参数和可选参数之外，
// Dart 还提供了命名构造函数的方式，
// 使得类的实例化过程语义更清晰。
// 此外，与 C++ 类似，Dart 支持初始化列表。
// 在构造函数的函数体真正执行之前，
// 你还有机会给实例变量赋值，甚至重定向至另一个构造函数。

// example
// Point 类中有两个构造函数 Point.bottom 与 Point，
// 其中：Point.bottom 将其成员变量的初始化重定向到了 Point 中，
// 而 Point 则在初始化列表中为 z 赋上了默认值 0。
// class Point {
//   num x, y, z;
//   Point(this.x, this.y) : z = 0; // 初始化变量z
//   Point.buttom(num x) : this(x, 0); // 重定向构造函数
//   void printInfo() => print('$x, $y, $z');
// }

// void main() {
//   var p = Point.buttom(100);
//   p.printInfo(); // 100, 0, 0
// }

// 复用
// 在 Dart 中，你可以对同一个父类进行继承或接口实现：
// 继承父类意味着，子类由父类派生，会自动获取父类的成员变量和方法实现，
// 子类可以根据需要覆写构造函数及父类方法；接口实现则意味着，
// 子类获取到的仅仅是接口的成员变量符号和方法符号，需要重新实现成员变量，
// 以及方法的声明和初始化，否则编译器会报错。

// Example
// Vector 通过继承 Point 的方式增加了成员变量，
// 并覆写了 printInfo 的实现；而 Coordinate，
// 则通过接口实现的方式，覆写了 Point 的变量定义及函数实现：
class Point2 {
  num x = 0, y = 0;
  void printInfo() => print('($x, $y)');
}

// Vector 继承自 Point2
class Vector extends Point2 {
  num z = 0;
  @override
  void printInfo() => print('($x, $y, $z)'); // 覆写了printInfo实现
}

// Coordinate是对 Point2接口 的实现
class Coordinate implements Point2 {
  num x = 0, y = 0; // 成员变量需要重新声明
  void printInfo() => print('($x, $y)'); // 成员函数需要重新声明实现
}

// 要使用混入，只需要 with 关键字即可。
class Coordinate2 with Point2 {
}

void main() {
  var xxx = Vector();
  // ..级联运算符，等同于xxx.x=1; xxx.y=2;xxx.z=3;
  xxx
    ..x = 1
    ..y = 2
    ..z = 3;
  xxx.printInfo(); // (1, 2, 3)
  var yyy = Coordinate();
  yyy
    ..x = 1
    ..y = 2;
  yyy.printInfo(); // (1, 2)
  // 可以看出，子类 Coordinate 采用接口实现的方式，
// 仅仅是获取到了父类 Point2 的一个“空壳子”，
// 只能从语义层面当成接口 Point2 来用，但并不能复用 Point2 的原有实现。

// 除了继承和接口实现之外，Dart 还提供了另一种机制来实现类的复用，
// 即“混入”（Mixin）。混入鼓励代码重用，可以被视为具有实现方法的接口。
// 这样一来，不仅可以解决 Dart 缺少对多重继承的支持问题，
// 还能够避免由于多重继承可能导致的歧义（菱形问题）。
// 继承歧义，也叫菱形问题，是支持多继承的编程语言中一个相当棘手的问题。
// 当 B 类和 C 类继承自 A 类，而 D 类继承自 B 类和 C 类时会产生歧义。
// 如果 A 中有一个方法在 B 和 C 中已经覆写，而 D 没有覆写它，
// 那么 D 继承的方法的版本是 B 类，还是 C 类的呢？

  var yyy2 = Coordinate2();
  print(yyy2 is Point2); // true
  print(yyy2 is Coordinate2); // true
  // 可以看到，通过混入，一个类里可以以非继承的方式使用其他类中的变量与方法
}
