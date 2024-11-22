import 'package:dino_shop/pages/login/widgets/english_only.dart';
import 'package:flutter/material.dart';

class LogInBox extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 아이디, 비밀번호 입력
        LoginTextField(),

        SizedBox(height: 60),

        // 로그인 버튼
        ElevatedButton(
          onPressed: () {
            print('이메일: ${_emailController.text}');
            print('비밀번호: ${_passwordController}');
          },
          child: Text('LOGIN'),
        )
      ],
    );
  }

  Column LoginTextField() {
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
      ],
    );
  }
}
