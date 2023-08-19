import 'package:flutter/material.dart';
import 'package:tabbar_example/const/tabs.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen>
    with TickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: TABS.length, vsync: this);
    tabController.addListener(() {
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('bottom navigation bar'),
      ),
      body: TabBarView(
          controller: tabController,
          children: TABS
              .map((e) => Center(
                    child: Icon(e.icon),
                  ))
              .toList()),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        currentIndex: tabController.index,
        onTap: (index) {
          tabController.animateTo(index);
        },
        type: BottomNavigationBarType.fixed,
        items: TABS
            .map(
              (e) =>
                  BottomNavigationBarItem(icon: Icon(e.icon), label: e.label),
            )
            .toList(),
      ),
    );
  }
}
