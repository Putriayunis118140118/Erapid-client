
import 'package:flutter/cupertino.dart';

class LoginProvider extends ChangeNotifier{
  late String kolNama;
  late String kolDeviceid;
  late String kolKdkol;
  late String kolPassKol;
  late bool kolStsTartun;
  late bool kolStsCetakSaldo;

  late bool isLogin = false;
}