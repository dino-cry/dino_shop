class Manager {
  // 관리자 이메일과 비밀번호
  String email;
  String password;

  // 생성자를 통해 관리자 계정을 초기화
  Manager({
    required this.email, //필수 입력값 required, null값 문제 방지
    required this.password,
  });

  /// 관리자 계정인지 확인
  bool isManager(String inputEmail, String inputPassword) {
    return inputEmail == email && inputPassword == password;
  }

  bool addressCheck() {
    return email == managerAddress.email && password == managerAddress.password;
  }
}

// 관리자 계정을 정의
final Manager managerAddress = Manager(
  email: "admin@gmail.com",
  password: "1234",
);

bool isLogined = false;
