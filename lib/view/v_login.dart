import 'package:erapid_new/constants.dart';
import 'package:erapid_new/func/f_validation.dart';
import 'package:erapid_new/rute.dart';
import 'package:erapid_new/view/components/button_widget.dart';
import 'package:erapid_new/view/components/text_widget.dart';
import 'package:erapid_new/view/components/tfield_widget.dart';
import 'package:erapid_new/view/components/utility_ui.dart';
import 'package:erapid_new/view_model/vm_login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

class ViewLoginPage extends StatelessWidget {
  const ViewLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      // Pemanggilan class ViewModel untuk file view login
      viewModelBuilder: () =>
          LoginViewModel(), // memuat view model dengan nama LoginViewModel
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
                          Container(
                            alignment: Alignment.center,
                            child: TextWidget(
                              desc: 'Masuk',
                              textAlign: TextAlign.center,
                              style: MainTextStyle()
                                  .textStyleH4
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: defaultPadding,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextWidget(
                                desc: 'Belum punya akun? ',
                                textAlign: TextAlign.center,
                                style: MainTextStyle().textStyleBody1,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(routeRegistrasiPage);
                                },
                                child: TextWidget(
                                  desc: 'Daftar Sekarang',
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
                            height: defaultPadding + 10,
                          ),
                          TextFieldWidget(
                            textHint: 'Alamat Email',
                            textController: model.txtUsername,
                            inputFormatters: CoreValidation.formatTextNormal(),
                            textAlign: TextAlign.left,
                            textInputType: CoreValidation.typeString(),
                            isValidation: true,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validationType: ValidationType.normalType,
                            validationLength: 2,
                            prefixIcon:
                                const Icon(MaterialCommunityIcons.email),
                          ),
                          const SizedBox(
                            height: defaultPadding - 12,
                          ),
                          TextWidget(
                            desc: 'cth.example@gmail.com',
                            textAlign: TextAlign.left,
                            style: MainTextStyle().textStyleCaption,
                          ),
                          const SizedBox(
                            height: defaultPadding,
                          ),
                          TextFieldWidget(
                            textHint: 'Kata Sandi',
                            textController: model.txtPassword,
                            isPassword: true,
                            obsecureText: true,
                            inputFormatters: CoreValidation.formatTextNormal(),
                            textAlign: TextAlign.left,
                            textInputType: CoreValidation.typeString(),
                            isValidation: true,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validationType: ValidationType.normalType,
                            validationLength: 2,
                            prefixIcon: const Icon(MaterialCommunityIcons.lock),
                          ),
                          const SizedBox(
                            height: defaultPadding - 12,
                          ),
                          GestureDetector(
                            onTap: () => Get.toNamed(routeKonfrimEmail),
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: TextWidget(
                                desc: 'Lupa Kata Sandi?',
                                textAlign: TextAlign.center,
                                style: MainTextStyle()
                                    .textStyleBody1
                                    .copyWith(color: CupertinoColors.activeBlue),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: defaultPadding + 30,
                          ),
                          ButtonWidget(
                            text: TextWidget(
                              desc: "Masuk",
                              textAlign: TextAlign.center,
                              style: MainTextStyle().textStyleButton,
                            ),
                            onPressed: () {
                              model.prosesLogin();
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