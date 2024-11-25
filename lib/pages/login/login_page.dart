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
      body: Padding(
        padding: const EdgeInsets.all(60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/application/logo.png'),
            const SizedBox(
              height: 30,
            ),
            LogInBox(onLoginSuccess: () {
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => DinoListPage()),
              );
            }),
          ],
        ),
      ),
    );
  }
}
