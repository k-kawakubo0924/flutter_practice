import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '演習課題9-1',
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
  var _message = '血液型を選んでください';
  var _selected = '';

  final _results = {
    'A': 'A型：几帳面で真面目',
    'B': 'B型：マイペースで自由',
    'O': 'O型：おおらかでリーダー気質',
    'AB': 'AB型：天才肌で独創的',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('血液型診断')),
      body: Center(
        child: RadioGroup<String>(
          groupValue: _selected,
          onChanged: (String? value) {
            setState(() {
              _selected = value ?? '';
              _message = _results[_selected] ?? '血液型を選んでください';
            });
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(_message, style: TextStyle(fontSize: 28.0)),
              ),
              Row(
                children: [
                  Radio<String>(value: 'A'),
                  Text('A型', style: TextStyle(fontSize: 20.0)),
                ],
              ),
              Row(
                children: [
                  Radio<String>(value: 'B'),
                  Text('B型', style: TextStyle(fontSize: 20.0)),
                ],
              ),
              Row(
                children: [
                  Radio<String>(value: 'O'),
                  Text('O型', style: TextStyle(fontSize: 20.0)),
                ],
              ),
              Row(
                children: [
                  Radio<String>(value: 'AB'),
                  Text('AB型', style: TextStyle(fontSize: 20.0)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
