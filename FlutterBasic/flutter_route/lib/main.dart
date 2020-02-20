import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.orange,
      ),
      // 命名路由（Named Route）即有名字的路由
      // 我们可以先给路由起一个名字，然后就可以通过路由名字直接打开新的路由
      // 注册路由表,就是给路由起名字
      routes: {
        'second_page': (context) => SecondPage(),
        'third_page': (context) => ThirdPage(),
      },
      // 路由页面异常页
      onUnknownRoute: (RouteSettings setting) => MaterialPageRoute(builder: (context) => UnknownPage()),
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String _msg = '';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('First Page')),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text('基本路由(跳转到SecondPage)'),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage())),
          ),
          RaisedButton(
            child: Text('命名路由(跳转到SecondPage)'),
            onPressed: () => Navigator.pushNamed(context, 'second_page')),
          RaisedButton(
            child: Text('命名路由（参数&回调）(跳转到ThirdPage)'),
            onPressed: () => Navigator.pushNamed(context, 'third_page', arguments: 'Hey').then((msg) {
              setState(() {
                _msg = msg;
              });
            }),
          ),
          Text('信息来自Second Page: $_msg'),
          RaisedButton(
            child: Text('命名路由异常处理(跳转到UnknownPage)'),
            onPressed: () => Navigator.pushNamed(context, 'unknown_page'))
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Second Page'),
      ),
      body: RaisedButton(
        child: Text('返回First Page'), onPressed: () => Navigator.pop(context)),
    );
  }
}

class UnknownPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Unknown Page'),
      ),
      body: RaisedButton(
        child: Text('返回'), onPressed: () => Navigator.pop(context)),
    );
  }
}

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String msg = ModalRoute.of(context).settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text('Third Page'),
      ),
      body: Column(
        children: <Widget>[
          Text('信息来自First Page: $msg'),
          RaisedButton(
            child: Text('back'),
            onPressed: () => Navigator.pop(context, 'Hi'))
        ],
      ),
    );
  }
}
