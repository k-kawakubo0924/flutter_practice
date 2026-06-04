import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '演習課題11-3',
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
  var _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SNSアプリ')),
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (int value) {
          setState(() {
            _index = value;
          });
        },
        items: [
          BottomNavigationBarItem(label: 'ホーム', icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: '検索', icon: Icon(Icons.search)),
          BottomNavigationBarItem(label: 'プロフィール', icon: Icon(Icons.person)),
        ],
      ),
    );
  }

  Widget _buildBody() {
    switch (_index) {
      case 0:
        // ホーム：投稿風リスト
        return ListView(
          children: [
            ListTile(
              leading: Icon(Icons.account_circle, size: 40),
              title: Text('今日はFlutterの勉強をしました！'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle, size: 40),
              title: Text('新しいアプリのアイデアを思いつきました'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle, size: 40),
              title: Text('BottomNavigationBarを実装中です'),
            ),
          ],
        );
      case 1:
        // 検索：検索バー風
        return Padding(
          padding: EdgeInsets.all(16.0),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'キーワードを入力',
              prefixIcon: Icon(Icons.search),
            ),
          ),
        );
      case 2:
        // プロフィール：アイコンと名前
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person, size: 80.0),
              SizedBox(height: 16.0),
              Text('Flutter太郎', style: TextStyle(fontSize: 24.0)),
            ],
          ),
        );
      default:
        return Center(child: Text('エラー'));
    }
  }
}
