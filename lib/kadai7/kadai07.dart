import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final title = "あいさつアプリ";

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
  String text = "名前を入力してください";

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), backgroundColor: Colors.white),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            // Column(
            Text("", style: TextStyle(fontSize: 48)),
            // ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [

              ],
            ),
          ],
        ),
      ),
    );
  }
}

// _item.toString()
