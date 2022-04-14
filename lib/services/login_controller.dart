import 'package:erapid_new/services/http_services.dart';
import 'package:erapid_new/view_model/vm_login.dart';
import 'package:erapid_new/view_model/vm_registrasi.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginServices{
  Future<Map> prosesLogin(LoginViewModel model) async {
    Map jsonResp = {
      'rc': '999',
      'rcm': 'gagal default'
    };

    var jsonReq = {
      'email': model.txtUsername.text,
      'pass': model.txtPassword.text
    };

    try {
      jsonResp = await HttpServices().httpPost('login', jsonReq);
    } on Exception catch (e) {
      print(e);
    }

    if(jsonResp['rc'] == '000' || jsonResp['rc'] == '001'){
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('user_id', jsonResp['id_user']);
      await prefs.setString('user_mail', model.txtUsername.text);
      await prefs.setString('user_name', jsonResp['nm_user']);
    }

    return jsonResp;
  }

  Future<Map> prosesRegisterasi(RegistrasiViewModel model) async {
    Map jsonResp = {
      'rc': '999',
      'rcm': 'gagal default'
    };

    var jsonReq = {
      'email': model.txtUsername.text,
      'pass': model.txtPassword.text,
      'nama': model.txtNamaPasien.text
    };

    try {
      jsonResp = await HttpServices().httpPost('register-akun', jsonReq);
    } on Exception catch (e) {
      print(e);
    }

    return jsonResp;
  }
}
