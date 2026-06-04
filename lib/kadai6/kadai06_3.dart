import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final title = "いいね！";

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
  int number = 0;

  void setGood() {
    setState(() {
      number++;
    });
  }

  void setBad() {
    setState(() {
      number--;
      if (number <= 0) {
        number = 0;
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), backgroundColor: Colors.white),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            // Column(
            Text("♥$number", style: TextStyle(fontSize: 48)),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: setGood,
                  icon: Icon(Icons.thumb_up),
                  iconSize: 60,
                  color: Colors.blue,
                ),
                IconButton(
                  onPressed: setBad,
                  icon: Icon(Icons.thumb_down),
                  iconSize: 60,
                  color: Colors.red,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// _item.toString()
