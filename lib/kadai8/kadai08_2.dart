import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '演習課題8-2',
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
  var _isDark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ダークモード切替')),
      body: Container(
        color: _isDark ? Colors.grey[850] : Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                _isDark ? 'ダークモード' : 'ライトモード',
                style: TextStyle(
                  fontSize: 28.0,
                  color: _isDark ? Colors.white : Colors.black,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text(
                    'ダークモード',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: _isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  Switch(
                    value: _isDark,
                    onChanged: (bool? value) {
                      setState(() {
                        _isDark = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
            // 以下の書き方でもOK
            // SwitchListTile(
            //   title: Text(
            //     'ダークモード',
            //     style: TextStyle(
            //       fontSize: 20.0,
            //       color: _isDark ? Colors.white : Colors.black,
            //     ),
            //   ),
            //   value: _isDark,
            //   onChanged: (bool value) {
            //     setState(() {
            //       _isDark = value;
            //     });
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
