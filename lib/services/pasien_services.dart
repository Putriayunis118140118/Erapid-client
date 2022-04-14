import 'package:erapid_new/services/http_services.dart';
import 'package:erapid_new/view_model/vm_pasien.dart';

class PasienServices{
  Future<Map> prosesAmbilDataPasien(PasienViewModel vm) async{
    Map jsonResp = {
      'rc': '999',
      'rcm': 'gagal default'
    };

    var jsonReq = {
      'params': vm.txtCari.text,
    };

    try {
      jsonResp = await HttpServices().httpPost('ambil-data-pasien', jsonReq);
    } on Exception catch (e) {
      print(e);
    }

    return jsonResp;
  }

  Future<Map> prosesAmbilDetailDataPasien(PasienViewModel vm) async{
    Map jsonResp = {
      'rc': '999',
      'rcm': 'gagal default'
    };

    var jsonReq = {
      'params': vm.txtCari.text,
      'id_pasien': vm.txtIdPasien.text,
    };

    try {
      jsonResp = await HttpServices().httpPost('ambil-data-pasien', jsonReq);
    } on Exception catch (e) {
      print(e);
    }

    return jsonResp;
  }

  Future<Map> prosesEditDataPasien(PasienViewModel vm) async{
    Map jsonResp = {
      'rc': '999',
      'rcm': 'gagal default'
    };

    var jsonReq = {
      'id_pasien': vm.txtIdPasien.text,
      'nik': vm.txtNikPasien.text,
      'nama': vm.txtNama.text,
      'tgllhr': vm.txtTglLahir.text,
      'nohp': vm.txtNoHp.text,
      'jk': vm.pilihanJK.name,
      'email': vm.txtEmail.text
    };

    try {
      jsonResp = await HttpServices().httpPost('edit-data-pasien', jsonReq);
    } on Exception catch (e) {
      print(e);
    }

    return jsonResp;
  }

  Future<Map> prosesDeleteDataPasien(PasienViewModel vm) async{
    Map jsonResp = {
      'rc': '999',
      'rcm': 'gagal default'
    };

    var jsonReq = {
      'id_pasien': vm.txtIdPasien.text,
      'nik': vm.txtNikPasien.text,
      'nama': vm.txtNama.text,
      'tgllhr': vm.txtTglLahir.text,
      'nohp': vm.txtNoHp.text,
      'jk': vm.pilihanJK.name,
      'email': vm.txtEmail.text
    };

    try {
      jsonResp = await HttpServices().httpPost('hapus-data-pasien', jsonReq);
    } on Exception catch (e) {
      print(e);
    }

    return jsonResp;
  }
}