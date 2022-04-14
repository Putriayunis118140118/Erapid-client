import 'package:data_table_2/data_table_2.dart';
import 'package:erapid_new/constants.dart';
import 'package:erapid_new/rute.dart';
import 'package:erapid_new/view/components/button_widget.dart';
import 'package:erapid_new/view/components/text_widget.dart';
import 'package:erapid_new/view/components/utility_ui.dart';
import 'package:erapid_new/view_model/vm_riwayat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

class ViewRiwayatPage extends StatelessWidget {
  const ViewRiwayatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RiwayatViewModel>.reactive(
      viewModelBuilder: () => RiwayatViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
        body: Container(
          color: CupertinoColors.white,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            alignment: AlignmentDirectional.center,
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
                  Container(
                    width: 800,
                    height: 550,
                    decoration: BoxDecoration(
                      color: CupertinoColors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: TextWidget(
                                  desc: 'Riwayat',
                                  textAlign: TextAlign.center,
                                  style: MainTextStyle()
                                      .textStyleH4
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  model.init();
                                },
                                child: TextWidget(
                                  desc: 'Reload Data',
                                  textAlign: TextAlign.center,
                                  style: MainTextStyle()
                                      .textStyleBody1
                                      .copyWith(
                                          color: CupertinoColors.activeBlue),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: defaultPadding,
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
                                        minWidth: 600,
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
                                                desc: 'Nama',
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
                                                desc: 'Status\nPembayaran',
                                                textAlign: TextAlign.center,
                                                textOverflow: TextOverflow.visible,
                                                style: MainTextStyle().textStyleBody1),
                                          ),
                                          DataColumn(
                                            label: TextWidget(
                                                desc: 'Hasil',
                                                textAlign: TextAlign.center,
                                                style: MainTextStyle().textStyleBody1),
                                          ),
                                          DataColumn2(
                                            label: TextWidget(
                                                desc: 'Opsi',
                                                textAlign: TextAlign.center,
                                                style: MainTextStyle().textStyleBody1),
                                            size: ColumnSize.L
                                          ),
                                        ],
                                        rows: List<DataRow>.generate(
                                          model.listRiwayat.length,
                                          (index) {
                                            var data = model.listRiwayat[index];

                                            return DataRow(cells: [
                                              DataCell(
                                                TextWidget(
                                                    desc: data['id_daftar'],
                                                    textAlign: TextAlign.center,
                                                    style: MainTextStyle().textStyleBody1),
                                              ),
                                              DataCell(
                                                TextWidget(
                                                    desc: data['nm_pasien'],
                                                    textAlign: TextAlign.center,
                                                    style: MainTextStyle().textStyleBody1),
                                              ),
                                              DataCell(
                                                TextWidget(
                                                    desc: data['jns_test'],
                                                    textAlign: TextAlign.center,
                                                    style: MainTextStyle().textStyleBody1),
                                              ),
                                              DataCell(
                                                TextWidget(
                                                    desc: model.formatTanggal(data['tgl_test'], data['jam_test']),
                                                    textAlign: TextAlign.center,
                                                    textOverflow: TextOverflow.visible,
                                                    style: MainTextStyle().textStyleBody1),
                                              ),
                                              DataCell(
                                                TextWidget(
                                                    desc: data['sts_bayar'],
                                                    textAlign: TextAlign.center,
                                                    style: MainTextStyle().textStyleBody1),
                                              ),
                                              DataCell(
                                                TextWidget(
                                                    desc: data['sts_hasil'],
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
                                                      model.idDaftar = data['id_daftar'];
                                                      model.getDetailRiwayatPasien();
                                                      //Detail riwayat pasien
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
                              // Get.back();
                              Get.offAndToNamed(routeBerandaPage);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}