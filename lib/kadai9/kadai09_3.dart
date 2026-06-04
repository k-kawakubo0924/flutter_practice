import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '演習課題9-3',
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
  var _message = '出身地を選んでください';
  var _selected = '東京';
  final _prefectures = ['北海道', '東京', '大阪', '福岡', '沖縄'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('都道府県選択')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(_message, style: TextStyle(fontSize: 28.0)),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: DropdownButton<String>(
                value: _selected,
                onChanged: (String? value) {
                  setState(() {
                    _selected = value ?? '東京';
                    _message = '$_selected出身ですね！';
                  });
                },
                style: TextStyle(fontSize: 24.0, color: Colors.black),
                items: [
                  for (var pref in _prefectures)
                    DropdownMenuItem<String>(value: pref, child: Text(pref)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
