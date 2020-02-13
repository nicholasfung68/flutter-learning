import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
      ),
      // 命名路由（Named Route）即有名字的路由
      // 我们可以先给路由起一个名字，然后就可以通过路由名字直接打开新的路由
      // 注册路由表,就是给路由起名字
      routes: {
        "new_page": (context) => NewRoute(),
        "new_page":(context) => EchoRoute(),
        "/": (context) => MyHomePage(title: 'Flutter demo首页'), // 注册首页路由
      },
      // home: MyHomePage(title: 'Flutter demo首页'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '你点击按钮的次数为:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            FlatButton(
              onPressed: () {
                // 导航到新路由
                // Navigator.pushNamed(context, 'new_page');
                Navigator.of(context).pushNamed('new_page', arguments: 'hi');
                // Navigator.push(context, 
                //   MaterialPageRoute(builder: (context) {
                //     return NewRoute();
                //   })
                // );
              },
              child: Text('打开新的route'),
              textColor: Colors.red, // 字体颜色设置为红色
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

// 创建一个新路由，命名为"NewRoute"
class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Route'),
      ),
      body: Center(
        child: Text('这是新的页面 this is new route'),
      ),
    );
  }
}

// 在路由页通过RouteSetting对象获取路由参数：
class EchoRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 获取路由参数
    var args = ModalRoute.of(context).settings.arguments;
    return Container(
      child: Text('$args'),
    );
  }
}