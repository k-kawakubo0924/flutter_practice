import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final title = "ボタン操作3";

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
  // String _message = 'スイッチはOFFです';
  bool flg = false;

  void _setOn() {
    setState(() {
      // _message = 'スイッチはONです';
      flg = true;
    });
  }

  void _setOff() {
    setState(() {
      flg = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: flg
          ? Text("スイッチはONです", style: TextStyle(fontSize: 32))
          : Text("スイッチはOFFです", style: TextStyle(fontSize: 32)),
      floatingActionButton: FloatingActionButton(
        onPressed: flg ? _setOff : _setOn,
        child: flg ? const Icon(Icons.star) : const Icon(Icons.heart_broken),
      ),
    );
  }
}
