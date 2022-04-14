import 'package:data_table_2/data_table_2.dart';
import 'package:erapid_new/constants.dart';
import 'package:erapid_new/func/f_validation.dart';
import 'package:erapid_new/services/MenuController.dart';
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
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/src/provider.dart';
import 'package:stacked/stacked.dart';

class ViewPemesananAdminPage extends StatelessWidget {
  const ViewPemesananAdminPage({Key? key}) : super(key: key);

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
                  child: viewPemesanan()
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget viewPemesanan(){
    return ViewModelBuilder<RiwayatViewModel>.reactive(
      viewModelBuilder: () => RiwayatViewModel(),
      onModelReady: (model) => model.initBayar(),
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
                      desc: 'Pemesanan / Riwayat Pasien',
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        TextWidget(
                            desc: 'Cari Data: ',
                            textAlign: TextAlign.center,
                            style: MainTextStyle().textStyleBody1),
                      ],
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      width: ScreenUtil().screenWidth / 2 - 250,
                      child: TextFieldWidget(
                        textHint:
                        'Kode Reservasi/Nama Pasien',
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
                            model.initBayar();
                          } else if (value.isEmpty) {
                            model.initBayar();
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                            desc: 'Klik detail untuk mengubah status pembayaran',
                            textAlign: TextAlign.center,
                            style: MainTextStyle()
                                .textStyleBody1
                        ),
                      ],
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
                                    desc: 'Kode\nReservasi',
                                    textAlign: TextAlign.center,
                                    textOverflow: TextOverflow.visible,
                                    style: MainTextStyle().textStyleBody1),
                                size: ColumnSize.M,
                              ),
                              DataColumn(
                                label:TextWidget(
                                    desc: 'Nama Pasien',
                                    textAlign: TextAlign.center,
                                    style: MainTextStyle().textStyleBody1),
                              ),
                              DataColumn(
                                label: TextWidget(
                                    desc: 'Jenis Test',
                                    textAlign: TextAlign.center,
                                    style: MainTextStyle().textStyleBody1),
                              ),
                              DataColumn(
                                label: TextWidget(
                                    desc: 'Waktu Test',
                                    textAlign: TextAlign.center,
                                    style: MainTextStyle().textStyleBody1),
                              ),
                              DataColumn(
                                label: TextWidget(
                                    desc: 'Status Pembayaran',
                                    textAlign: TextAlign.center,
                                    textOverflow: TextOverflow.visible,
                                    style: MainTextStyle().textStyleBody1),
                              ),
                              DataColumn2(
                                  label: TextWidget(
                                      desc: 'Hasil',
                                      textAlign: TextAlign.center,
                                      style: MainTextStyle().textStyleBody1),
                                  size: ColumnSize.M

                              ),
                              DataColumn2(
                                  label: TextWidget(
                                      desc: 'Opsi',
                                      textAlign: TextAlign.center,
                                      style: MainTextStyle().textStyleBody1),
                                  size: ColumnSize.M
                              ),
                            ],
                            rows: List<DataRow>.generate(
                              model.listRiwayat.length,
                                  (index) {
                                var data = model.listRiwayat[index];

                                return DataRow(cells: [
                                  DataCell(
                                    TextWidget(
                                        desc: data['id_daftar'] ?? '',
                                        textAlign: TextAlign.center,
                                        style: MainTextStyle().textStyleBody1),
                                  ),
                                  DataCell(
                                    TextWidget(
                                        desc: data['nm_pasien'] ?? '',
                                        textAlign: TextAlign.center,
                                        style: MainTextStyle().textStyleBody1),
                                  ),
                                  DataCell(
                                    TextWidget(
                                        desc: data['jns_test'] ?? '',
                                        textAlign: TextAlign.center,
                                        style: MainTextStyle().textStyleBody1),
                                  ),
                                  DataCell(
                                    TextWidget(
                                        desc: model.formatTanggal(data['tgl_test'] ?? '00000000', data['jam_test'] ?? '0000'),
                                        textAlign: TextAlign.center,
                                        textOverflow: TextOverflow.visible,
                                        style: MainTextStyle().textStyleBody1),
                                  ),
                                  DataCell(
                                    TextWidget(
                                      desc: data['sts_bayar'] ?? '',
                                      textAlign: TextAlign.center,
                                      style: MainTextStyle().textStyleBody1,
                                      textOverflow: TextOverflow.visible,
                                    ),
                                  ),
                                  DataCell(
                                    TextWidget(
                                        desc: data['sts_hasil'] ?? '',
                                        textAlign: TextAlign.center,
                                        textOverflow: TextOverflow.visible,
                                        style: MainTextStyle().textStyleBody1),
                                  ),
                                  DataCell(
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: ButtonWidget(
                                          text: TextWidget(
                                            desc: "Detail",
                                            textAlign: TextAlign.center,
                                            style: MainTextStyle().textStyleButton,
                                          ),
                                          onPressed: () {
                                            // maksud dari ?? '' adalah jika nilai dari id_daftar null atau variabel lainnya itu akan secxaa
                                            model.idDaftar = data['id_daftar'] ?? '';
                                            model.getDetailRiwayatAdminPasien();
                                          },
                                        ),
                                      )
                                  )
                                ]);
                              },
                            ),
                          ),
                        ),
                      ),
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
}
