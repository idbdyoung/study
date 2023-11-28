import 'package:baemin/user/view/login_screen.dart';
import 'package:baemin/user/view/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    _App()
  );
}

class _App extends StatelessWidget {
  const _App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'NotoSans', // 기본 폰트 변경
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

