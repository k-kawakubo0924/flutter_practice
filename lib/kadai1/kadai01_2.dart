import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "モバイルアプリ開発実習",
      home: Scaffold(
        appBar: AppBar(
          title: Text("モバイルアプリ開発実習", style: TextStyle(fontSize: 28)),
        ),
        body: Text("This is Practice1-3.", style: TextStyle(fontSize: 48)),
      ),
    );
  }
}
