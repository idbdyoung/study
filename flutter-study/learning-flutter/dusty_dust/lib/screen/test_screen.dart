import 'package:dusty_dust/main.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ValueListenableBuilder(valueListenable: Hive.box(testBox).listenable(), builder: (context, box, widget) {
            print(box.values.toList());

            return Column(
              children: box.values.map((e) => Text(e.toString())).toList(),
            );
          }),
          ElevatedButton(
            onPressed: () {
              final box = Hive.box(testBox);
              print("keys: ${box.keys.toList()}");
              print("values: ${box.values.toList()}");
            },
            child: Text('박스 프린트하기'),
          ),
          ElevatedButton(
            onPressed: () {
              final box = Hive.box(testBox);
              box.add('테스트1');
            },
            child: Text('데이터 넣기!'),
          ),
          ElevatedButton(
            onPressed: () {
              final box = Hive.box(testBox);
              print(box.get(0));
            },
            child: Text('특정 값 가져오기'),
          ),
        ],
      ),
    );
  }
}
