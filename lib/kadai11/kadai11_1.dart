import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '演習課題11-1',
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
  var _bottomMessage = '操作を選んでください';
  var _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('メモアプリ'),
        leading: BackButton(
          onPressed: () {
            setState(() {
              _count = 0;
              _bottomMessage = '戻る';
            });
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              setState(() {
                _count++;
                _bottomMessage = '追加';
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              setState(() {
                if (_count > 0) _count--;
                _bottomMessage = '削除';
              });
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30.0),
          child: Center(
            child: Text(_bottomMessage, style: TextStyle(fontSize: 18.0)),
          ),
        ),
      ),
      body: Center(
        child: Text('メモ: $_count件', style: TextStyle(fontSize: 28.0)),
      ),
    );
  }
}
