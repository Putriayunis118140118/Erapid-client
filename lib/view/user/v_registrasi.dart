import 'package:cool_alert/cool_alert.dart';
import 'package:erapid_new/constants.dart';
import 'package:erapid_new/func/f_validation.dart';
import 'package:erapid_new/rute.dart';
import 'package:erapid_new/view/components/button_widget.dart';
import 'package:erapid_new/view/components/check_widget.dart';
import 'package:erapid_new/view/components/text_widget.dart';
import 'package:erapid_new/view/components/tfield_widget.dart';
import 'package:erapid_new/view/components/utility_ui.dart';
import 'package:erapid_new/view_model/vm_registrasi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

class ViewRegistrasiPage extends StatelessWidget {
  const ViewRegistrasiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegistrasiViewModel>.reactive(
      viewModelBuilder: () => RegistrasiViewModel(),
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
                    height: 600,
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
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Form(
                          key: model.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: defaultPadding,
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: TextWidget(
                                  desc: 'Daftar Akun',
                                  textAlign: TextAlign.center,
                                  style: MainTextStyle()
                                      .textStyleH4
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                height: defaultPadding,
                              ),
                              const SizedBox(
                                height: defaultPadding + 10,
                              ),
                              TextWidget(
                                desc: 'Nama Lengkap',
                                textAlign: TextAlign.left,
                                style: MainTextStyle().textStyleBody2,
                              ),
                              const SizedBox(
                                height: defaultPadding - 10,
                              ),
                              TextFieldWidget(
                                textHint: 'Masukkan Nama Lengkap',
                                textController: model.txtNamaPasien,
                                inputFormatters:
                                CoreValidation.formatTextNormal(),
                                textAlign: TextAlign.left,
                                textInputType: CoreValidation.typeString(),
                                isValidation: true,
                                autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                                validationType: ValidationType.normalType,
                                validationLength: 2,
                              ),
                              const SizedBox(
                                height: defaultPadding,
                              ),
                              TextWidget(
                                desc: 'Alamat Email',
                                textAlign: TextAlign.left,
                                style: MainTextStyle().textStyleBody2,
                              ),
                              const SizedBox(
                                height: defaultPadding - 10,
                              ),
                              TextFieldWidget(
                                textHint: 'Masukkan Alamat Email',
                                textController: model.txtUsername,
                                inputFormatters:
                                CoreValidation.formatTextNormal(),
                                textAlign: TextAlign.left,
                                textInputType: CoreValidation.typeString(),
                                isValidation: true,
                                autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                                validationType: ValidationType.normalType,
                                validationLength: 2,
                              ),
                              const SizedBox(
                                height: defaultPadding,
                              ),
                              TextWidget(
                                desc: 'Kata Sandi',
                                textAlign: TextAlign.left,
                                style: MainTextStyle().textStyleBody2,
                              ),
                              const SizedBox(
                                height: defaultPadding - 10,
                              ),
                              TextFieldWidget(
                                textHint: 'Masukkan Kata Sandi',
                                textController: model.txtPassword,
                                isPassword: true,
                                obsecureText: true,
                                inputFormatters:
                                CoreValidation.formatTextNormal(),
                                textAlign: TextAlign.left,
                                textInputType: CoreValidation.typeString(),
                                isValidation: true,
                                autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                                validationType: ValidationType.normalType,
                                validationLength: 2,
                              ),
                              const SizedBox(
                                height: defaultPadding - 12,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CheckboxWidget(
                                    check: model.checkTerms,
                                    onChange: (bool? value) {
                                      model.checkTerms = value ?? false;
                                    },
                                  ),
                                  Expanded(
                                    child: RichText(
                                      text: TextSpan(
                                        text: 'Saya menerima segala isi',
                                        style: MainTextStyle().textStyleBody1,
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: ' Syarat dan Penggunaan',
                                            style: MainTextStyle()
                                                .textStyleBody1
                                                .copyWith(
                                                color: CupertinoColors
                                                    .activeBlue),
                                          ),
                                          TextSpan(
                                            text: ' dan',
                                            style: MainTextStyle().textStyleBody1,
                                          ),
                                          TextSpan(
                                            text: ' Kebijakan privasi',
                                            style: MainTextStyle()
                                                .textStyleBody1
                                                .copyWith(
                                                color: CupertinoColors
                                                    .activeBlue),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: defaultPadding + 30,
                              ),
                              ButtonWidget(
                                text: TextWidget(
                                  desc: "Daftar",
                                  textAlign: TextAlign.center,
                                  style: MainTextStyle().textStyleButton,
                                ),
                                onPressed: () async {
                                  if (model.formKey.currentState!.validate()) {
                                    if (!model.checkTerms){
                                      await CoolAlert.show(
                                        context: context,
                                        type: CoolAlertType.warning,
                                        text: 'Apakah sudah mencentang Syarat dan Ketentuan?',
                                      );
                                      return;
                                    }

                                    await model.prosesRegistrasi();
                                  }
                                },
                              ),
                              const SizedBox(
                                height: defaultPadding,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextWidget(
                                    desc: 'Sudah Punya Akun? ',
                                    textAlign: TextAlign.center,
                                    style: MainTextStyle().textStyleBody1,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      if (kReleaseMode) {
                                        Get.back();
                                      } else {
                                        Get.toNamed(routeLoginPage);
                                      }
                                    },
                                    child: TextWidget(
                                      desc: 'Masuk',
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
                                height: defaultPadding + 20,
                              ),
                            ],
                          ),
                        )
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
