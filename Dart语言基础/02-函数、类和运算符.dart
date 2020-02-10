// 传统函数写法
// bool isZero(int number) { // 判断整数是否为0
//   return number == 0;
// }
// 也可以像js的箭头函数一样写
bool isZero(int number) => number == 0;

// void printInfo(int number, Function check) { // 用check函数来判断整数是否为0
//   print('$number is Zero : ${check(number)}');
// }
void printInfo(int number, Function check) => print('$number is Zero : ${check(number)}');

Function f = isZero;
int x = 10;
int y = 0;

// 一个函数中可能需要传递多个参数,dart在函数定义时：
// 给参数增加{}，以 paramName: value 的方式指定调用参数，也就是可选命名参数;
// 给参数增加[]，则意味着这些参数是可以忽略的，也就是可选参数。

//要达到可选命名参数的用法，那就在定义函数的时候给参数加上 {}
void enable1Flags({bool bold, bool hidden}) => print('$bold, $hidden');

//定义可选命名参数时增加默认值
void enable2Flags({bool bold = true, bool hidden = false}) => print('$bold, $hidden');

//可忽略的参数在函数定义时用[]符号指定
void enable3Flags(bool bold, [bool hidden]) => print('$bold, $hidden');

//定义可忽略参数时增加默认值
void enable4Flags(bool bold, [bool hidden = false]) => print('$bold, $hidden');

main() {
  printInfo(x, f); // 10 is Zero : false
  printInfo(y, f); // 0 is Zero : true
  //可选命名参数函数调用
  enable1Flags(bold: true, hidden: false); //true, false
  enable1Flags(bold: true); //true, null
  enable2Flags(bold: false); //false, false

  //可忽略参数函数调用
  enable3Flags(true, false); //true, false
  enable3Flags(true,); //true, null
  enable4Flags(true); //true, false
  enable4Flags(true, true); // true, true
}
