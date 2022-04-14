
import 'package:erapid_new/view/admin/v_dashboard.dart';
import 'package:erapid_new/view/admin/v_detail_hasil.dart';
import 'package:erapid_new/view/admin/v_detail_pasien.dart';
import 'package:erapid_new/view/admin/v_detail_pemesanan.dart';
import 'package:erapid_new/view/admin/v_hasil.dart';
import 'package:erapid_new/view/admin/v_pasien.dart';
import 'package:erapid_new/view/admin/v_pemesanan.dart';
import 'package:erapid_new/view/user/v_beranda.dart';
import 'package:erapid_new/view/user/v_ganti_pass.dart';
import 'package:erapid_new/view/user/v_konfrim_email.dart';
import 'package:erapid_new/view/user/v_pesan_lupapass.dart';
import 'package:erapid_new/view/user/v_registrasi.dart';
import 'package:erapid_new/view/user/v_reservasi_hasil_detail.dart';
import 'package:erapid_new/view/v_landing.dart';
import 'package:erapid_new/view/v_login.dart';
import 'package:erapid_new/view/user/v_reservasi.dart';
import 'package:erapid_new/view/user/v_reservasi_detail.dart';
import 'package:erapid_new/view/user/v_riwayat.dart';
import 'package:get/get.dart';

String routeMain = "/";
String routeLoginPage = "/login-page";
String routeKonfrimEmail = "/konfrim-email";
String routePesanKonfrimEmail = "/pesan-lupa-pass";
String routeBerandaPage = "/beranda-page";
String routeRiwayatPage = "/riwayat-page";
String routeRegistrasiPage = "/registrasi-page";
String routeReservasiPage = '/reservasi-page';
String routeReservasiDetailPage = '/reservasi-page/detail';
String routeReservasiHasilPage = '/reservasi-page/hasil';
String routeBerandaAdminPage = '/dashboard-admin-page';
String routePemesananAdminPage = '/pemesanan-admin-page';
String routePasienAdminPage = '/pasien-admin-page';
String routePasienDetailAdminPage = '$routePasienAdminPage/detail';
String routePemesananDetailAdminPage = '$routePemesananAdminPage/detail';
String routeHasilAdminPage = '/hasil-admin-page';
String routeHasilDetailAdminPage = '$routeHasilAdminPage/detail';

List<GetPage> listRoute = [
  GetPage(
    name: routeMain,
    page: () => const ViewLandingPage(),
  ),
  GetPage(
    name: routeLoginPage,
    page: () => const ViewLoginPage(),
  ),
  GetPage(
    name: routeKonfrimEmail,
    page: () => const ViewKonfrimMailPage(),
  ),
  GetPage(
    name: routePesanKonfrimEmail,
    page: () => const ViewPesanLupaPass(),
  ),
  GetPage(
    name: '/ganti-password/:sesiUrl',
    page: () => const ViewGantiPassPage(),
  ),
  GetPage(
    name: routeRegistrasiPage,
    page: () => const ViewRegistrasiPage(),
  ),
  GetPage(
    name: routeReservasiPage,
    page: () => const ViewReservasiPage(),
  ),
  GetPage(
    name: routeReservasiDetailPage,
    page: () => ViewReservasiDetailPage(viewModel: Get.arguments),
  ),
  GetPage(
    name: routeReservasiHasilPage,
    page: () => ViewReservasiHasilDetailPage(viewModel: Get.arguments),
  ),
  GetPage(
    name: routeBerandaPage,
    page: () => const ViewBerandaUserPage(),
  ),
  GetPage(
    name: routeRiwayatPage,
    page: () => const ViewRiwayatPage(),
  ),
  GetPage(
    name: routeBerandaAdminPage,
    page: () => const ViewDashboardPage(),
  ),
  GetPage(
    name: routePemesananAdminPage,
    page: () => const ViewPemesananAdminPage(),
  ),
  GetPage(
    name: routePemesananDetailAdminPage,
    page: () => ViewPemesananDetailAdminPage(idDaftar: Get.arguments,),
  ),
  GetPage(
    name: routeHasilAdminPage,
    page: () => const ViewHasilAdminPage(),
  ),
  GetPage(
    name: routeHasilDetailAdminPage,
    page: () => ViewHasilDetailAdminPage(idDaftar: Get.arguments,),
  ),
  GetPage(
    name: routePasienAdminPage,
    page: () => const ViewPasienAdminPage(),
  ),
  GetPage(
    name: routePasienDetailAdminPage,
    page: () => ViewPasienDetailAdminPage(idPasien: Get.arguments),
  )
];