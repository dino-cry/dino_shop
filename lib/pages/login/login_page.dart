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
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            Image.asset('assets/images/application/logo.png'),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'EMAIL'),
            ),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'PASSWORD'),
            ),
            ElevatedButton(
                onPressed: () {
                  print('이메일: ${_emailController.text}');
                  print('비밀번호: ${_passwordController}');
                },
                child: Text('LOGIN'))
          ],
        ),
      ),
    );
  }
}
