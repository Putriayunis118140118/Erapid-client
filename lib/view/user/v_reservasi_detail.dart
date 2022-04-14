import 'package:erapid_new/constants.dart';
import 'package:erapid_new/rute.dart';
import 'package:erapid_new/view/components/button_widget.dart';
import 'package:erapid_new/view/components/text_widget.dart';
import 'package:erapid_new/view/components/utility_ui.dart';
import 'package:erapid_new/view_model/vm_reservasi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

class ViewReservasiDetailPage extends StatelessWidget {
  final ReservasiViewModel? viewModel;

  const ViewReservasiDetailPage({Key? key, required this.viewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ReservasiViewModel>.reactive(
      viewModelBuilder: () => ReservasiViewModel(),
      onModelReady: (model) => model.loadReservasi(viewModel), // ketika halaman diload pertama maka idjalankan fungsi loadnya
      builder: (context, model, child) => Scaffold(
        body: Container(
          color: CupertinoColors.white,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "${imgPath}main_logo.png",
                      height: 50,
                    ),
                    const SizedBox(
                      height: defaultPadding + 20,
                    ),
                    formDetailPemesanan(model),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget formDetailPemesanan(ReservasiViewModel model) {
    return Container(
      width: 400,
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: defaultPadding,
              ),
              TextWidget(
                  desc: 'Selamat!',
                  textAlign: TextAlign.center,
                  style: MainTextStyle().textStyleH4),
              TextWidget(
                desc: '... Reservasi kamu berhasil ...',
                textAlign: TextAlign.center,
                style: MainTextStyle()
                    .textStyleH4
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const Divider(
                color: Colors.black26,
              ),
              const SizedBox(
                height: defaultPadding + 10,
              ),
              TextWidget(
                desc:
                    'berikut adalah kode reservasi tes lab ${model.txtJnsPeriksa.text} kamu',
                textAlign: TextAlign.center,
                style: MainTextStyle().textStyleBody1,
                textOverflow: TextOverflow.visible,
              ),
              const SizedBox(
                height: defaultPadding - 10,
              ),
              TextWidget(
                desc: model.idDaftar,
                textAlign: TextAlign.center,
                style: MainTextStyle()
                    .textStyleH4
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: defaultPadding - 10,
              ),
              TextWidget(
                  desc:
                      'Tunjukan kode reservasi ini ke petugas klinik rumah sakit tiara',
                  textAlign: TextAlign.center,
                  textOverflow: TextOverflow.visible,
                  style: MainTextStyle().textStyleBody1),
              const SizedBox(
                height: defaultPadding,
              ),
              Row(
                children: [
                  const Expanded(
                    child: Divider(
                      color: Colors.black26,
                    ),
                  ),
                  TextWidget(
                      desc: 'Detail Reservasi',
                      textAlign: TextAlign.center,
                      textOverflow: TextOverflow.visible,
                      style: MainTextStyle().textStyleBody1),
                  const Expanded(
                    child: Divider(
                      color: Colors.black26,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: defaultPadding - 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                      desc: 'NIK Pemesan',
                      textAlign: TextAlign.center,
                      style: MainTextStyle().textStyleBody1),
                  TextWidget(
                      desc: model.txtNikPasien.text,
                      textAlign: TextAlign.center,
                      style: MainTextStyle().textStyleBody1),
                ],
              ),
              const SizedBox(
                height: defaultPadding - 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                      desc: 'Nama Pemesan',
                      textAlign: TextAlign.center,
                      style: MainTextStyle().textStyleBody1),
                  TextWidget(
                      desc: model.txtNamaPasien.text,
                      textAlign: TextAlign.center,
                      style: MainTextStyle().textStyleBody1),
                ],
              ),
              const SizedBox(
                height: defaultPadding - 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                      desc: 'Tanggal Reservasi',
                      textAlign: TextAlign.center,
                      style: MainTextStyle().textStyleBody1),
                  TextWidget(
                      desc: model.formatTanggal(model.txtTglPeriksa.text),
                      textAlign: TextAlign.center,
                      style: MainTextStyle().textStyleBody1),
                ],
              ),
              const SizedBox(
                height: defaultPadding - 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                      desc: 'Jam Reservasi',
                      textAlign: TextAlign.center,
                      style: MainTextStyle().textStyleBody1),
                  TextWidget(
                      desc: model.txtJamPeriksa.text,
                      textAlign: TextAlign.center,
                      style: MainTextStyle().textStyleBody1),
                ],
              ),
              const SizedBox(
                height: defaultPadding - 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                      desc: 'Metode Pembayaran',
                      textAlign: TextAlign.center,
                      style: MainTextStyle().textStyleBody1),
                  TextWidget(
                      desc: model.pilihanBayar.name,
                      textAlign: TextAlign.center,
                      style: MainTextStyle().textStyleBody1),
                ],
              ),
              const SizedBox(
                height: defaultPadding - 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                      desc: 'Jumlah Bayar',
                      textAlign: TextAlign.center,
                      style: MainTextStyle().textStyleBody1),
                  TextWidget(
                      desc: model.hargaTestCovid,
                      textAlign: TextAlign.center,
                      style: MainTextStyle().textStyleBody1),
                ],
              ),
              const SizedBox(
                height: defaultPadding - 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                      desc: 'Status Pembayaran',
                      textAlign: TextAlign.center,
                      style: MainTextStyle().textStyleBody1),
                  TextWidget(
                    desc: model.stsExpired ? 'EXPIRED' : model.stsBayar,
                    textAlign: TextAlign.center,
                    style: MainTextStyle()
                        .textStyleBody1
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: defaultPadding,
              ),
              Visibility(
                visible: model.stsExpired,
                child: TextWidget(
                  desc: 'Transaksi kamu gagal karena belum melakukan pembayaran sampai hari test 😢',
                  textAlign: TextAlign.center,
                  textOverflow: TextOverflow.visible,
                  style: MainTextStyle()
                      .textStyleBody1
                ),
              ),
              Visibility(
                visible: (model.pilihanBayar == PilihanBayar.digital &&
                        !model.stsExpired && model.stsBayar.toUpperCase() == 'BELUM LUNAS')
                    ? true
                    : false,
                child: Column(
                  children: [
                    const SizedBox(
                      height: defaultPadding,
                    ),
                    ButtonWidget(
                      text: TextWidget(
                        desc: "Konfirmasi Pembayaran",
                        textAlign: TextAlign.center,
                        style: MainTextStyle().textStyleButton,
                      ),
                      onPressed: () {
                        model.prosesKonfirmasi();
                      },
                    ),
                    const SizedBox(
                      height: defaultPadding,
                    ),
                    Row(
                      children: [
                        const Expanded(
                          child: Divider(
                            color: Colors.black26,
                          ),
                        ),
                        TextWidget(
                            desc: 'Atau',
                            textAlign: TextAlign.center,
                            textOverflow: TextOverflow.visible,
                            style: MainTextStyle().textStyleBody1),
                        const Expanded(
                          child: Divider(
                            color: Colors.black26,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: defaultPadding,
              ),
              ButtonWidget(
                text: TextWidget(
                  desc: "Kembali",
                  textAlign: TextAlign.center,
                  style: MainTextStyle().textStyleButton,
                ),
                onPressed: () {
                  Get.back();
                  Get.offAndToNamed(routeRiwayatPage);
                },
              ),
              const SizedBox(
                height: defaultPadding,
              ),
            ],
          ),
        ),
      ),
    );
  }
}