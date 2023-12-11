import 'package:baemin_again/common/const/color.dart';
import 'package:baemin_again/common/layout/default_layout.dart';
import 'package:baemin_again/restaurant/view/restaurant_screen.dart';
import 'package:flutter/material.dart';

class RootTab extends StatefulWidget {
  const RootTab({super.key});

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab> with TickerProviderStateMixin {
  late TabController controller;
  int index = 0;

  @override
  void initState() {
    controller = TabController(length: 4, vsync: this);
    controller.addListener(tabListener);

    super.initState();
  }

  void tabListener() {
    setState(() {
      index = controller.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '코팩 딜리버리',
      child: TabBarView(
        controller: controller,
        children: [
          RestaurantScreen(),
          Center(
            child: Text('음식'),
          ),
          Center(
            child: Text('주문'),
          ),
          Center(
            child: Text('프로필'),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: PRIMARY_COLOR,
        unselectedItemColor: BODY_TEXT_COLOR,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        currentIndex: index,
        onTap: (index) {
          controller.animateTo(index);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: '홈'),
          BottomNavigationBarItem(
              icon: Icon(Icons.fastfood_outlined), label: '음식'),
          BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long_outlined), label: '주문'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined), label: '프로필'),
        ],
      ),
    );
  }
}
