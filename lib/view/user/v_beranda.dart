import 'package:erapid_new/constants.dart';
import 'package:erapid_new/rute.dart';
import 'package:erapid_new/view/components/button_widget.dart';
import 'package:erapid_new/view/components/text_widget.dart';
import 'package:erapid_new/view/components/tfield_widget.dart';
import 'package:erapid_new/view/components/utility_ui.dart';
import 'package:erapid_new/view_model/vm_beranda_admin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewBerandaUserPage extends StatelessWidget {
  const ViewBerandaUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  width: 400,
                  height: 450,
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ButtonWidget(
                          text: TextWidget(
                            desc: "Reservasi Test",
                            textAlign: TextAlign.center,
                            style: MainTextStyle().textStyleButton
                          ),
                          onPressed: () {
                            Get.offAndToNamed(routeReservasiPage);
                          },
                        ), // Reservasi Lab Test
                        const SizedBox(height: 20,),
                        ButtonWidget(
                          text: TextWidget(
                            desc: "Lihat History Pemesanan",
                            textAlign: TextAlign.center,
                            style: MainTextStyle().textStyleButton,
                          ),
                          onPressed: () {
                            Get.offAndToNamed(routeRiwayatPage);
                          },
                        ), // Lihat History Pemesanan
                        const SizedBox(height: 20,),
                        ButtonWidget(
                          text: TextWidget(
                            desc: "Logout",
                            textAlign: TextAlign.center,
                            style: MainTextStyle().textStyleButton,
                            ),
                            onPressed: () {
                              Get.offAllNamed(routeMain);
                            },
                        ), // Log Out
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}