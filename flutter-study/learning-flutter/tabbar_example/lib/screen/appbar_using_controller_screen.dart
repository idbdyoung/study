import 'package:flutter/material.dart';
import 'package:tabbar_example/const/tabs.dart';

class AppBarUsingControllerScreen extends StatefulWidget {
  const AppBarUsingControllerScreen({super.key});

  @override
  State<AppBarUsingControllerScreen> createState() =>
      _AppBarUsingControllerScreenState();
}

class _AppBarUsingControllerScreenState
    extends State<AppBarUsingControllerScreen> with TickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    tabController = TabController(
      length: TABS.length,
      vsync: this,
    );
    tabController.addListener(() {
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'appbar using title',
        ),
        bottom: TabBar(
          controller: tabController,
          tabs: TABS
              .map(
                (e) => Center(
                  child: Icon(e.icon),
                ),
              )
              .toList(),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: TABS
            .map(
              (e) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    e.icon,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (tabController.index != 0)
                        ElevatedButton(
                            onPressed: () {
                              tabController.animateTo(tabController.index - 1);
                            },
                            child: Text('이전')),
                      const SizedBox(
                        width: 16.0,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            tabController.animateTo(tabController.index + 1);
                          },
                          child: Text('다음')),
                    ],
                  )
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
