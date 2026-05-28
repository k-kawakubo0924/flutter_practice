import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final title = "ボタン操作";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "課題2-1",
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

class _MyHomePageState extends State<MyHomePage> {
  String _message = 'こんにちは';

  void _setMessage() {
    setState(() {
      _message = 'ボタンがクリックされました！';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Text(_message, style: TextStyle(fontSize: 32)),
      floatingActionButton: FloatingActionButton(
        onPressed: _setMessage,
        child: Icon(Icons.star),
      ),
    );
  }
}
