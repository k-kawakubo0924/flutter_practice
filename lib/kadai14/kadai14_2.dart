import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '演習課題14-2',
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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  static const List<Tab> tabs = [
    Tab(text: 'ホーム', icon: Icon(Icons.home)),
    Tab(text: '検索', icon: Icon(Icons.search)),
    Tab(text: 'プロフィール', icon: Icon(Icons.person)),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabs.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SNSアプリ')),
      bottomNavigationBar: Container(
        color: Theme.of(context).colorScheme.primaryContainer,
        child: TabBar(controller: _tabController, tabs: tabs),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // ホーム：投稿風リスト
          ListView(
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
                title: Text('TabBarViewを実装中です'),
              ),
            ],
          ),
          // 検索：検索バー風
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'キーワードを入力',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          // プロフィール：アイコンと名前
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.person, size: 80.0),
                SizedBox(height: 16.0),
                Text('Flutter太郎', style: TextStyle(fontSize: 24.0)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
