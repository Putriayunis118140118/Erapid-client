
import 'package:cool_alert/cool_alert.dart';
import 'package:erapid_new/model/pasien.dart';
import 'package:erapid_new/rute.dart';
import 'package:erapid_new/services/pasien_services.dart';
import 'package:erapid_new/view_model/vm_reservasi.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

class PasienViewModel extends BaseViewModel{
  BuildContext context = Get.context!;
  TextEditingController txtIdPasien = TextEditingController();
  TextEditingController txtNama = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtNoHp = TextEditingController();
  TextEditingController txtTglLahir = TextEditingController();
  TextEditingController txtJnsSex = TextEditingController();
  TextEditingController txtNikPasien = TextEditingController();
  TextEditingController txtCari = TextEditingController();
  String initTgl = '';

  bool readOnly = false;

  late List<Pasien> listPasien = [];
  late Pasien pasien = Pasien();

  PilihanJK pilihanJK = PilihanJK.pria;


  Future<void> init() async {
    setBusy(true);
    Map jsonResp = await PasienServices().prosesAmbilDataPasien(this);
    print(jsonResp);

    var listData = jsonResp['list_pasien'] as List;
    List<Pasien> dataPasien = listData.map((data) =>
        Pasien.fromJson(data)).toList();

    listPasien = dataPasien;

    notifyListeners();
    setBusy(false);
  }

  Future<void> initDetail(String? idPasien) async {
    setBusy(true);
    txtIdPasien.text = idPasien ?? 'PSN00003';

    Map jsonResp = await PasienServices().prosesAmbilDetailDataPasien(this);

    var listData = jsonResp['list_pasien'] as List;
    List<Pasien> dataPasien = listData.map((data) =>
        Pasien.fromJson(data)).toList();

    listPasien = dataPasien;
    Pasien pasien = listPasien[0];

    txtIdPasien.text = pasien.idPasien ?? '';
    txtNama.text = pasien.nama ?? '';
    txtEmail.text = pasien.email ?? '';
    txtNoHp.text = pasien.noHp ?? '';
    txtTglLahir.text = pasien.tglLahir ?? '';
    txtJnsSex.text = pasien.jnsSex ?? '';
    txtNikPasien.text = pasien.nikPasien ?? '';
    initTgl = pasien.tglLahir ?? '';

    txtTglLahir.text = DateFormat('dd-MMM-yyyy').format(DateTime.parse(txtTglLahir.text));

    if(pasien.jnsSex == 'Laki - laki'){
      pilihanJK = PilihanJK.pria;
    }else {
      pilihanJK = PilihanJK.wanita;
    }

    notifyListeners();
    setBusy(false);
  }

  Future<void> cariPasien(value) async {
    setBusy(true);
    Map jsonResp = await PasienServices().prosesAmbilDetailDataPasien(this);

    var listData = jsonResp['list_pasien'] as List;
    List<Pasien> dataPasien = listData.map((data) =>
        Pasien.fromJson(data)).toList();

    listPasien = dataPasien;

    notifyListeners();
    setBusy(false);
  }

  Future<void> editPasien() async {
    setBusy(true);
    Map jsonResp = await PasienServices().prosesEditDataPasien(this);

    if(jsonResp['rc'] == '000'){
      await CoolAlert.show(
        context: context,
        type: CoolAlertType.success,
        text: 'Edit Data Pasien Berhasil',
      );
    Get.offAllNamed(routePasienAdminPage); // Tambahan untuk perubahan route
    }else{
      CoolAlert.show(
        context: context,
        type: CoolAlertType.warning,
        text: 'Edit Data Pasien Gagal',
      );
    }

    setBusy(false);
  }

  Future<void> deletePasien() async {
    setBusy(true);
    Map jsonResp = await PasienServices().prosesDeleteDataPasien(this);

    if(jsonResp['rc'] == '000'){
      await CoolAlert.show(
        context: context,
        type: CoolAlertType.success,
        text: 'Hapus Data Pasien Berhasil',
      );

      Get.offAllNamed(routePasienAdminPage);
    }else{
      CoolAlert.show(
        context: context,
        type: CoolAlertType.warning,
        text: 'Hapus Data Pasien Gagal',
      );
    }

    setBusy(false);
  }

}