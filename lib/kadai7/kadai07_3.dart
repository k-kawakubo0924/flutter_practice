import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '演習課題7-3',
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
  var _preview = '金額を入力してください';
  var _result = '';
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('税込計算')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(_preview, style: TextStyle(fontSize: 24.0)),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(_result, style: TextStyle(fontSize: 32.0)),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: _controller,
                onChanged: textChanged,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: buttonPressed,
                child: Text('税込計算', style: TextStyle(fontSize: 24.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void textChanged(String val) {
    setState(() {
      if (val.isEmpty) {
        _preview = '金額を入力してください';
      } else {
        _preview = '入力中: $val円';
      }
    });
  }

  void buttonPressed() {
    setState(() {
      int? price = int.tryParse(_controller.text);
      if (price != null) {
        int taxIncluded = (price * 1.1).toInt();
        _result = '税込: $taxIncluded円';
      } else {
        _result = '正しい金額を入力してください';
      }
    });
  }
}
