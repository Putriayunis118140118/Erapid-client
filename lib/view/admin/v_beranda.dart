import 'package:erapid_new/constants.dart';
import 'package:erapid_new/rute.dart';
import 'package:erapid_new/view/components/text_widget.dart';
import 'package:erapid_new/view/components/utility_ui.dart';
import 'package:erapid_new/view_model/vm_beranda_admin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universal_html/html.dart';

class ViewBerandaAdminPage extends StatelessWidget {
  final BerandaAdminViewModel model;
    
  const ViewBerandaAdminPage({Key? key, required this.model }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset:
                    const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    desc: 'Beranda Admin Panel',
                    textAlign: TextAlign.center,
                    style: MainTextStyle()
                        .textStyleH4
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.offAllNamed(routeMain);
                    },
                    child: TextWidget(
                      desc: 'Logout',
                      textAlign: TextAlign.center,
                      style: MainTextStyle()
                          .textStyleH4
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: defaultPadding,),
            Container(
              height: 500,
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    desc: 'Representasi Data Reservasi',
                    textAlign: TextAlign.start,
                    style: MainTextStyle()
                          .textStyleH4
                          .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: Colors.purple[400],
                        width: 300,
                        height: 100,
                        alignment: Alignment.center,
                        //decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Total Pasien", style: MainTextStyle().textStyleCard.copyWith(fontWeight: FontWeight.bold),),
                              Padding(padding: const EdgeInsets.all(5)),
                              model.isBusy ? const CircularProgressIndicator() : Text(model.jumlahPasien, style: MainTextStyle().textStyleCard.copyWith(fontWeight: FontWeight.bold),)
                            ]
                          ),
                        )),
                      Container(
                        color: Colors.purple[400],
                        width: 300,
                        height: 100,
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Pasien Perempuan", style: MainTextStyle().textStyleCard.copyWith(fontWeight: FontWeight.bold),),
                              Padding(padding: const EdgeInsets.all(5)),
                              model.isBusy ? const CircularProgressIndicator() : Text(model.totalPPerempuan, style: MainTextStyle().textStyleCard.copyWith(fontWeight: FontWeight.bold),)
                          ]
                        ),
                      )),
                      Container(
                        color: Colors.purple[400],
                        width: 300,
                        height: 100,
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Pasien Laki-laki", style: MainTextStyle().textStyleCard.copyWith(fontWeight: FontWeight.bold),),
                              Padding(padding: const EdgeInsets.all(5)),
                              model.isBusy ? const CircularProgressIndicator() : Text(model.totalPLaki, style: MainTextStyle().textStyleCard.copyWith(fontWeight: FontWeight.bold),)
                          ]
                        ),
                      )),
                    ],
                  ),
                  const SizedBox(height: defaultPadding,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: Colors.purple[400],
                        width: 300,
                        height: 100,
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Total RT-PCR ", style: MainTextStyle().textStyleCard.copyWith(fontWeight: FontWeight.bold),),
                              Padding(padding: const EdgeInsets.all(5)),
                              model.isBusy ? const CircularProgressIndicator() : Text(model.jumlahRTPCR, style: MainTextStyle().textStyleCard.copyWith(fontWeight: FontWeight.bold),)
                          ]
                        )),
                      ),
                      Container(
                        color: Colors.purple[400],
                        width: 300,
                        height: 100,
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Total Rapid Antigen", style: MainTextStyle().textStyleCard.copyWith(fontWeight: FontWeight.bold),),
                              Padding(padding: const EdgeInsets.all(5)),
                              model.isBusy ? const CircularProgressIndicator() : Text(model.jumlahAntigen, style: MainTextStyle().textStyleCard.copyWith(fontWeight: FontWeight.bold),)
                          ]
                        )),
                      ),
                      Container(
                        color: Colors.purple[400],
                        width: 300,
                        height: 100,
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Total Rapid Antibody", style: MainTextStyle().textStyleCard.copyWith(fontWeight: FontWeight.bold),),
                              Padding(padding: const EdgeInsets.all(5)),
                              model.isBusy ? const CircularProgressIndicator() : Text(model.jumlahAntibody, style: MainTextStyle().textStyleCard.copyWith(fontWeight: FontWeight.bold),)
                          ]
                        )),
                      ),
                    ],
                  ),
                  const SizedBox(height: defaultPadding,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: Colors.purple[400],
                        width: 300,
                        height: 100,
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Jumlah Pasien Negatif", style: MainTextStyle().textStyleCard.copyWith(fontWeight: FontWeight.bold),),
                              Padding(padding: const EdgeInsets.all(5)),
                              model.isBusy ? const CircularProgressIndicator() : Text(model.jumlahPasienNegatif, style: MainTextStyle().textStyleCard.copyWith(fontWeight: FontWeight.bold),)
                          ]
                        )),
                      ),
                      Container(
                        color: Colors.purple[400],
                        width: 300,
                        height: 100,
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Jumlah Pasien Positif", style: MainTextStyle().textStyleCard.copyWith(fontWeight: FontWeight.bold),),
                              Padding(padding: const EdgeInsets.all(5)),
                              model.isBusy ? const CircularProgressIndicator() : Text(model.jumlahPasienPositif, style: MainTextStyle().textStyleCard.copyWith(fontWeight: FontWeight.bold),)
                          ]
                        )),
                      ),
                      Container(
                        color: Colors.purple[400],
                        width: 300,
                        height: 100,
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Total Transaksi", style: MainTextStyle().textStyleCard.copyWith(fontWeight: FontWeight.bold),),
                              Padding(padding: const EdgeInsets.all(5)),
                              model.isBusy ? const CircularProgressIndicator() : Text(model.jumlahlunas, style: MainTextStyle().textStyleCard.copyWith(fontWeight: FontWeight.bold),)
                          ]
                        )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: defaultPadding,),
            Container(
              height: 250,
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
            )
          ],
        ),
      ),
    );
  }
}
