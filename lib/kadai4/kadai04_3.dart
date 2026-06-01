import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final title = "レイアウト練習３";

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
        child: Align(
          alignment: Alignment.topLeft,
          child: Container(
            width: 500,
            decoration: BoxDecoration(
              color: Colors.green[100],
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: Colors.green, width: 2.0),
            ),
            height: 200,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsetsGeometry.fromLTRB(0, 0, 0, 40),
                child: Text(
                  "大原太郎",
                  style: TextStyle(
                    fontSize: 36,
                    color: const Color.fromARGB(255, 31, 179, 92),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


//  const Color.fromARGB(255, 249, 207, 123),