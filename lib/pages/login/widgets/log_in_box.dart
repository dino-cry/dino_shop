import 'package:dino_shop/pages/login/widgets/english_only.dart';
import 'package:flutter/material.dart';

class LogInBox extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
          Image.asset('assets/images/application/logo.png'),
          TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'EMAIL'),
              keyboardType: TextInputType.emailAddress,
              inputFormatters: [EnglishOnly()]),
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
    );
    ;
  }
}
