import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CoreValidation{
  static int phoneLimit = 16;
  static int textNormalLimit = 50;
  static int textDescLimit = 20;

  static List<TextInputFormatter> formatPhone(){
    return [
      FilteringTextInputFormatter.digitsOnly,
      LengthLimitingTextInputFormatter(phoneLimit),
    ];
  }

  static List<TextInputFormatter> formatTextNormal(){
    return [
      FilteringTextInputFormatter.singleLineFormatter,
      LengthLimitingTextInputFormatter(textNormalLimit),
    ];
  }

  static List<TextInputFormatter> formatTextDesc(){
    return [
      FilteringTextInputFormatter.singleLineFormatter,
      LengthLimitingTextInputFormatter(textDescLimit),
    ];
  }

  static List<TextInputFormatter> formatCurrency(){
    return [
      CurrencyInputFormatter(),
      FilteringTextInputFormatter.singleLineFormatter,
      LengthLimitingTextInputFormatter(11),
    ];
  }

  static List<TextInputFormatter> formatCharOnly() {
    return [
      FilteringTextInputFormatter.singleLineFormatter,
      LengthLimitingTextInputFormatter(textNormalLimit),
      FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z ]")),
    ];
  }

  static TextInputType typeNumber(){
    return TextInputType.number;
  }

  static TextInputType typeString(){
    return TextInputType.text;
  }

  static TextInputType typeEmail(){
    return TextInputType.emailAddress;
  }

  static TextInputType typePhone(){
    return TextInputType.phone;
  }

  static String? normalCheck(String field, String value, [int minLength = 8]){
    var msg = '';

    if (value == null || value.isEmpty) {
      return "$field Tidak Boleh Kosong";
    }

    bool hasMinLength = value.length >= minLength;
    if (!hasMinLength) msg = msg + "$field Minimal $minLength Karakter\n";

    if (msg.length == 0) {
      return null;
    } else {
      msg = msg.substring(0, msg.length - 1);
      return msg;
    }
  }

  static String? emailCheck(String value){
    final RegExp emailRegex = new RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    if (value.isEmpty) {
      return 'Email Tidak Boleh Kosong';
    }

    if (!emailRegex.hasMatch(value)) {
      return "Format Email Tidak Sesuai";
    }

    return null;
  }

  static String? passwordComplex(String password, [int minLength = 8]) {
    var msg = '';

    if (password == null || password.isEmpty) {
      return "Password Tidak Boleh Kosong";
    }

    bool hasMinLength = password.length >= minLength;
    if (!hasMinLength) msg = msg + "Password Minimal $minLength\n";

    bool hasUppercase = password.contains(new RegExp(r'[A-Z]'));
    if (!hasUppercase) msg = msg + "Password Harus Terdapat Huruf Besar\n";

    bool hasLowercase = password.contains(new RegExp(r'[a-z]'));
    if (!hasLowercase) msg = msg + "Password Harus Terdapat Huruf Kecil\n";

    bool hasDigits = password.contains(new RegExp(r'[0-9]'));
    if (!hasDigits) msg = msg + "Password Harus Terdapat Angka\n";

    bool hasSpecialCharacters = password.contains(
        new RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    if (!hasSpecialCharacters)
      msg = msg + "Password Harus Terdapat Spesial Karakter\n";

    if (msg.length == 0) {
      return null;
    } else {
      msg = msg.substring(0, msg.length - 1);
      return msg;
    }
  }

  static String? confirmPasswordCheck(String retype, String password) {
    var msg = '';

    if (password == null || password.isEmpty) {
      return "Password Tidak Boleh Kosong";
    }

    if(retype != password){
      msg = msg + "Password Tidak Sama\n";
    }

    if (msg.length == 0) {
      return null;
    } else {
      msg = msg.substring(0, msg.length - 1);
      return msg;
    }
  }
}

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length == 0) {
      return newValue.copyWith(text: '');
    } else if (newValue.text.compareTo(oldValue.text) != 0) {
      int selectionIndexFromTheRight =
          newValue.text.length - newValue.selection.end;
      final f = new NumberFormat("#,###");
      int num = int.parse(newValue.text.replaceAll(f.symbols.GROUP_SEP, ''));
      final newString = f.format(num);
      return new TextEditingValue(
        text: newString,
        selection: TextSelection.collapsed(
            offset: newString.length - selectionIndexFromTheRight),
      );
    } else {
      return newValue;
    }
  }
}