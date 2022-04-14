import 'package:erapid_new/services/http_services.dart';
import 'package:erapid_new/view_model/vm_login.dart';
import 'package:erapid_new/view_model/vm_registrasi.dart';
import 'package:erapid_new/view_model/vm_reservasi.dart';
import 'package:erapid_new/view_model/vm_riwayat.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RiwayatController{
  Future<Map> prosesAmbilRiwayat(RiwayatViewModel model) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Map jsonResp = {
      'rc': '999',
      'rcm': 'gagal default'
    };

    String userId = prefs.getString('user_id') ?? '';

    var jsonReq = {
      'id_user': userId,
      'id_daftar': model.idDaftar,
      'is_hasil': model.isHasil,
      'is_bayar': model.isPembayaran,
      'params': model.txtCari.text
    };

    try {
      jsonResp = await HttpServices().httpPost('riwayat', jsonReq);
    } on Exception catch (e) {
      print(e);
    }

    return jsonResp;
  }

  Future<Map> prosesDetailRiwayat(RiwayatViewModel model) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Map jsonResp = {
      'rc': '999',
      'rcm': 'gagal default'
    };

    String userId = prefs.getString('user_id') ?? '';

    var jsonReq = {
      'id_user': userId,
      'id_daftar': model.idDaftar
    };

    try {
      jsonResp = await HttpServices().httpPost('riwayat', jsonReq);
    } on Exception catch (e) {
      print(e);
    }

    return jsonResp;
  }

  Future<Map> prosesDetailAdminRiwayat(RiwayatViewModel model) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Map jsonResp = {
      'rc': '999',
      'rcm': 'gagal default'
    };

    String userId = prefs.getString('user_id') ?? '';

    var jsonReq = {
      'id_user': userId,
      'id_daftar': model.idDaftar
    };

    try {
      jsonResp = await HttpServices().httpPost('detail-pemesenan', jsonReq);
    } on Exception catch (e) {
      print(e);
    }

    return jsonResp;
  }

  Future<Map> prosesKonfrimAdmin(RiwayatViewModel model) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Map jsonResp = {
      'rc': '999',
      'rcm': 'gagal default'
    };

    String userId = prefs.getString('user_id') ?? '';

    var jsonReq = {
      'id_user': userId,
      'id_daftar': model.idDaftar,
      'id_bayar': model.idBayar
    };

    try {
      jsonResp = await HttpServices().httpPost('verifikasi-pembayaran', jsonReq);
    } on Exception catch (e) {
      print(e);
    }

    return jsonResp;
  }

  Future<Map> prosesUpdateHasil(RiwayatViewModel model) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Map jsonResp = {
      'rc': '999',
      'rcm': 'gagal default'
    };

    String userId = prefs.getString('user_id') ?? '';

    var jsonReq = {
      'id_user': userId,
      'id_daftar': model.idDaftar,
      'id_bayar': model.idBayar,
      'hasil_lab': model.pilihanHasil.name,
      'info': model.txtInfoTambahan.text
    };

    try {
      jsonResp = await HttpServices().httpPost('update-hasil', jsonReq);
    } on Exception catch (e) {
      print(e);
    }

    return jsonResp;
  }

  Future<Map> prosesAmbilHasilLab(RiwayatViewModel model) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Map jsonResp = {
      'rc': '999',
      'rcm': 'gagal default'
    };

    String userId = prefs.getString('user_id') ?? '';

    var jsonReq = {
      'id_user': userId,
      'id_daftar': model.idDaftar,
      'id_bayar': model.idBayar,
      'id_hasil': model.idHasil,
    };

    try {
      jsonResp = await HttpServices().httpPost('ambil-hasil-lab', jsonReq);
    } on Exception catch (e) {
      print(e);
    }

    return jsonResp;
  }
}