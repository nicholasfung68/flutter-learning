import 'package:flutter/material.dart';

// 导入dio
import 'package:dio/dio.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'httpClient dio demo'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilderRoute(),
    );
  }
}

class FutureBuilderRoute extends StatefulWidget {
  @override
  _FutureBuilderRouteState createState() => new _FutureBuilderRouteState();
}

class _FutureBuilderRouteState extends State<FutureBuilderRoute> {
  // 创建Dio实例
  Dio _dio = new Dio();

  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.center,
      child: FutureBuilder(
        future: _dio.get('http://jsonplaceholder.typicode.com/todos'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          // 请求完成
          if (snapshot.connectionState == ConnectionState.done) {
            Response response = snapshot.data;
            // 发生错误
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            // 请求成功,通过项目信息构建用于显示项目名称的ListView
            return ListView(
              children: response.data.map<Widget>((e) => 
                ListTile(
                  leading: Icon(Icons.audiotrack, color: Colors.blue),
                  title: Text(e['title']),
                ),
              ).toList(),
            );
          }
          // 请求未完成继续弹出Loading
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
