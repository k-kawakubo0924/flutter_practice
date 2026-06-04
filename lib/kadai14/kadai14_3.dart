import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '演習課題14-3',
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
  var _message = 'メニューを開いてください';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('マイアプリ')),
      body: Center(child: Text(_message, style: TextStyle(fontSize: 28.0))),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              child: Text('メニュー', style: TextStyle(fontSize: 24.0)),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('ホーム'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _message = 'ホーム を選択しました';
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('設定'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _message = '設定 を選択しました';
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('ヘルプ'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _message = 'ヘルプ を選択しました';
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('ログアウト'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _message = 'ログアウト を選択しました';
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
