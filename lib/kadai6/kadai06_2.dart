import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final title = "TextButton";

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

class Weather {
  String _tenki;
  Weather(this._tenki) : super();

  @override
  String toString() {
    return _tenki;
  }
}

class _MyHomePageState extends State<MyHomePage> {
  bool _answerd = false;
  static final _weather = [
    Weather("好きな食べ物は？"),
    Weather("カレー"),
    Weather("ラーメン"),
    Weather("寿司"),
    Weather("ハンバーグ"),
  ];
  Weather _item = _weather[0];

  void setMessage() {
    setState(() {
      _item = (_weather.sublist(1, 4)..shuffle()).first;
    });
  }

  void setnull() {
    setState(() {
      _answerd = true;
    });
  }

  void setreset() {
    setState(() {
      _answerd = false;
      _item = (_weather.sublist(0)).first;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), backgroundColor: Colors.white),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(_item.toString(), style: TextStyle(fontSize: 32)),
            TextButton(
              onPressed: _answerd
                  ? null
                  : () {
                      setnull();
                      setMessage();
                    },

              child: Text("答えを見る", style: TextStyle(fontSize: 32)),
            ),
            TextButton(
              onPressed: setreset,
              child: Text("リセット", style: TextStyle(fontSize: 32)),
            ),
          ],
        ),
      ),
    );
  }
}

// _item.toString()
