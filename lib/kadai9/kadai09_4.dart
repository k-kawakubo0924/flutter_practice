import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '演習課題9-4',
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
  var _position = 0.0;
  var _isPlaying = false;
  final _duration = 210.0; // 3分30秒

  String _formatTime(int totalSeconds) {
    int minutes = totalSeconds ~/ 60;
    int secs = totalSeconds % 60;
    return '$minutes:${secs.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ミュージックプレーヤー')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 曲情報
            Padding(
              padding: EdgeInsets.only(top: 40.0, bottom: 10.0),
              child: Text('Flutter Symphony', style: TextStyle(fontSize: 24.0)),
            ),
            Text(
              'Dart Orchestra',
              style: TextStyle(fontSize: 18.0, color: Colors.grey),
            ),

            // シークバー
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
              child: Slider(
                value: _position,
                min: 0.0,
                max: _duration,
                divisions: 210,
                onChanged: (double value) {
                  setState(() {
                    _position = value;
                  });
                },
              ),
            ),

            // 再生時間表示
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _formatTime(_position.toInt()),
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Text(
                    _formatTime(_duration.toInt()),
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),

            // 再生/停止ボタン
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: IconButton(
                icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
                iconSize: 60.0,
                onPressed: () {
                  setState(() {
                    _isPlaying = !_isPlaying;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
