import 'package:data_table_2/data_table_2.dart';
import 'package:erapid_new/constants.dart';
import 'package:erapid_new/func/f_validation.dart';
import 'package:erapid_new/rute.dart';
import 'package:erapid_new/view/components/button_widget.dart';
import 'package:erapid_new/view/components/side_menu.dart';
import 'package:erapid_new/view/components/text_widget.dart';
import 'package:erapid_new/view/components/tfield_widget.dart';
import 'package:erapid_new/view/components/utility_ui.dart';
import 'package:erapid_new/view_model/vm_beranda_admin.dart';
import 'package:erapid_new/view_model/vm_pasien.dart';
import 'package:erapid_new/view_model/vm_riwayat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

class ViewPasienAdminPage extends StatelessWidget {
  const ViewPasienAdminPage({Key? key}) : super(key: key);

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
              Expanded(flex: 5, child: viewPasien()),
            ],
          ),
        ),
      ),
    );
  }

  Widget viewPasien() {
    return ViewModelBuilder<PasienViewModel>.reactive(
      viewModelBuilder: () => PasienViewModel(),
      onModelReady: (model) => model.init(),
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
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      desc: 'Data Pasien',
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
                height: 550,
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        TextWidget(
                            desc: 'Cari Pasien: ',
                            textAlign: TextAlign.center,
                            style: MainTextStyle().textStyleBody1),
                      ],
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      width: ScreenUtil().screenWidth / 2 - 250,
                      child: TextFieldWidget(
                        textHint:
                            'NIK Pasien/Nama Pasien/No HP Pasien/Email Pasien',
                        textController: model.txtCari,
                        inputFormatters: CoreValidation.formatTextNormal(),
                        textAlign: TextAlign.left,
                        textInputType: CoreValidation.typeString(),
                        isValidation: true,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validationType: ValidationType.normalType,
                        validationLength: 3,
                        prefixIcon: const Icon(
                            MaterialCommunityIcons.file_find_outline),
                        onChanged: (value) {
                          if (value.length > 2) {
                            model.cariPasien(value);
                          } else if (value.isEmpty) {
                            model.cariPasien(value);
                          }
                        },
                      ),
                    ),
                    model.isBusy
                        ? const Align(
                            alignment: Alignment.center,
                            child: CupertinoActivityIndicator(
                              animating: true,
                              radius: 15,
                            ),
                          )
                        : Expanded(
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: DataTable2(
                                  columnSpacing: 12,
                                  horizontalMargin: 12,
                                  minWidth: 300,
                                  columns: [
                                    DataColumn2(
                                      label: TextWidget(
                                          desc: 'ID Pasien',
                                          textAlign: TextAlign.center,
                                          textOverflow: TextOverflow.visible,
                                          style:
                                              MainTextStyle().textStyleBody1),
                                      size: ColumnSize.M,
                                    ),
                                    DataColumn(
                                      label: TextWidget(
                                          desc: 'NIK Pasien',
                                          textAlign: TextAlign.center,
                                          style:
                                              MainTextStyle().textStyleBody1),
                                    ),
                                    DataColumn(
                                      label: TextWidget(
                                          desc: 'Nama Pasien',
                                          textAlign: TextAlign.center,
                                          style:
                                              MainTextStyle().textStyleBody1),
                                    ),
                                    DataColumn(
                                      label: TextWidget(
                                          desc: 'Email',
                                          textAlign: TextAlign.center,
                                          style:
                                              MainTextStyle().textStyleBody1),
                                    ),
                                    DataColumn(
                                      label: TextWidget(
                                          desc: 'No. HP',
                                          textAlign: TextAlign.center,
                                          textOverflow: TextOverflow.visible,
                                          style:
                                              MainTextStyle().textStyleBody1),
                                    ),
                                    DataColumn2(
                                        label: TextWidget(
                                            desc: 'Opsi',
                                            textAlign: TextAlign.center,
                                            style:
                                                MainTextStyle().textStyleBody1),
                                        size: ColumnSize.M),
                                  ],
                                  rows: List<DataRow>.generate(
                                    model.listPasien.length,
                                    (index) {
                                      var data = model.listPasien[index];

                                      return DataRow(
                                        cells: [
                                          DataCell(
                                            TextWidget(
                                                desc: data.idPasien ?? '',
                                                textAlign: TextAlign.center,
                                                style: MainTextStyle()
                                                    .textStyleBody1),
                                          ),
                                          DataCell(
                                            TextWidget(
                                                desc: data.nikPasien ?? '',
                                                textAlign: TextAlign.center,
                                                style: MainTextStyle()
                                                    .textStyleBody1),
                                          ),
                                          DataCell(
                                            TextWidget(
                                                desc: data.nama ?? '',
                                                textAlign: TextAlign.center,
                                                style: MainTextStyle()
                                                    .textStyleBody1),
                                          ),
                                          DataCell(
                                            TextWidget(
                                                desc: data.email ?? '',
                                                textAlign: TextAlign.center,
                                                textOverflow:
                                                    TextOverflow.visible,
                                                style: MainTextStyle()
                                                    .textStyleBody1),
                                          ),
                                          DataCell(
                                            TextWidget(
                                              desc: data.noHp ?? '',
                                              textAlign: TextAlign.center,
                                              style: MainTextStyle()
                                                  .textStyleBody1,
                                              textOverflow:
                                                  TextOverflow.visible,
                                            ),
                                          ),
                                          DataCell(Row(
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  model.txtIdPasien.text =
                                                      data.idPasien ?? '';
                                                  Get.offAllNamed(
                                                      routePasienDetailAdminPage,
                                                      arguments:
                                                          data.idPasien ?? '');
                                                },
                                                icon: const Icon(
                                                  MaterialCommunityIcons
                                                      .circle_edit_outline,
                                                  color: CupertinoColors.activeBlue,
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  model.txtIdPasien.text =
                                                      data.idPasien ?? '';
                                                  model.deletePasien();
                                                },
                                                icon: const Icon(
                                                    MaterialCommunityIcons
                                                        .delete_circle_outline,
                                                  color: CupertinoColors.activeBlue,
                                                ),
                                              ),
                                            ],
                                          ))
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
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
}
