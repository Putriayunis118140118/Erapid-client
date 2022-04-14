
import 'dart:convert';

import 'package:cool_alert/cool_alert.dart';
import 'package:erapid_new/services/riwayat_controller.dart';
import 'package:erapid_new/rute.dart';
import 'package:erapid_new/view_model/vm_reservasi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:universal_html/js.dart' as js;

class RiwayatViewModel extends BaseViewModel{
  BuildContext context = Get.context!;
  late List<dynamic> listRiwayat;
  late Map detailRiwayat;
  late String idDaftar = '';
  late String idPasien = '';
  late String idBayar = '';
  late String idHasil = '';
  late String statusBayar = '';
  late String statusHasil = '';
  late bool isHasil = false;
  late bool isPembayaran = false;
  late bool visibleButton = false;

  TextEditingController txtCari = TextEditingController();
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
  TextEditingController txtInfoTambahan = TextEditingController();

  PilihanDaftar pilihanDaftar = PilihanDaftar.dirisendiri;
  PilihanBayar pilihanBayar = PilihanBayar.cash;
  PilihanJK pilihanJK = PilihanJK.pria;
  PilihanHasil pilihanHasil = PilihanHasil.lainnya;

  Future<void> init() async{
    await getRiwayatPasien();
  }

  Future<void> initDetail(String? idDaftar) async{
    idDaftar ??= 'DFR00001';

    this.idDaftar = idDaftar;
    await getRiwayatDetailPasien();
  }

  Future<void> initHasil() async{
    isHasil = true;
    await getRiwayatPasien();
  }

  Future<void> initBayar() async{
    isPembayaran = true;
    await getRiwayatPasien();
  }

  Future<void> getRiwayatPasien() async{
    setBusy(true);
    idDaftar = '';
    idPasien = '';
    Map jsonResp = await RiwayatController().prosesAmbilRiwayat(this);
    print(jsonResp);

    listRiwayat = jsonResp['list_riwayat'];
    notifyListeners();
    setBusy(false);
  }

  Future<void> getRiwayatDetailPasien() async{
    setBusy(true);
    idPasien = '';
    idBayar = '';
    visibleButton = false;
    Map jsonResp = await RiwayatController().prosesDetailAdminRiwayat(this);
    print(jsonResp);

    listRiwayat = jsonResp['list_riwayat'];
    detailRiwayat = jsonResp['list_riwayat']?[0] ?? {};

    txtUsername.text = '';
    txtPassword.text = '';
    txtNamaPasien.text = detailRiwayat['nm_pasien']?.toString()??'';
    txtNikPasien.text = detailRiwayat['nik_pasien']?.toString()??'';
    txtTgllhr.text = formatTanggal2(detailRiwayat['tgl_lahir']?.toString()??'');
    txtNoHp.text = detailRiwayat['hp_pasien']?.toString()??'';
    txtJnsPeriksa.text = detailRiwayat['jns_test']?.toString()??'';
    txtTglPeriksa.text = formatTanggal2(detailRiwayat['tgl_test']?.toString()??'');
    txtJamPeriksa.text = detailRiwayat['jam_test']?.toString()??'';
    idPasien = detailRiwayat['id_pasien']?.toString()??'';
    idBayar = detailRiwayat['id_bayar']?.toString()??'';
    idHasil = detailRiwayat['id_hasil']?.toString()??'';
    String jk = detailRiwayat['jns_sex']?.toString()??'';
    String metode = detailRiwayat['metode_bayar']?.toString()??'';
    statusBayar = detailRiwayat['sts_bayar']?.toString()??'';
    statusHasil = detailRiwayat['sts_hasil']?.toString()??'';

    if(jk == 'Laki - laki'){
      pilihanJK = PilihanJK.pria;
    }else{
      pilihanJK = PilihanJK.wanita;
    }

    if(metode == 'Digital'){
      pilihanBayar = PilihanBayar.digital;
    }else{
      pilihanBayar = PilihanBayar.cash;
    }

    if(statusBayar.toUpperCase() == 'Menunggu Konfirmasi Admin'.toUpperCase()){
      visibleButton = true;
    }

    if((statusBayar.toUpperCase() == 'Belum Bayar'.toUpperCase() || 
    statusBayar.toUpperCase() == 'Belum Lunas'.toUpperCase()) && pilihanBayar == PilihanBayar.digital){
      visibleButton = true;
    }

    if(statusBayar.toUpperCase() == 'Lunas'.toUpperCase() && pilihanBayar == PilihanBayar.digital){
      visibleButton = true;
    }

    notifyListeners();
    setBusy(false);
  }

  Future<void> getDetailRiwayatPasien() async{
    Map jsonResp = await RiwayatController().prosesDetailRiwayat(this);
    detailRiwayat = jsonResp['list_riwayat'][0];
    print(detailRiwayat);

    ReservasiViewModel vm = ReservasiViewModel();
    vm.txtUsername.text = '';
    vm.txtPassword.text = '';
    vm.txtNamaPasien.text = detailRiwayat['nm_pasien'].toString();
    vm.txtNikPasien.text = detailRiwayat['nik_pasien'].toString();
    vm.txtJk.text = '';
    vm.txtTgllhr.text = '';
    vm.txtNoHp.text = '';
    vm.txtJnsPeriksa.text = detailRiwayat['jns_test'].toString();
    vm.txtTglPeriksa.text = detailRiwayat['tgl_test'].toString();
    vm.txtJamPeriksa.text = detailRiwayat['jam_test'].toString();
    vm.stsBayar = detailRiwayat['sts_bayar'] ?? '';
    vm.idHasil = detailRiwayat['id_hasil'] ?? '';
    vm.idBayar = detailRiwayat['id_bayar'] ?? '';
    vm.idDaftar = idDaftar.toString();
    vm.statusHasil = detailRiwayat['sts_hasil'] ?? '';
    vm.hargaTestCovid = detailRiwayat['harga'] ?? ''; //jika kosong default tidak rusak
    vm.hargaTerbilang = detailRiwayat['denom'] ?? '';

    statusHasil = vm.statusHasil;
    
    if(detailRiwayat['tipe_bayar']== 'Cash') {
      vm.pilihanBayar = PilihanBayar.cash;
    }else{
      vm.pilihanBayar = PilihanBayar.digital;
    }

    print("MASUK : $statusHasil");
    if(statusHasil.toUpperCase() == 'BELUM TEST' || statusHasil == ''){
      Get.offAllNamed(routeReservasiDetailPage, arguments: vm);
    }else{
      Get.offAllNamed(routeReservasiHasilPage, arguments: vm);
    }
  }

  Future<void> getDetailRiwayatAdminPasien() async{
    Map jsonResp = await RiwayatController().prosesDetailRiwayat(this);
    detailRiwayat = jsonResp['list_riwayat'][0];

    ReservasiViewModel vm = ReservasiViewModel();
    vm.txtUsername.text = '';
    vm.txtPassword.text = '';
    vm.txtNamaPasien.text = detailRiwayat['nm_pasien'].toString();
    vm.txtNikPasien.text = detailRiwayat['nik_pasien'].toString();
    vm.txtJk.text = '';
    vm.txtTgllhr.text = '';
    vm.txtNoHp.text = '';
    vm.txtJnsPeriksa.text = detailRiwayat['jns_test'].toString();
    vm.txtTglPeriksa.text = detailRiwayat['tgl_test'].toString();
    vm.txtJamPeriksa.text = detailRiwayat['jam_test'].toString();
    vm.stsBayar = detailRiwayat['sts_bayar'];

    if(detailRiwayat['tipe_bayar']== 'Cash') {
      vm.pilihanBayar = PilihanBayar.cash;
    }else{
      vm.pilihanBayar = PilihanBayar.digital;
    }
    vm.idDaftar = idDaftar.toString();

    Get.offAllNamed(routePemesananDetailAdminPage, arguments: idDaftar);
  }

  Future<void> getDetailHasilAdminPasien() async{
    Map jsonResp = await RiwayatController().prosesDetailRiwayat(this);
    detailRiwayat = jsonResp['list_riwayat'][0];

    ReservasiViewModel vm = ReservasiViewModel();
    vm.txtUsername.text = '';
    vm.txtPassword.text = '';
    vm.txtNamaPasien.text = detailRiwayat['nm_pasien'].toString();
    vm.txtNikPasien.text = detailRiwayat['nik_pasien'].toString();
    vm.txtJk.text = '';
    vm.txtTgllhr.text = '';
    vm.txtNoHp.text = '';
    vm.txtJnsPeriksa.text = detailRiwayat['jns_test'].toString();
    vm.txtTglPeriksa.text = detailRiwayat['tgl_test'].toString();
    vm.txtJamPeriksa.text = detailRiwayat['jam_test'].toString();
    vm.stsBayar = detailRiwayat['sts_bayar'];

    if(detailRiwayat['tipe_bayar']== 'Cash') {
      vm.pilihanBayar = PilihanBayar.cash;
    }else{
      vm.pilihanBayar = PilihanBayar.digital;
    }
    vm.idDaftar = idDaftar.toString();

    Get.offAllNamed(routeHasilDetailAdminPage, arguments: idDaftar);
  }

  Future<void> updateStatusPembayaran() async {
    Map jsonResp = await RiwayatController().prosesKonfrimAdmin(this);

    if(jsonResp['rc'] == '000'){
      CoolAlert.show(
        context: context,
        type: CoolAlertType.warning,
        text: 'Update Status Pembayaran Berhasil',
      );

      statusBayar = 'LUNAS';
      notifyListeners();
    }else{
      CoolAlert.show(
        context: context,
        type: CoolAlertType.warning,
        text: jsonResp['rcm'],
      );
    }
  }

  Future<void> updateStatusHasil() async {
    Map jsonResp = await RiwayatController().prosesUpdateHasil(this);

    if(jsonResp['rc'] == '000'){
      CoolAlert.show(
        context: context,
        type: CoolAlertType.warning,
        text: 'Update Status Lab Berhasil',
      );

      statusBayar = 'LUNAS';
      statusHasil = pilihanHasil.name;
      idHasil = jsonResp['id_hasil'];
      notifyListeners();
    }else{
      CoolAlert.show(
        context: context,
        type: CoolAlertType.warning,
        text: jsonResp['rcm'],
      );
    }
  }

  Future<void> lihatHasilLab() async {
    Map jsonResp = await RiwayatController().prosesAmbilHasilLab(this);
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

  String formatTanggal(String tgl, String jam) {
    var formatbaru = "${tgl.substring(6, 8)}/${tgl.substring(4, 6)}/${tgl.substring(0, 4)} $jam WIB";
    return formatbaru;
  }

  String formatTanggal2(String tgl) {
    try{
      var formatbaru = "${tgl.substring(6, 8)}/${tgl.substring(4, 6)}/${tgl.substring(0, 4)}";
      return formatbaru;
    }catch (err){
      return '';
    }
  }
}