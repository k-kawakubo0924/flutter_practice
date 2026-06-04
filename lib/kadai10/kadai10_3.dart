import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '演習課題10-3',
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
  var _message = 'データを削除しますか？';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('削除確認')),
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
                child: Text('削除', style: TextStyle(fontSize: 24.0)),
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
      builder: (BuildContext context) => AlertDialog(
        title: Text('確認'),
        content: Text('本当に削除しますか？この操作は取り消せません。'),
        actions: [
          TextButton(
            child: Text('キャンセル'),
            onPressed: () => Navigator.pop<String>(context, 'キャンセル'),
          ),
          TextButton(
            child: Text('削除する'),
            onPressed: () => Navigator.pop<String>(context, '削除する'),
          ),
        ],
      ),
    ).then<void>((value) => resultAlert(value));
  }

  void resultAlert(String? value) {
    setState(() {
      if (value == '削除する') {
        _message = '削除しました';
      } else {
        _message = 'キャンセルしました';
      }
    });
  }
}
