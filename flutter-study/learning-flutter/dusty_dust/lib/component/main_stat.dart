import 'package:flutter/material.dart';

class MainStat extends StatelessWidget {
  final String category;
  final String imgPath;
  final String level;
  final String stat;
  final double width;

  const MainStat({
    required this.category,
    required this.imgPath,
    required this.level,
    required this.stat,
    required this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(color: Colors.black);

    return SizedBox(
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            category,
            style: textStyle,
          ),
          SizedBox(
            height: 8.0,
          ),
          Image.asset(
            imgPath,
            width: 50.0,
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            level,
            style: textStyle,
          ),
          Text(
            stat,
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
