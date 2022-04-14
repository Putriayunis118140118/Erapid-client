import 'dart:convert';
import 'dart:typed_data';

import 'package:cool_alert/cool_alert.dart';
import 'package:erapid_new/services/reservasi_services.dart';
import 'package:erapid_new/services/riwayat_controller.dart';
import 'package:erapid_new/rute.dart';
import 'package:erapid_new/view/components/tfield_widget.dart';
import 'package:erapid_new/view_model/vm_riwayat.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:universal_html/js.dart' as js;

class ReservasiViewModel extends BaseViewModel {
  BuildContext context = Get.context!;

  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  TextEditingController txtNamaPasien = TextEditingController();
  TextEditingController txtNikPasien = TextEditingController();
  TextEditingController txtJk = TextEditingController();
  TextEditingController txtTgllhr = TextEditingController();
  TextEditingController txtNoHp = TextEditingController();

  TextEditingController txtJnsPeriksa = TextEditingController();
  TextEditingController txtTglPeriksa = TextEditingController();
  TextEditingController txtJamPeriksa = TextEditingController();

  late String statusHasil = '';
  late bool isHasil = false;

  PilihanDaftar pilihanDaftar = PilihanDaftar.dirisendiri;
  PilihanBayar pilihanBayar = PilihanBayar.cash;
  PilihanJK pilihanJK = PilihanJK.pria;

  String stsBayar = '';
  bool stsExpired = false;

  late String idDaftar = '';
  late String idPasien = '';
  late String idBayar = '';
  late String idHasil = '';

  late String hargaTestCovid = '';
  late String hargaTerbilang = '';
  
  Future<void> prosesReservasiTestCovid() async {
    Map jsonResp = await ReservasiController().prosesReservasi(this);

    if (jsonResp['rc'] == '000') {
      // await CoolAlert.show(
      //   context: context,
      //   type: CoolAlertType.success,
      //   text: 'Berhasil Melakukan Reservasi',
      // );

      idDaftar = jsonResp['id_daftar'];
      stsBayar = 'BELUM LUNAS';
      notifyListeners();
      Get.offAndToNamed(routeReservasiDetailPage, arguments: this);
    } else {
      CoolAlert.show(
        context: context,
        type: CoolAlertType.warning,
        text: jsonResp['rcm'],
      );
    }
  }

  Future<void> loadReservasi(ReservasiViewModel? model) async {
    var dt = DateTime.now();
    DateFormat dateFormat = DateFormat('yyyyMMdd');
    var tglsekarang = dateFormat.format(dt);

    if(model == null) { // jika setelah refresh halaman tidak kosong /error dgn isian default
      txtUsername.text = 'Ptryn';
      txtPassword.text = '12345';
      txtNamaPasien.text = 'Putri Ayuni';
      txtNikPasien.text = '118140118';
      txtJk.text = 'P';
      txtTgllhr.text = '19-06-2000';
      txtNoHp.text = 'dd';
      txtJnsPeriksa.text = 'ddsa';
      txtTglPeriksa.text = 'ddd';
      txtJamPeriksa.text = 'sss';
      pilihanDaftar = PilihanDaftar.dirisendiri;
      pilihanBayar = PilihanBayar.digital;
      pilihanJK = PilihanJK.pria;
      idDaftar = '12345';
      stsBayar = 'BELUM LUNAS';
    }else{
      txtUsername = model.txtUsername;
      txtPassword = model.txtPassword;
      txtNamaPasien = model.txtNamaPasien;
      txtNikPasien = model.txtNikPasien;
      txtJk = model.txtJk;
      txtTgllhr = model.txtTgllhr;
      txtNoHp = model.txtNoHp;
      txtJnsPeriksa = model.txtJnsPeriksa;
      txtTglPeriksa = model.txtTglPeriksa;
      txtJamPeriksa = model.txtJamPeriksa;
      pilihanDaftar = model.pilihanDaftar;
      pilihanBayar = model.pilihanBayar;
      pilihanJK = model.pilihanJK;
      idDaftar = model.idDaftar;
      idHasil = model.idHasil;
      idBayar = model.idBayar;
      stsBayar = model.stsBayar;
      statusHasil = model.statusHasil;
      hargaTestCovid = model.hargaTestCovid;
      hargaTerbilang = model.hargaTerbilang;

      if(statusHasil.toUpperCase() != 'BELUM TEST'){
        isHasil = true;
      }

      if(stsBayar == 'BELUM LUNAS' && double.parse(txtTglPeriksa.text) < double.parse(tglsekarang)){
        stsExpired = true;
      }
    }

    notifyListeners();
  }

  Future<void> unduhBuktiLab() async {
    RiwayatViewModel vm = RiwayatViewModel();
    vm.idBayar = idBayar;
    vm.idDaftar = idDaftar;
    vm.idHasil = idHasil;

    Map jsonResp = await RiwayatController().prosesAmbilHasilLab(vm);
    // print(jsonResp);
    if(jsonResp['rc'] == '000'){
      cetakStruk(jsonResp['konten']);
      notifyListeners();
    }else{
      CoolAlert.show(
        context: context,
        type: CoolAlertType.warning,
        text: jsonResp['rcm'],
      );
    }
  }

  void cetakStruk(String htmlStruk) async{
    js.context.callMethod('printHaha', [
      jsonEncode({'printable': htmlStruk, 'type': "raw-html"})
    ]);
  }

  Future<void> prosesKonfirmasi() async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png']
    );

    if (result != null) {
      PlatformFile file = result.files.first;

      if (kDebugMode) {
        print("Nama File: ${file.name}");
        // print(file.bytes);
        print("Size File: ${file.size}");
        print("Extensi: ${file.extension}");
      }

      ReservasiController controller = ReservasiController();

      var jsonResp = await controller.prosesPembayaran(this, file);
      if (kDebugMode) {
        print(jsonResp);
      }

      if(jsonResp['rc'] == '000'){
        CoolAlert.show(
          context: context,
          type: CoolAlertType.success,
          text: 'Konfirmasi Pembayaran kamu berhasil 😍\nSilahkan datang ke Rumah sakit tiara sesuai dengan tanggal dan jam',
        );
        stsBayar = 'LUNAS';

        notifyListeners();
      }else{
        CoolAlert.show(
          context: context,
          type: CoolAlertType.warning,
          text: jsonResp['rcm'],
        );
      }
    } else {
      // User canceled the picker
    }
  }

  String formatTanggal(String tgl){
    if(tgl.length == 8) {
      var strTgl = tgl.substring(6, 8) + "/" + tgl.substring(4, 6) + "/" +
          tgl.substring(0, 4);
      return strTgl;
    }
    return tgl;
  }

}

enum PilihanDaftar { dirisendiri, oranglain }

enum PilihanBayar { cash, digital }

enum PilihanJK { pria, wanita }

enum PilihanHasil {negatif, positif, lainnya}