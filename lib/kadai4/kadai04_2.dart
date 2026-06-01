import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final title = "レイアウト練習２";

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), backgroundColor: Colors.white),
      backgroundColor: Colors.white,
      body: Align(
        alignment: Alignment.topCenter,
        // child: Expanded(
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(255, 199, 108, 1)),
          height: 200,
          child: Align(
            child: Text(
              "モバイルアプリ開発",
              style: TextStyle(fontSize: 28, color: Colors.red),
            ),
          ),
        ),
      ),
    );
  }
}


//  const Color.fromARGB(255, 249, 207, 123),