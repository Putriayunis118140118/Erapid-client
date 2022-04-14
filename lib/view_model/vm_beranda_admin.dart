
import 'package:dio/dio.dart';
import 'package:erapid_new/rute.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

class BerandaAdminViewModel extends BaseViewModel{
  late var jumlahPasien = '0';
  late var totalPPerempuan = '0';
  late var totalPLaki = '0';
  late var jumlahRTPCR = '0';
  late var jumlahAntigen = '0';
  late var jumlahAntibody = '0';
  late var jumlahPasienNegatif = '0';
  late var jumlahPasienPositif = '0';
  late var jumlahlunas = '0';

  List<Map> listMenu = [
    {
      'title': 'Beranda',
      'icon': '',
      'onPressed': () {
        Get.offAllNamed(routeBerandaAdminPage);
      }
    },
    {
      'title': 'Data Pasien',
      'icon': '',
      'onPressed': () {
        Get.offAllNamed(routePasienAdminPage);
      }
    },
    {
      'title': 'Reservasi Pasien',
      'icon': '',
      'onPressed': () {
        Get.offAllNamed(routePemesananAdminPage);
      }
    },
    {
      'title': 'Hasil Test Pasien',
      'icon': '',
      'onPressed': () {
        Get.offAllNamed(routeHasilAdminPage);
      }
    },
  ];

  Future<void> initBerandaAdmin() async{
    setBusy(true);
    var url = kReleaseMode ? 'https://erapid.herokuapp.com/card' : 'http://localhost:8090/card';
    
    try {
      var response = await Dio().get(url);
      print(response);

      print(response.data);

      jumlahPasien = response.data['pasien'].toString();
      totalPPerempuan = response.data['ppasien'].toString();
      totalPLaki = response.data['lpasien'].toString();
      jumlahRTPCR = response.data['jmlpcr'].toString();
      jumlahAntigen = response.data['jmlantigen'].toString();
      jumlahAntibody = response.data['jmlantibody'].toString();
      jumlahPasienNegatif = response.data['jmlnegatif'].toString();
      jumlahPasienPositif = response.data['jmlpositif'].toString();
      jumlahlunas = response.data['jmllunas'].toString();

      notifyListeners();
    } catch (e) {
      print(e);
    }
    setBusy(false);
  }
}