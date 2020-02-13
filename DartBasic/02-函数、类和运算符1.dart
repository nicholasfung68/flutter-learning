// 一、函数
// 传统函数写法
// bool isZero(int number) { // 判断整数是否为0
//   return number == 0;
// }
// void printInfo(int number, Function check) { // 用check函数来判断整数是否为0
//   print('$number is Zero : ${check(number)}');
// }

// 也可以像js的箭头函数一样，简化
bool isZero(int number) => number == 0;
void printInfo(int number, Function check) => print('$number is Zero : ${check(number)}');

Function f = isZero;
int x = 10;
int y = 0;

// 一个函数中可能需要传递多个参数,dart在函数定义时：
// 给参数增加{}，以 paramName: value 的方式指定调用参数，也就是可选命名参数;
// 给参数增加[]，则意味着这些参数是可以忽略的，也就是可选参数。
// 在 Flutter 中会大量用到可选命名参数的方式，一定要记住它的用法。

//要达到可选命名参数的用法，那就在定义函数的时候给参数加上 {}
void enable1Flags({bool bold, bool hidden}) => print('$bold, $hidden');
//定义可选命名参数时增加默认值
void enable2Flags({bool bold = true, bool hidden = false}) => print('$bold, $hidden');
//可忽略的参数在函数定义时用[]符号指定
void enable3Flags(bool bold, [bool hidden]) => print('$bold, $hidden');
//定义可忽略参数时增加默认值
void enable4Flags(bool bold, [bool hidden = false]) => print('$bold, $hidden');

// 二、类
// 类是特定类型的数据和方法的集合，也是创建对象的模板。与其他语言一样，Dart 为类概念提供了内置支持。
// Dart 中并没有 public、protected、private 这些关键字，我们只要在声明变量与方法时，
// 在前面加上“_”即可作为 private 方法使用。如果不加“_”，则默认为 public。
// 不过，“_”的限制范围并不是类访问级别的，而是库访问级别。

class Point {
  num x, y;
  static num factor = 0;
  Point(this.x, this.y); // 语法糖，等同于在函数体内：this.x = x;this.y = y;
  void printInfo() => print('$x , $y');
  static void printZValue() => print('$factor');
}

void main() {
  // printInfo(x, f); // 10 is Zero : false
  // printInfo(y, f); // 0 is Zero : true

  // // 可选命名参数函数调用
  // enable1Flags(bold: true, hidden: false); //true, false
  // enable1Flags(bold: true); //true, null
  // enable2Flags(bold: false); //false, false

  // // 可忽略参数函数调用
  // enable3Flags(true, false); // true, false
  // enable3Flags(true,); // true, null
  // enable4Flags(true); // true, false
  // enable4Flags(true, true); // true, true

  var p = new Point(100, 200); // new 关键字可以省略
  p.printInfo(); // 100, 200
  Point.factor = 10;
  Point.printZValue(); // 10
}
