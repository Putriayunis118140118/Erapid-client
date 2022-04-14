import 'package:data_table_2/data_table_2.dart';
import 'package:erapid_new/constants.dart';
import 'package:erapid_new/services/MenuController.dart';
import 'package:erapid_new/func/f_validation.dart';
import 'package:erapid_new/responsive.dart';
import 'package:erapid_new/rute.dart';
import 'package:erapid_new/view/components/button_widget.dart';
import 'package:erapid_new/view/components/side_menu.dart';
import 'package:erapid_new/view/components/text_widget.dart';
import 'package:erapid_new/view/components/tfield_widget.dart';
import 'package:erapid_new/view/components/utility_ui.dart';
import 'package:erapid_new/view_model/vm_beranda_admin.dart';
import 'package:erapid_new/view_model/vm_reservasi.dart';
import 'package:erapid_new/view_model/vm_riwayat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/src/provider.dart';
import 'package:stacked/stacked.dart';

class ViewPemesananDetailAdminPage extends StatelessWidget {
  final String? idDaftar;
  const ViewPemesananDetailAdminPage({Key? key, this.idDaftar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BerandaAdminViewModel>.reactive(
      viewModelBuilder: () => BerandaAdminViewModel(),
      builder: (context, model, child) => Scaffold(
        drawer: SideMenu(model: model),
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SideMenu(model: model),
              ),
              Expanded(flex: 5, child: viewDetailPemesanan()),
            ],
          ),
        ),
      ),
    );
  }

  Widget viewDetailPemesanan() {
    return ViewModelBuilder<RiwayatViewModel>.reactive(
      viewModelBuilder: () => RiwayatViewModel(),
      onModelReady: (model) => model.initDetail(idDaftar),
      builder: (context, model, child) => SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              Container(
                height: 70,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 4,
                      offset: const Offset(0, 3), 
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      desc: 'Detail Pemesanan',
                      textAlign: TextAlign.center,
                      style: MainTextStyle()
                          .textStyleH4
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: defaultPadding,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: model.isBusy
                    ? Column(
                        children: const [
                          CupertinoActivityIndicator(
                            radius: 15,
                          )
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            desc: 'Informasi Pemesanan',
                            textAlign: TextAlign.left,
                            style: MainTextStyle().textStyleSubtitle1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextWidget(
                                    desc:
                                        'Nomor Pendaftaran/Nomor Reservasi: ${model.idDaftar}',
                                    textAlign: TextAlign.left,
                                    style: MainTextStyle().textStyleBody1,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextWidget(
                                    desc:
                                        'ID Pasien/Nama Pasien: ${model.idPasien}/${model.txtNamaPasien.text}',
                                    textAlign: TextAlign.left,
                                    style: MainTextStyle().textStyleBody1,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextWidget(
                                    desc:
                                        'ID Bayar/Tipe Bayar: ${model.idBayar}/${model.pilihanBayar.name}',
                                    textAlign: TextAlign.left,
                                    style: MainTextStyle().textStyleBody1,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextWidget(
                                    desc:
                                    'Status Pembayaran: ${model.statusBayar}',
                                    textAlign: TextAlign.left,
                                    style: MainTextStyle().textStyleBody1,
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 200,
                                height: 30,
                                child: ButtonWidget(
                                  text: TextWidget(
                                    desc: "Lihat Bukti Pembayaran",
                                    textAlign: TextAlign.center,
                                    style: MainTextStyle()
                                        .textStyleBody1
                                        .copyWith(color: CupertinoColors.white),
                                  ),
                                  onPressed: model.visibleButton
                                      ? () async {
                                          await showDialog(
                                              context: context,
                                              builder: (_) => ImageDialog(
                                                  idBayar: model.idBayar),
                                          );
                                        }
                                      : null,
                                ),
                              ),
                            ],
                          ),
                          const Divider(
                            color: Colors.black26,
                          ),
                          if (Responsive.isDesktop(context) ||
                              Responsive.isTablet(context))
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                formPemesan(model),
                                const SizedBox(
                                  width: 25,
                                ),
                                formPemeriksaan(model)
                              ],
                            ),
                          if (Responsive.isMobile(context)) formPemesan(model),
                          if (Responsive.isMobile(context))
                            const SizedBox(
                              height: 25,
                            ),
                          if (Responsive.isMobile(context)) formPemesan(model),
                          const SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
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

  Widget formPemesan(RiwayatViewModel model) {
    return SizedBox(
      width: 400,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: defaultPadding,
            ),
            TextWidget(
              desc: 'Informasi Pemesan',
              textAlign: TextAlign.center,
              style: MainTextStyle()
                  .textStyleH4
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: defaultPadding + 10,
            ),
            TextWidget(
              desc: 'NIK (Nomor Induk Kependudukan)',
              textAlign: TextAlign.left,
              style: MainTextStyle().textStyleBody2,
            ),
            const SizedBox(
              height: defaultPadding - 10,
            ),
            TextFieldWidget(
              readOnly: true,
              textHint: 'NIK Pasien',
              textController: model.txtNikPasien,
              inputFormatters: CoreValidation.formatPhone(),
              textAlign: TextAlign.left,
              textInputType: CoreValidation.typeNumber(),
              isValidation: true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validationType: ValidationType.normalType,
              validationLength: 2,
            ),
            const SizedBox(
              height: defaultPadding,
            ),
            TextWidget(
              desc: 'Nama Pemesan',
              textAlign: TextAlign.left,
              style: MainTextStyle().textStyleBody2,
            ),
            const SizedBox(
              height: defaultPadding - 10,
            ),
            TextFieldWidget(
              readOnly: true,
              textHint: 'Nama Pemesan',
              textController: model.txtNamaPasien,
              inputFormatters: CoreValidation.formatTextNormal(),
              textAlign: TextAlign.left,
              textInputType: CoreValidation.typeString(),
              isValidation: true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validationType: ValidationType.normalType,
              validationLength: 2,
            ),
            const SizedBox(
              height: defaultPadding,
            ),
            TextWidget(
              desc: 'Nomor Telephone',
              textAlign: TextAlign.left,
              style: MainTextStyle().textStyleBody2,
            ),
            const SizedBox(
              height: defaultPadding - 10,
            ),
            TextFieldWidget(
              readOnly: true,
              textHint: 'Nomor Telephone',
              textController: model.txtUsername,
              inputFormatters: CoreValidation.formatTextNormal(),
              textAlign: TextAlign.left,
              textInputType: CoreValidation.typeString(),
              isValidation: true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validationType: ValidationType.normalType,
              validationLength: 2,
            ),
            const SizedBox(
              height: defaultPadding,
            ),
            TextWidget(
              desc: 'Tanggal Lahir',
              textAlign: TextAlign.left,
              style: MainTextStyle().textStyleBody2,
            ),
            const SizedBox(
              height: defaultPadding - 10,
            ),
            TextFieldWidget(
              readOnly: true,
              textHint: 'Masukkan Tanggal Lahir',
              textController: model.txtTgllhr,
              inputFormatters: CoreValidation.formatTextNormal(),
              textAlign: TextAlign.left,
              textInputType: CoreValidation.typeString(),
              isValidation: true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validationType: ValidationType.normalType,
              validationLength: 2,
            ),
            const SizedBox(
              height: defaultPadding,
            ),
            TextWidget(
              desc: 'Jenis Kelamin',
              textAlign: TextAlign.left,
              style: MainTextStyle().textStyleBody2,
            ),
            const SizedBox(
              height: defaultPadding - 10,
            ),
            Row(
              children: [
                Row(
                  children: [
                    Radio<PilihanJK>(
                      value: PilihanJK.pria,
                      groupValue: model.pilihanJK,
                      onChanged: (PilihanJK? value) {
                        // model.pilihanJK = value!;
                        // model.notifyListeners();
                      },
                    ),
                    TextWidget(
                      desc: 'Laki-Laki',
                      textAlign: TextAlign.left,
                      style: MainTextStyle().textStyleBody2,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Radio<PilihanJK>(
                      value: PilihanJK.wanita,
                      groupValue: model.pilihanJK,
                      onChanged: (PilihanJK? value) {
                        // model.pilihanJK = value!;
                        // model.notifyListeners();
                      },
                    ),
                    TextWidget(
                      desc: 'Wanita',
                      textAlign: TextAlign.left,
                      style: MainTextStyle().textStyleBody2,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: defaultPadding,
            ),
          ],
        ),
      ),
    );
  }

  Widget formPemeriksaan(RiwayatViewModel model) {
    return SizedBox(
      width: 400,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: defaultPadding,
              ),
              TextWidget(
                desc: 'Informasi Pemeriksaan',
                textAlign: TextAlign.center,
                style: MainTextStyle()
                    .textStyleH4
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: defaultPadding + 10,
              ),
              TextWidget(
                desc: 'Jenis Test',
                textAlign: TextAlign.left,
                style: MainTextStyle().textStyleBody2,
              ),
              const SizedBox(
                height: defaultPadding - 10,
              ),
              TextFieldWidget(
                readOnly: true,
                textHint: 'Jenis Pemeriksaan',
                textController: model.txtJnsPeriksa,
                inputFormatters: CoreValidation.formatTextNormal(),
                textAlign: TextAlign.left,
                textInputType: CoreValidation.typeString(),
                isValidation: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validationType: ValidationType.normalType,
                validationLength: 2,
              ),
              const SizedBox(
                height: defaultPadding,
              ),
              TextWidget(
                desc: 'Tanggal Pemeriksaan',
                textAlign: TextAlign.left,
                style: MainTextStyle().textStyleBody2,
              ),
              const SizedBox(
                height: defaultPadding - 10,
              ),
              TextFieldWidget(
                readOnly: true,
                textHint: 'Masukkan Tanggal Pemeriksaan',
                textController: model.txtTglPeriksa,
                inputFormatters: CoreValidation.formatTextNormal(),
                textAlign: TextAlign.left,
                textInputType: CoreValidation.typeString(),
                isValidation: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validationType: ValidationType.normalType,
                validationLength: 2,
              ),
              const SizedBox(
                height: defaultPadding,
              ),
              TextWidget(
                desc: 'Waktu Pemeriksaan',
                textAlign: TextAlign.left,
                style: MainTextStyle().textStyleBody2,
              ),
              const SizedBox(
                height: defaultPadding - 10,
              ),
              TextFieldWidget(
                readOnly: true,
                textHint: 'Jam Pemeriksaan',
                textController: model.txtJamPeriksa,
                inputFormatters: CoreValidation.formatTextNormal(),
                textAlign: TextAlign.left,
                textInputType: CoreValidation.typeString(),
                isValidation: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validationType: ValidationType.normalType,
                validationLength: 2,
              ),
              const SizedBox(
                height: defaultPadding,
              ),
              TextWidget(
                desc: 'Metode Pembayaran',
                textAlign: TextAlign.left,
                style: MainTextStyle().textStyleBody2,
              ),
              const SizedBox(
                height: defaultPadding - 10,
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Radio<PilihanBayar>(
                        value: PilihanBayar.cash,
                        groupValue: model.pilihanBayar,
                        onChanged: (PilihanBayar? value) {
                          // model.pilihanBayar = value!;
                          // model.notifyListeners();
                        },
                      ),
                      TextWidget(
                        desc: 'Cash',
                        textAlign: TextAlign.left,
                        style: MainTextStyle().textStyleBody2,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Radio<PilihanBayar>(
                        value: PilihanBayar.digital,
                        groupValue: model.pilihanBayar,
                        onChanged: (PilihanBayar? value) {
                          // model.pilihanBayar = value!;
                          // model.notifyListeners();
                        },
                      ),
                      TextWidget(
                        desc: 'Digital',
                        textAlign: TextAlign.left,
                        style: MainTextStyle().textStyleBody2,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: defaultPadding + 20,
              ),
              Container(
                alignment: Alignment.centerRight,
                width: 350,
                child: ButtonWidget(
                  text: TextWidget(
                    desc: "Update Status Pembayaran",
                    textAlign: TextAlign.center,
                    style: MainTextStyle().textStyleButton,
                  ),
                  onPressed: model.statusBayar.toUpperCase() == 'LUNAS' ? null :
                      () {
                    model.updateStatusPembayaran();
                  },
                ),
              ),
              const SizedBox(
                height: defaultPadding + 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageDialog extends StatelessWidget {
  final String idBayar;
  const ImageDialog({Key? key, required this.idBayar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 900,
        height: 800,
        // decoration: BoxDecoration(
        //     image: DecorationImage(
        //         image: Image.network('http://127.0.0.1:8090/erapid/$idBayar', scale: 0.1),
        //         fit: BoxFit.cover),
        // ),
        child: Image.network(
          'http://127.0.0.1:8090/erapid/$idBayar',
          scale: 1,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
