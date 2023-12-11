import 'dart:convert';

import 'package:baemin_again/common/component/custom_text_form_field.dart';
import 'package:baemin_again/common/const/color.dart';
import 'package:baemin_again/common/const/data.dart';
import 'package:baemin_again/common/layout/default_layout.dart';
import 'package:baemin_again/common/view/root_tab.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String username = '';
  String password = '';
  String? errorText;

  @override
  Widget build(BuildContext context) {
    final dio = Dio();

    return DefaultLayout(
      child: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const _Title(),
              const SizedBox(
                height: 16.0,
              ),
              const _SubTitle(),
              Image.asset(
                'asset/img/misc/logo.png',
                width: MediaQuery.of(context).size.width,
              ),
              CustomTextFormField(
                hintText: '이메일을 입력해 주세요.',
                errorText: errorText,
                onChanged: (String value) {
                  if (errorText != null) {
                    setState(() {
                      errorText = null;
                    });
                  }
                  username = value;
                },
              ),
              const SizedBox(
                height: 16.0,
              ),
              CustomTextFormField(
                hintText: '비밀번호를 입력해 주세요.',
                obsecureText: true,
                onChanged: (String value) {
                  if (errorText != null) {
                    setState(() {
                      errorText = null;
                    });
                  }
                  password = value;
                },
              ),
              const SizedBox(
                height: 16.0,
              ),
              ElevatedButton(
                onPressed: () async {
                  final rawString = '$username:$password';

                  Codec<String, String> stringToBase64 = utf8.fuse(base64);
                  String token = stringToBase64.encode(rawString);

                  try {
                    final res = await dio.post(
                      'http://$ip/auth/login',
                      options: Options(
                        headers: {
                          'authorization': 'Basic $token',
                        },
                      ),
                    );
                    final accessToken = res.data['accessToken'];
                    final refreshToken = res.data['refreshToken'];

                    await storage.write(key: ACCESS_TOKEN_KEY, value: accessToken);
                    await storage.write(key: REFRESH_TOKEN_KEY, value: refreshToken);

                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (_) => RootTab(),
                      ),
                      (route) => false,
                    );
                  } on DioException catch (e) {
                    if (e.response?.statusCode == 403) {
                      setState(() {
                        errorText = '인증정보가 틀립니다.';
                      });
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: PRIMARY_COLOR,
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    '로그인',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: PRIMARY_COLOR,
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text('회원가입'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      '환영합니다.',
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 34,
        color: Colors.black,
      ),
    );
  }
}

class _SubTitle extends StatelessWidget {
  const _SubTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      '이메일과 비밀번호를 입력해서 로그인 해주세요!\n오늘도 성공적인 주문이 되길.',
      style: TextStyle(
        fontSize: 16,
        color: BODY_TEXT_COLOR,
      ),
    );
  }
}
