import 'package:flutter/material.dart';

// 【解説】この課題では「状態の持ち上げ（lifting state up）」パターンを使っています。
// テーマ（ダーク/ライト）はMaterialAppレベルで設定する必要があるため、
// 状態（_isDark）をMyApp側で管理し、子ウィジェット（MyHomePage）には
// コールバック関数を渡しています。
//
// 流れ：
// 1. _MyAppState が _toggleTheme メソッドと _isDark 状態を持つ
// 2. MyHomePage に onToggle として _toggleTheme の参照を渡す
// 3. MyHomePage 内で Switch が切り替わると onToggle(value) が呼ばれる
// 4. 実体は _MyAppState._toggleTheme なので、_MyAppState の setState が実行される
// 5. _MyAppState が再ビルド → MaterialApp の theme が更新 → MyHomePage も再描画

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _isDark = false;

  void _toggleTheme(bool value) {
    setState(() {
      _isDark = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '演習課題8-2（発展）',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: _isDark ? Brightness.dark : Brightness.light,
        ),
      ),
      home: MyHomePage(isDark: _isDark, onToggle: _toggleTheme),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final bool isDark;
  // Function(bool) : boolを引数にとる関数を表す型
  final Function(bool) onToggle;

  const MyHomePage({super.key, required this.isDark, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ダークモード切替')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              isDark ? 'ダークモード' : 'ライトモード',
              style: TextStyle(fontSize: 28.0),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: [
                Switch(value: isDark, onChanged: onToggle),
                Text('ダークモード', style: TextStyle(fontSize: 20.0)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
