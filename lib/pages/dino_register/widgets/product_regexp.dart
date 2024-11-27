class ProductRegexp {
  static RegExp str = RegExp(r"^[ㄱ-ㅎ가-힣0-9a-zA-Z\s!?@#$%^&*-_,.()\[\]+]*$");
  static RegExp number = RegExp(r"^[0-9,+]*$");
}
