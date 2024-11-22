import 'package:dino_shop/pages/login/widgets/english_only.dart';
import 'package:flutter/material.dart';

class LogInBox extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        SizedBox(
          height: 60,
        ),
        ElevatedButton(
            onPressed: () {
              print('이메일: ${_emailController.text}');
              print('비밀번호: ${_passwordController}');
            },
            child: Text('LOGIN'))
      ],
    );
  }
}
