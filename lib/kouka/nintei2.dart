import 'package:flutter/material.dart';

void main() {
  runApp(Nintei2Screen());
}

class Nintei2Screen extends StatelessWidget {
  const Nintei2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '課題2',
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
    Tab(text: 'Python', icon: Icon(Icons.home)),
    Tab(text: 'Java', icon: Icon(Icons.search)),
    Tab(text: 'Go', icon: Icon(Icons.person)),
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
      appBar: AppBar(title: Text('問題2')),
      bottomNavigationBar: Container(
        color: Theme.of(context).colorScheme.primaryContainer,
        child: TabBar(controller: _tabController, tabs: tabs),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Column(
            children: [
              Container(
                height: 300,
                width: 400,
                child: Image.asset('images/Python.jpg', fit: BoxFit.contain),
              ),
              Text("Python言語", style: TextStyle(fontSize: 30)),
              Text("pythonは高水準のプログラム言語です"),
            ],
          ),
          Column(
            children: [
              Container(
                height: 300,
                width: 400,
                child: Image.asset('images/java.jpg', fit: BoxFit.contain),
              ),
              Text("Java言語", style: TextStyle(fontSize: 30)),
              Text("Javaはオブジェクト指向のプログラム言語です。"),
            ],
          ),
          Column(
            children: [
              Container(
                height: 300,
                width: 400,
                child: Image.asset('images/go.jpg', fit: BoxFit.contain),
              ),
              Text("Go言語", style: TextStyle(fontSize: 30)),
              Text("GoはGoogleによって開発されたプログラム言語です。"),
            ],
          ),
          // ホーム：投稿風リスト
        ],
      ),
    );
  }
}
