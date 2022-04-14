import 'package:cool_alert/cool_alert.dart';
import 'package:erapid_new/rute.dart';
import 'package:erapid_new/services/lupapass_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

class LupaPassViewModel extends BaseViewModel{
  BuildContext context = Get.context!;
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPass = TextEditingController();

  String sesiUrl = '';

  Future<void> prosesLupaPassword() async {
    if(txtEmail.text.isEmpty){
      await CoolAlert.show(
        context: context,
        type: CoolAlertType.success,
        text: 'Edit Data Pasien Berhasil',
      );
      return;
    }

    Map jsonResp = await LupaPassServices().prosesRegisterLupaPass(this);
    Get.toNamed(routePesanKonfrimEmail);
    // if(jsonResp['rc'] == '000'){
    //   // Get.offAndToNamed(routeBerandaPage);
    // }else{
    //
    // }
  }

  Future<void> cek(String parm) async{
    sesiUrl = parm;
    prosesCekSesiUrl();
    notifyListeners();

  }

  Future<void> prosesCekSesiUrl() async{
    Map jsonResp = await LupaPassServices().prosesCekUrl(this);
    if(jsonResp['rc'] == '000'){

    }else{
      await CoolAlert.show(
        context: context,
        type: CoolAlertType.warning,
        text: jsonResp['rcm'],
      );

      Get.offAllNamed(routeMain);
    }
  }

  Future<void> prosesGantiPassword() async{
    Map jsonResp = await LupaPassServices().prosesGantiPassword(this);
    if(jsonResp['rc'] == '000'){
      await CoolAlert.show(
        context: context,
        type: CoolAlertType.success,
        text: 'KATA SANDI BERHASIL DIPERBAHURUI',
      );

      Get.offAllNamed(routeMain);
    }else{
      await CoolAlert.show(
        context: context,
        type: CoolAlertType.warning,
        text: jsonResp['rcm'],
      );

      Get.offAllNamed(routeMain);
    }
  }
}