import 'package:dropdown_search/dropdown_search.dart';
import 'package:erapid_new/constants.dart';
import 'package:erapid_new/func/f_validation.dart';
import 'package:erapid_new/responsive.dart';
import 'package:erapid_new/rute.dart';
import 'package:erapid_new/view/components/button_widget.dart';
import 'package:erapid_new/view/components/text_widget.dart';
import 'package:erapid_new/view/components/tfield_widget.dart';
import 'package:erapid_new/view/components/utility_ui.dart';
import 'package:erapid_new/view_model/vm_reservasi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

class ViewReservasiPage extends StatelessWidget {
  const ViewReservasiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ReservasiViewModel>.reactive(
      viewModelBuilder: () => ReservasiViewModel(),
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
                    Container(
                      alignment: Alignment.centerRight,
                      width: 350,
                      child: ButtonWidget(
                        text: TextWidget(
                          desc: "Keluar",
                          textAlign: TextAlign.center,
                          style: MainTextStyle().textStyleButton,
                        ),
                        onPressed: () {
                          Get.offAllNamed(routeBerandaPage);
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget formPemesan(ReservasiViewModel model) {
    Future<DateTime?> openDatePicker() async {
      final DateTime? picked = await showDatePicker(
        initialDate: DateTime(2000, 1),
        initialEntryMode: DatePickerEntryMode.calendar,
        context: Get.context!,
        firstDate: DateTime(1930, 1),
        lastDate: DateTime.now(),
      );
      return picked;
    }

    return Container(
      width: 400,
      // height: 600,
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
              // TextWidget(
              //   desc: 'Daftar untuk:',
              //   textAlign: TextAlign.left,
              //   style: MainTextStyle().textStyleBody2,
              // ),
              // const SizedBox(
              //   height: defaultPadding - 10,
              // ),
              // Row(
              //   children: [
              //     Row(
              //       children: [
              //         Radio<PilihanDaftar>(
              //           value: PilihanDaftar.dirisendiri,
              //           groupValue: model.pilihanDaftar,
              //           onChanged: (PilihanDaftar? value) {
              //             model.pilihanDaftar = value!;
              //             model.notifyListeners();
              //           },
              //         ),
              //         TextWidget(
              //           desc: 'Diri Sendiri',
              //           textAlign: TextAlign.left,
              //           style: MainTextStyle().textStyleBody2,
              //         ),
              //       ],
              //     ),
              //     Row(
              //       children: [
              //         Radio<PilihanDaftar>(
              //           value: PilihanDaftar.oranglain,
              //           groupValue: model.pilihanDaftar,
              //           onChanged: (PilihanDaftar? value) {
              //             model.pilihanDaftar = value!;
              //             model.notifyListeners();
              //           },
              //         ),
              //         TextWidget(
              //           desc: 'Orang Lain',
              //           textAlign: TextAlign.left,
              //           style: MainTextStyle().textStyleBody2,
              //         ),
              //       ],
              //     ),
              //   ],
              // ),
              const SizedBox(
                height: defaultPadding,
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
                textHint: 'Masukkan NIK',
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
                desc: 'Nama Pemesan (Sesuai NIK)',
                textAlign: TextAlign.left,
                style: MainTextStyle().textStyleBody2,
              ),
              const SizedBox(
                height: defaultPadding - 10,
              ),
              TextFieldWidget(
                textHint: 'Masukkan Nama Pemesan',
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
                textHint: 'Masukkan Nomor Telephone',
                textController: model.txtNoHp,
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
              GestureDetector(
                onTap: () async {
                  DateTime? result = await openDatePicker();

                  if (result != null) {
                    String formattedDate =
                        DateFormat('dd-MMM-yyyy').format(result);
                    model.txtTgllhr.text = formattedDate;
                    model.notifyListeners();
                  }
                },
                child: AbsorbPointer(
                  child: TextFieldWidget(
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
                ),
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
                          model.pilihanJK = value!;
                          model.notifyListeners();
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
                          model.pilihanJK = value!;
                          model.notifyListeners();
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
      ),
    );
  }

  Widget formPemeriksaan(ReservasiViewModel model) {
    Future<DateTime?> openDatePicker() async {
      final DateTime? picked = await showDatePicker(
        initialDate: DateTime.now(),
        initialEntryMode: DatePickerEntryMode.calendar,
        context: Get.context!,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 30)),
      );
      return picked;
    }

    return Container(
      width: 400,
      // height: 600,
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
              DropdownSearch<String>(
                mode: Mode.MENU,
                items: const [
                  "RT-PCR",
                  "Rapid Test Antibody",
                  "Rapid Test Antigen"
                ],
                dropdownSearchDecoration: InputDecoration(
                  filled: true,
                  contentPadding: const EdgeInsets.all(10),
                  hintText: 'Pilih Jenis Test',
                  hintStyle: MainTextStyle()
                      .textStyleBody2
                      .copyWith(color: textHintColor),
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: borderColor,
                      width: 0.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: primaryColor,
                      width: 0.5,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: borderColor,
                      width: 0.5,
                    ),
                  ),
                ),
                onChanged: (value) {
                  model.txtJnsPeriksa.text = value ?? '';
                },
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
              GestureDetector(
                onTap: () async {
                  DateTime? result = await openDatePicker();

                  if (result != null) {
                    String formattedDate =
                        DateFormat('dd-MMM-yyyy').format(result);
                    model.txtTglPeriksa.text = formattedDate;
                    model.notifyListeners();
                  }
                },
                child: AbsorbPointer(
                  child: TextFieldWidget(
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
                ),
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
              DropdownSearch<String>(
                mode: Mode.MENU,
                items: const ["10:00 WIB", "10:30 WIB", "11:00 WIB", "11:30 WIB", "12:00 WIB", "14.00 WIB", "14:30 WIB", "15:00 WIB", "15:20 WIB"],
                dropdownSearchDecoration: InputDecoration(
                  filled: true,
                  contentPadding: const EdgeInsets.all(10),
                  hintText: 'Pilih Jenis Test',
                  hintStyle: MainTextStyle()
                      .textStyleBody2
                      .copyWith(color: textHintColor),
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: borderColor,
                      width: 0.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: primaryColor,
                      width: 0.5,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                      color: borderColor,
                      width: 0.5,
                    ),
                  ),
                ),
                onChanged: (value) {
                  model.txtJamPeriksa.text = value ?? '';
                },
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
                          model.pilihanBayar = value!;
                          model.notifyListeners();
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
                          model.pilihanBayar = value!;
                          model.notifyListeners();
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
                    desc: "Reservasi Sekarang",
                    textAlign: TextAlign.center,
                    style: MainTextStyle().textStyleButton,
                  ),
                  onPressed: () {
                    model.prosesReservasiTestCovid();

                    /* if (model.txtJnsPeriksa.text.isEmpty) {
                      print(model.txtJnsPeriksa.text);
                      prosesReservasi(
                        model.txtJnsPeriksa.text,
                        Get.offAllNamed('/reservasi-page');
                      } else {
                        String msg = ''; 
                      }),
                      if (model.txtJnsPeriksa == null) {
                        msg = msg + "Jenis Periksa dipilih\n";
                      }
                      showAlert(msg);
                      } */
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
