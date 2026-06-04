import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '演習課題10-5',
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
  var _message = 'メニューを選んでください';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('注文アプリ')),
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
                child: Text('注文する', style: TextStyle(fontSize: 24.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void buttonPressed() {
    // まずSimpleDialogでメニューを選択
    showDialog(
      context: context,
      builder: (BuildContext context) => SimpleDialog(
        title: Text('メニュー'),
        children: [
          SimpleDialogOption(
            onPressed: () => Navigator.pop<String>(context, 'コーヒー'),
            child: Text('コーヒー'),
          ),
          SimpleDialogOption(
            onPressed: () => Navigator.pop<String>(context, '紅茶'),
            child: Text('紅茶'),
          ),
          SimpleDialogOption(
            onPressed: () => Navigator.pop<String>(context, 'オレンジジュース'),
            child: Text('オレンジジュース'),
          ),
          SimpleDialogOption(
            onPressed: () => Navigator.pop<String>(context, '水'),
            child: Text('水'),
          ),
        ],
      ),
    ).then<void>((value) {
      if (value != null) {
        showConfirmDialog(value);
      }
    });
  }

  void showConfirmDialog(String menu) {
    // 次にAlertDialogで確認
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('確認'),
        content: Text('$menuを注文しますか？'),
        actions: [
          TextButton(
            child: Text('キャンセル'),
            onPressed: () => Navigator.pop<String>(context, 'キャンセル'),
          ),
          TextButton(
            child: Text('注文する'),
            onPressed: () => Navigator.pop<String>(context, '注文する'),
          ),
        ],
      ),
    ).then<void>((value) {
      setState(() {
        if (value == '注文する') {
          _message = '$menuを注文しました！';
        } else {
          _message = 'キャンセルしました';
        }
      });
    });
  }
}
