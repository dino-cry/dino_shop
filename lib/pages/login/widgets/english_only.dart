import 'package:flutter/services.dart';

class EnglishOnly extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // 영어 알파벳, 숫자, 특수문자(@, ., _)만 허용
    final RegExp regex = RegExp(r'^[a-zA-Z0-9@._]+$');
    if (newValue.text.isEmpty) {
      return newValue;
    } else if (regex.hasMatch(newValue.text)) {
      return newValue;
    } else {
      return oldValue;
    }
  }
}
