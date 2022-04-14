
import 'package:cool_alert/cool_alert.dart';
import 'package:erapid_new/services/login_controller.dart';
import 'package:erapid_new/view/components/tfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

class RegistrasiViewModel extends BaseViewModel{
  BuildContext context = Get.context!;
  final formKey = GlobalKey<FormState>();
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  
  TextEditingController txtNamaPasien = TextEditingController();
  TextEditingController txtNikPasien = TextEditingController();
  TextEditingController txtJk = TextEditingController();
  TextEditingController txtTgllhr = TextEditingController();

  bool _checkTerms = false;

  bool get checkTerms => _checkTerms;

  set checkTerms(bool value) {
    _checkTerms = value;
    notifyListeners();
  }

  Future<void> prosesRegistrasi() async {
    Map jsonResp = await LoginServices().prosesRegisterasi(this);

    if(jsonResp['rc'] == '000'){
      await CoolAlert.show(
        context: context,
        type: CoolAlertType.success,
        text: 'Berhasil Melakukan Registrasi, harap login',
      );

      Get.back();
    }else{
      CoolAlert.show(
        context: context,
        type: CoolAlertType.warning,
        text: jsonResp['rcm'],
      );
    }
  }
}