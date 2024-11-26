import 'package:dino_shop/model/manager.dart';
import 'package:dino_shop/pages/login/widgets/english_only.dart';
import 'package:flutter/material.dart';

class LogInBox extends StatelessWidget {
  // final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();
  var email = "";
  var password = "";

  final VoidCallback onLoginSuccess;

  LogInBox({required this.onLoginSuccess});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //키보드 사라지게 만들고 싶은데...안되네여?
      behavior: HitTestBehavior.opaque, //안되서
      onTap: () {
        // 화면 클릭 시 키보드 닫기
        FocusScope.of(context).unfocus();
      },
      child: Column(
        children: [
          // 아이디, 비밀번호 입력
          _buildLoginTextField(),

          SizedBox(height: 60),

          // 로그인 버튼
          ElevatedButton(
            onPressed: () {
              // var email = _emailController.text;
              // var password = _passwordController.text;

              print(email);
              print(password);

              // 관리자 계정 확인
              if (Manager(email: email, password: password) == managerAddress) {
                // 관리자 계정 로그인 성공 시
                _showCustomDialog(
                  context,
                  title: "관리자님!",
                  content: "오늘 하루도 열심히.",
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
      ),
    );
  }

  Column _buildLoginTextField() {
    return Column(
      children: [
        TextFormField(
          // controller: _emailController,
          decoration: InputDecoration(labelText: 'EMAIL'),
          keyboardType: TextInputType.emailAddress,
          inputFormatters: [EnglishOnly()],
          onChanged: (text) => {email = text},
        ),
        TextFormField(
          // controller: _passwordController,
          obscureText: true,
          decoration: InputDecoration(labelText: 'PASSWORD'),
          onChanged: (text) => {password = text},
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
