import 'package:flutter/material.dart';

void main() {
  runApp(const Nintei3Screen());
}

class Nintei3Screen extends StatelessWidget {
  const Nintei3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: '問題3', home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('問題3')),
      body: Row(
        children: [
          Flexible(
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: '入力してください',
              ),
            ),
          ),
          IconButton(onPressed: null, icon: const Icon(Icons.add)),
        ],
      ),
    );
  }
}

          // TextField(
          //   decoration: InputDecoration(
          //     border: OutlineInputBorder(),
          //     hintText: '入力してください',
          //   ),
          // ),
