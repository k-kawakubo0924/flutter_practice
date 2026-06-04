import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '演習課題10-4',
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
  var _message = '言語を選択してください';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('言語選択')),
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
              child: ElevatedButton(
                onPressed: buttonPressed,
                child: Text('言語を選ぶ', style: TextStyle(fontSize: 24.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void buttonPressed() {
    showDialog(
      context: context,
      builder: (BuildContext context) => SimpleDialog(
        title: Text('使用言語を選択'),
        children: [
          SimpleDialogOption(
            onPressed: () => Navigator.pop<String>(context, '日本語'),
            child: Text('日本語'),
          ),
          SimpleDialogOption(
            onPressed: () => Navigator.pop<String>(context, 'English'),
            child: Text('English'),
          ),
          SimpleDialogOption(
            onPressed: () => Navigator.pop<String>(context, '中文'),
            child: Text('中文'),
          ),
          SimpleDialogOption(
            onPressed: () => Navigator.pop<String>(context, '한국어'),
            child: Text('한국어'),
          ),
        ],
      ),
    ).then<void>((value) => resultAlert(value));
  }

  void resultAlert(String? value) {
    setState(() {
      if (value != null) {
        _message = '$value を選択しました';
      }
    });
  }
}
