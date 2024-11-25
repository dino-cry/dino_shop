import 'package:dino_shop/pages/login/widgets/english_only.dart';
import 'package:flutter/material.dart';

/// 관리자 계정 정보를 관리하는 클래스
class Manager {
  // 관리자 이메일과 비밀번호
  final String email;
  final String password;

  // 생성자를 통해 관리자 계정을 초기화
  Manager({
    required this.email,    //필수 입력값 required, null값 문제 방지
    required this.password,
  });

  /// 관리자 계정인지 확인하는 메서드
  bool isManager(String inputEmail, String inputPassword) {
    return inputEmail == email && inputPassword == password;
  }
}


class LogInBox extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final VoidCallback onLoginSuccess;


  LogInBox({
    required this.onLoginSuccess});

    // 관리자 계정을 정의
  final Manager manager = Manager(
    email: "admin@gmail.com",
    password: "1234",
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 아이디, 비밀번호 입력
        _buildLoginTextField(),

        SizedBox(height: 60),

        // 로그인 버튼
        ElevatedButton(
          onPressed: () {
            final email = _emailController.text;
            final password = _passwordController.text;

            // 관리자 계정 확인
            if (manager.isManager(email, password)) {
              // 관리자 계정 로그인 성공 시
              _showCustomDialog(
                context,
                title: "관리자님!",
                content: "오늘 하루도 열심히.",
                onDialogClose: onLoginSuccess, // 팝업 닫힌 후 다음 페이지 이동
              );
            } 
            // 일반 계정 확인
            else if (_validateCredentials(email, password)) {
              // 일반 계정 로그인 성공 시
              _showCustomDialog(
                context,
                title: "환영합니다!",
                content: "로그인이 성공적으로 완료되었습니다.",
                onDialogClose: onLoginSuccess, // 팝업 닫힌 후 다음 페이지 이동
              );
            } else {
              // 로그인 실패 처리
              _showCustomDialog(
                context,
                title: "Login Error",
                content: "아이디와 비밀번호를 확인해주세요.",
              );
            }
          },
          child: const Text("LOGIN"), // 버튼 텍스트
        ),
      ],
    );
  }


  Column _buildLoginTextField() {
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

    bool _validateCredentials(String email, String password) {
    return email.isNotEmpty && password.isNotEmpty; // 비어 있지 않은지 확인
  }

  // 팝업 창 표시
  void _showCustomDialog(BuildContext context,
      {required String title, 
      required String content,
      VoidCallback? onDialogClose}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // 팝업 닫기
              if (onDialogClose != null) {
                onDialogClose(); // 팝업 닫힌 후 콜백 실행
              }
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}

