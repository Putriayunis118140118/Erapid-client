import 'package:cool_alert/cool_alert.dart';
import 'package:erapid_new/services/login_controller.dart';
import 'package:erapid_new/rute.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel{
  BuildContext context = Get.context!;

  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  Future<void> prosesLogin() async {
    Map jsonResp = await LoginServices().prosesLogin(this);

    if(jsonResp['rc'] == '000' || jsonResp['rc'] == '001'){
      if(jsonResp['rc'] == '001') {
        Get.offAndToNamed(routeBerandaAdminPage);
      }else{
        Get.offAndToNamed(routeBerandaPage);
      }
    }else{
      CoolAlert.show(
        context: context,
        type: CoolAlertType.warning,
        text: jsonResp['rcm'],
      );
    }
  }
}