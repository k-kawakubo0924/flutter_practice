import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '演習課題11-2',
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('プロフィール')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // プロフィール画像エリア
            Container(
              height: 200.0,
              color: Colors.blueGrey[100],
              child: Center(child: Icon(Icons.person, size: 80.0)),
            ),

            // 名前
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Flutter太郎',
                style: TextStyle(fontSize: 28.0),
                textAlign: TextAlign.center,
              ),
            ),

            // 自己紹介セクション
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '自己紹介',
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Flutterを使ったモバイルアプリ開発を学んでいます。\n'
                'プログラミング歴は1年で、主にDartを使っています。\n'
                '将来はクロスプラットフォームアプリを開発したいです。',
                style: TextStyle(fontSize: 18.0),
              ),
            ),

            // スキルセクション
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'スキル',
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(leading: Icon(Icons.code), title: Text('Dart')),
            ListTile(
              leading: Icon(Icons.phone_android),
              title: Text('Flutter'),
            ),
            ListTile(leading: Icon(Icons.web), title: Text('HTML/CSS')),
            ListTile(leading: Icon(Icons.storage), title: Text('SQL')),

            // 趣味セクション
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '趣味',
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(leading: Icon(Icons.music_note), title: Text('音楽鑑賞')),
            ListTile(leading: Icon(Icons.sports_esports), title: Text('ゲーム')),
            ListTile(leading: Icon(Icons.camera_alt), title: Text('写真撮影')),
          ],
        ),
      ),
    );
  }
}
