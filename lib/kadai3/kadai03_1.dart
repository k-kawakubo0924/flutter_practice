import 'package:flutter/material.dart';

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

class _MyHomePageState extends State<MyHomePage> {
  Map<String, int> courseMap = {
    "システム開発コース：": 200,
    "AIシステム・データサイエンスコース：": 100,
    "ネットワークセキュリティーコース：": 70,
    "高度システム開発コース：": 50,
  };
  int number = 0;
  void setData() {
    setState(() {
      number++;
      if (number >= courseMap.length) {
        number = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //MapをListに変換。
    // .entriesでMapEntryという1つの箱にまとめてくれる。
    // .toListで番号で指定できるように「リスト」に変換する。
    // [number]は「number」番目の要素を取り出して。という意味になる
    final currentEntry = courseMap.entries.toList()[number];
    // .entriesを飛ばして.toListをするとエラーになる。コース名だけ、人数だけ、両方のリストを作成するのかシステムが迷ってしまうため。

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Text(
        "${currentEntry.key} ${currentEntry.value}名",
        style: TextStyle(fontSize: 32),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: setData,
        child: const Icon(Icons.star),
      ),
    );
  }
}
