import 'package:flutter/material.dart';
import 'package:tabbar_example/screen/appbar_using_controller_screen.dart';
import 'package:tabbar_example/screen/basic_appbar_tabbar_screen.dart';
import 'package:tabbar_example/screen/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('home screen'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => BasicAppbarTabbarScreen(),
                    ),
                  );
                },
                child: Text('basic Appbar Tabbar screen'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => AppBarUsingControllerScreen(),
                    ),
                  );
                },
                child: Text('app bar using controller'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => BottomNavBarScreen(),
                    ),
                  );
                },
                child: Text('bottom nav bar screen'),
              ),
            ],
          ),
        ));
  }
}
