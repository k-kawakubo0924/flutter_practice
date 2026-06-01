import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final title = "レイアウト練習１";

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
      backgroundColor: const Color.fromARGB(255, 168, 216, 255),
      body: Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            "Flutter学習中！",
            style: TextStyle(fontSize: 32, color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
