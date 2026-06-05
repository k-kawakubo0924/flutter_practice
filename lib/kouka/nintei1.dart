import 'package:flutter/material.dart';

void main() {
  runApp(const Nintei1Screen());
}

class Nintei1Screen extends StatelessWidget {
  const Nintei1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: '問題1', home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color _containerColor = Colors.blue;
  String _message = "初期状態";
  void setMessage() {
    setState(() {
      _message = "ボタンをタップしました";
    });
  }

  void setColor() {
    setState(() {
      _containerColor = Colors.red;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('問題１')),
      body: Center(
        // 追加: Containerとボタンを縦に並べるためのColumnを配置
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // 画面中央に配置
          children: [
            // 1つ目の要素: 今まで通りのContainer
            Container(
              height: 90,
              width: 300,
              decoration: BoxDecoration(
                color: _containerColor,
                border: Border.all(width: 10, color: Colors.green),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_message, style: const TextStyle(color: Colors.white)),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 2つ目の要素: Containerの外に配置したElevatedButton
            ElevatedButton(onPressed: setColor, child: const Text("背景色変更")),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: setMessage,
        child: const Icon(Icons.edit),
      ),
    );
  }
}
