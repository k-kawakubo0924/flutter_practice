import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '演習課題8-3',
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
  var _message = '0個選択中';
  final _items = ['りんご', 'バナナ', 'みかん', 'ぶどう'];
  final _checked = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('買い物リスト')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(_message, style: TextStyle(fontSize: 28.0)),
            ),
            CheckboxListTile(
              title: Text(_items[0]),
              value: _checked[0],
              onChanged: (bool? value) {
                setState(() {
                  _checked[0] = value!;
                  _updateCount();
                });
              },
            ),
            CheckboxListTile(
              title: Text(_items[1]),
              value: _checked[1],
              onChanged: (bool? value) {
                setState(() {
                  _checked[1] = value!;
                  _updateCount();
                });
              },
            ),
            CheckboxListTile(
              title: Text(_items[2]),
              value: _checked[2],
              onChanged: (bool? value) {
                setState(() {
                  _checked[2] = value!;
                  _updateCount();
                });
              },
            ),
            CheckboxListTile(
              title: Text(_items[3]),
              value: _checked[3],
              onChanged: (bool? value) {
                setState(() {
                  _checked[3] = value!;
                  _updateCount();
                });
              },
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: buttonPressed,
                child: Text('確定', style: TextStyle(fontSize: 24.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _updateCount() {
    int count = _checked.where((c) => c).length;
    _message = '$count個選択中';
  }

  void buttonPressed() {
    setState(() {
      List<String> selected = [];
      for (int i = 0; i < _items.length; i++) {
        if (_checked[i]) {
          selected.add(_items[i]);
        }
      }
      if (selected.isEmpty) {
        _message = '商品を選択してください';
      } else {
        _message = '${selected.join('、')} を購入';
      }
    });
  }
}
