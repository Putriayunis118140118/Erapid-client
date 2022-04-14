import 'package:erapid_new/services/http_services.dart';
import 'package:erapid_new/view_model/vm_login.dart';
import 'package:erapid_new/view_model/vm_lupa_pass.dart';
import 'package:erapid_new/view_model/vm_registrasi.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LupaPassServices{
  Future<Map> prosesRegisterLupaPass(LupaPassViewModel model) async {
    Map jsonResp = {
      'rc': '999',
      'rcm': 'gagal default'
    };

    var jsonReq = {
      'email': model.txtEmail.text,
    };

    try {
      jsonResp = await HttpServices().httpPost('reg-lupa-password', jsonReq);
    } on Exception catch (e) {
      print(e);
    }

    return jsonResp;
  }

  Future<Map> prosesCekUrl(LupaPassViewModel model) async {
    Map jsonResp = {
      'rc': '999',
      'rcm': 'gagal default'
    };

    var jsonReq = {
      'sesi_url': model.sesiUrl
    };

    try {
      jsonResp = await HttpServices().httpPost('verify-lupa-password', jsonReq);
    } on Exception catch (e) {
      print(e);
    }

    return jsonResp;
  }

  Future<Map> prosesGantiPassword(LupaPassViewModel model) async {
    Map jsonResp = {
      'rc': '999',
      'rcm': 'gagal default'
    };

    var jsonReq = {
      'sesi_url': model.sesiUrl,
      'pass': model.txtPass.text
    };

    try {
      jsonResp = await HttpServices().httpPost('new-password', jsonReq);
    } on Exception catch (e) {
      print(e);
    }

    return jsonResp;
  }
}