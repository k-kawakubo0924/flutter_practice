import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "大原学園",
      home: Scaffold(
        appBar: AppBar(title: Text('大原学園')),
        body: Text('東京情報クリエイター工学院専門学校', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
