import 'package:flutter/material.dart';
import 'package:tabbar_example/const/tabs.dart';

class BasicAppbarTabbarScreen extends StatelessWidget {
  const BasicAppbarTabbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: TABS.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('basic appbar screen'),
          bottom: TabBar(
              indicatorColor: Colors.red,
              indicatorWeight: 4.0,
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: Colors.yellow,
              unselectedLabelColor: Colors.grey,
              labelStyle: TextStyle(
                fontWeight: FontWeight.w700,
              ),
              unselectedLabelStyle: TextStyle(
                fontWeight: FontWeight.w100
              ),
              tabs: TABS
                  .map(
                    (e) => Tab(
                      icon: Icon(
                        e.icon,
                      ),
                      child: Text(
                        e.label,
                      ),
                    ),
                  )
                  .toList()),
        ),
        body: TabBarView(
          children: TABS
              .map(
                (e) => Center(
                  child: Icon(e.icon),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
