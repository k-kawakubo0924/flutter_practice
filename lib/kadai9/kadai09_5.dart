import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '演習課題9-5',
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
  var _fontSize = 24.0;
  var _selectedColor = '黒';
  var _selectedWeight = '通常';

  final _colorMap = {
    '黒': Colors.black,
    '赤': Colors.red,
    '青': Colors.blue,
    '緑': Colors.green,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('テキストスタイル設定')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // プレビューテキスト
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Hello, Flutter!',
                style: TextStyle(
                  fontSize: _fontSize,
                  color: _colorMap[_selectedColor],
                  fontWeight: _selectedWeight == '太字'
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
            ),

            // Slider（フォントサイズ）
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  Text('サイズ:', style: TextStyle(fontSize: 16.0)),
                  Expanded(
                    child: Slider(
                      value: _fontSize,
                      min: 16.0,
                      max: 48.0,
                      divisions: 8,
                      onChanged: (double value) {
                        setState(() {
                          _fontSize = value;
                        });
                      },
                    ),
                  ),
                  Text(
                    '${_fontSize.toInt()}px',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),

            // DropdownButton（テキスト色）
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text('色:', style: TextStyle(fontSize: 16.0)),
                  SizedBox(width: 10),
                  DropdownButton<String>(
                    value: _selectedColor,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedColor = value ?? '黒';
                      });
                    },
                    items: [
                      for (var color in _colorMap.keys)
                        DropdownMenuItem<String>(
                          value: color,
                          child: Text(color),
                        ),
                    ],
                  ),
                ],
              ),
            ),

            // Radio（太字切替）
            Padding(
              padding: EdgeInsets.all(10.0),
              child: RadioGroup<String>(
                groupValue: _selectedWeight,
                onChanged: (String? value) {
                  setState(() {
                    _selectedWeight = value ?? '通常';
                  });
                },
                child: Row(
                  children: [
                    Text('太さ:', style: TextStyle(fontSize: 16.0)),
                    Radio<String>(value: '通常'),
                    Text('通常', style: TextStyle(fontSize: 16.0)),
                    Radio<String>(value: '太字'),
                    Text('太字', style: TextStyle(fontSize: 16.0)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
