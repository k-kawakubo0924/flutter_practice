import 'package:flutter/material.dart';
import 'package:flutter_kadai/main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final title = "演習課題";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "課題",
      home: MyHomePage(title: this.title),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({required this.title}) : super();
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class Data {
  String _course;
  int _number;
  Data(this._course, this._number) : super();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, int> courseMap = {
    "システム開発コース：": 200,
    "AIシステム・データサイエンスコース：": 100,
    "ネットワークセキュリティーコース：": 70,
    "高度システム開発コース：": 50,
  };

  void setData() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Text("", style: TextStyle(fontSize: 32)),
      floatingActionButton: FloatingActionButton(
        onPressed: setData,
        child: const Icon(Icons.star),
      ),
    );
  }
}
