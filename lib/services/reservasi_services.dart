import 'dart:convert';

import 'package:erapid_new/services/http_services.dart';
import 'package:erapid_new/view_model/vm_login.dart';
import 'package:erapid_new/view_model/vm_registrasi.dart';
import 'package:erapid_new/view_model/vm_reservasi.dart';
import 'package:file_picker/file_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReservasiController{
  Future<Map> prosesReservasi(ReservasiViewModel model) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Map jsonResp = {
      'rc': '999',
      'rcm': 'gagal default'
    };

    String userId = prefs.getString('user_id') ?? '';

    var jsonReq = {
      'id_user': userId,
      'id_pasien': '',
      'nik': model.txtNikPasien.text,
      'nama': model.txtNamaPasien.text,
      'tgllhr': model.txtTgllhr.text,
      'nohp': model.txtNoHp.text,
      'jenis_test': model.txtJnsPeriksa.text,
      'tgl_test': model.txtTglPeriksa.text,
      'waktu_test': model.txtJamPeriksa.text,
      'pilihanBayar': model.pilihanBayar.name,
      'pilihanDaftar': model.pilihanDaftar.name,
      'jk': model.pilihanJK.name
    };

    try {
      jsonResp = await HttpServices().httpPost('reservasi', jsonReq);
    } on Exception catch (e) {
      print(e);
    }

    return jsonResp;
  }

  Future<Map> prosesPembayaran(ReservasiViewModel model, PlatformFile file) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Map jsonResp = {
      'rc': '999',
      'rcm': 'gagal default'
    };

    String userId = prefs.getString('user_id') ?? '';
    String filebytes = base64.encode(file.bytes!.toList());

    var jsonReq = {
      'id_user': userId,
      'id_daftar': model.idDaftar,
      'filename': "${model.idDaftar}.${file.extension}",
      'filebytes': filebytes
    };

    try {
      jsonResp = await HttpServices().httpPost('konfirmasi-pembayaran', jsonReq);
    } on Exception catch (e) {
      print(e);
    }

    return jsonResp;
  }
}