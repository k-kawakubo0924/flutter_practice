import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '演習課題7-1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _message = '名前を入力してください';
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('あいさつアプリ')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(_message, style: TextStyle(fontSize: 28.0)),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: _controller,
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: buttonPressed,
                child: Text('あいさつする', style: TextStyle(fontSize: 24.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void buttonPressed() {
    setState(() {
      if (_controller.text.isEmpty) {
        _message = '名前を入力してください';
      } else {
        _message = 'こんにちは、${_controller.text}さん！';
      }
    });
  }
}
