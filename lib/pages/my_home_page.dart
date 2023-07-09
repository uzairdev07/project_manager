import 'package:flutter/material.dart';
import 'package:khata_app/pages/account_page.dart';
import 'package:khata_app/pages/project_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final _pages = const [
    ProjectPage(),
    AccountPage(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _pages.length, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Company Name'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.lock_outlined,
              color: Colors.green[200],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: _pages,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.grey[300]!,
                  width: 1.0,
                ),
              ),
            ),
            child: TabBar(
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.label,
              overlayColor: MaterialStateColor.resolveWith(
                (states) => Colors.transparent,
              ),
              tabs: const [
                Tab(
                  icon: Icon(Icons.book_outlined),
                  text: 'Projects',
                ),
                Tab(
                  icon: Icon(Icons.person_outlined),
                  text: 'Account',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
