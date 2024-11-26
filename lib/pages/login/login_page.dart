import 'package:dino_shop/pages/dino_list/dino_list_page.dart';
import 'package:dino_shop/pages/login/widgets/log_in_box.dart';
import 'package:dino_shop/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      themeMode: ThemeMode.light,
      theme: theme,
      darkTheme: darkTheme,
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // 키보드 올라올 때 화면 자동 조정
      body: GestureDetector(
        behavior: HitTestBehavior.opaque, // 빈 공간 클릭도 감지
        onTap: () {
          FocusScope.of(context).unfocus(); // 화면 클릭 시 키보드 닫기
        },
        child: ListView(
          padding: const EdgeInsets.all(60), // 리스트뷰의 여백
          children: [
            // 로고 이미지
            Image.asset(
              'assets/images/application/logo.png',
              height: 150, // 로고 크기
            ),
            const SizedBox(height: 30), // 로고와 로그인 박스 간 간격
            // 로그인 박스
            LogInBox(onLoginSuccess: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DinoListPage()),
              );
            }),
          ],
        ),
      ),
    );
  }
}

