import 'package:data_table_2/data_table_2.dart';
import 'package:erapid_new/constants.dart';
import 'package:erapid_new/func/f_validation.dart';
import 'package:erapid_new/view/components/button_widget.dart';
import 'package:erapid_new/view/components/side_menu.dart';
import 'package:erapid_new/view/components/text_widget.dart';
import 'package:erapid_new/view/components/tfield_widget.dart';
import 'package:erapid_new/view/components/utility_ui.dart';
import 'package:erapid_new/view_model/vm_beranda_admin.dart';
import 'package:erapid_new/view_model/vm_pasien.dart';
import 'package:erapid_new/view_model/vm_reservasi.dart';
import 'package:erapid_new/view_model/vm_riwayat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

class ViewPasienDetailAdminPage extends StatelessWidget {
  final String? idPasien;
  const ViewPasienDetailAdminPage({Key? key, this.idPasien}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BerandaAdminViewModel>.reactive(
      viewModelBuilder: () => BerandaAdminViewModel(),
      builder: (context, model, child) => Scaffold(
        // key: context.read<MenuController>().scaffoldKey,
        drawer: SideMenu(model: model),
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SideMenu(model: model),
              ),
              Expanded(
                  flex: 5,
                  child: viewPasien()
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget viewPasien(){
    return ViewModelBuilder<PasienViewModel>.reactive(
      viewModelBuilder: () => PasienViewModel(),
      onModelReady: (model) => model.initDetail(idPasien),
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
                      offset:
                      const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      desc: 'Data Detail Pasien',
                      textAlign: TextAlign.center,
                      style: MainTextStyle()
                          .textStyleH4
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: defaultPadding,),
              Container(
                height: 550,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset:
                      const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        TextWidget(
                            desc: 'Data Pasien',
                            textAlign: TextAlign.center,
                            style: MainTextStyle()
                                .textStyleBody1
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        formPasien1(model),
                        const SizedBox(
                          width: 25,
                        ),
                        formPasien2(model)
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: defaultPadding,),
            ],
          ),
        ),
      ),
    );
  }

  Widget formPasien1(PasienViewModel model){
    Future<DateTime?> openDatePicker() async {
      final DateTime? picked = await showDatePicker(
        initialDate: DateTime.parse(model.initTgl),
        initialEntryMode: DatePickerEntryMode.calendar,
        context: Get.context!,
        firstDate: DateTime(1930, 1),
        lastDate: DateTime.now(),
      );
      return picked;
    }

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
              readOnly: model.readOnly,
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
              desc: 'Nama Pasien',
              textAlign: TextAlign.left,
              style: MainTextStyle().textStyleBody2,
            ),
            const SizedBox(
              height: defaultPadding - 10,
            ),
            TextFieldWidget(
              readOnly: model.readOnly,
              textHint: 'Nama Pasien',
              textController: model.txtNama,
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
                  model.txtTglLahir.text = formattedDate;
                  model.notifyListeners();
                }
              },
              child: AbsorbPointer(
                child: TextFieldWidget(
                  readOnly: true,
                  textHint: 'Masukkan Tanggal Lahir',
                  textController: model.txtTglLahir,
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
    );
  }

  Widget formPasien2(PasienViewModel model){
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
            const SizedBox(
              height: defaultPadding + 10,
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
              readOnly: model.readOnly,
              textHint: 'Nomor Telephone',
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
              desc: 'Email',
              textAlign: TextAlign.left,
              style: MainTextStyle().textStyleBody2,
            ),
            const SizedBox(
              height: defaultPadding - 10,
            ),
            TextFieldWidget(
              readOnly: model.readOnly,
              textHint: 'Email Pasien',
              textController: model.txtEmail,
              inputFormatters: CoreValidation.formatTextNormal(),
              textAlign: TextAlign.left,
              textInputType: CoreValidation.typeString(),
              isValidation: true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validationType: ValidationType.normalType,
              validationLength: 2,
            ),
            const SizedBox(
              height: defaultPadding + 20,
            ),
            Container(
              alignment: Alignment.centerRight,
              width: 350,
              child: ButtonWidget(
                text: TextWidget(
                  desc: "Simpan Perubahan",
                  textAlign: TextAlign.center,
                  style: MainTextStyle().textStyleButton,
                ),
                onPressed: () {
                  model.editPasien();
                },
              ),
            ),

            const SizedBox(
              height: defaultPadding,
            ),
          ],
        ),
      ),
    );
  }
}
