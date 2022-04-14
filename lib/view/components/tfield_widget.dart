import 'package:erapid_new/func/f_validation.dart';
import 'package:erapid_new/provider/obs_pass.dart';
import 'package:erapid_new/view/components/utility_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:stacked/stacked.dart';

enum ValidationType {
  none,
  normalType,
  emailType,
  passwordType,
  confrimPasswordType
}

class TextFieldWidget extends StatelessWidget {
  final String textLabel;
  final String textHint;
  final TextAlign textAlign;
  final TextStyle? style;
  final TextEditingController? textController;
  final GlobalKey<FormFieldState<String>>? textControllerKey;
  final GlobalKey<FormFieldState<String>>? textControllerKey2;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? textInputType;
  final bool obsecureText;
  final bool isPassword;
  final bool isValidation;
  final ValidationType validationType;
  final AutovalidateMode autovalidateMode;
  final FormFieldState<String>? formFieldState;
  final int validationLength;
  final bool readOnly;
  final bool? autofocus;
  final Function(String)? onChanged;
  final GestureTapCallback? onTap;
  final Icon? prefixIcon;

  const TextFieldWidget({
    this.autofocus,
    this.textLabel = '',
    this.textHint = '',
    this.textAlign = TextAlign.left,
    this.style,
    this.textControllerKey,
    this.textControllerKey2,
    this.textController,
    this.inputFormatters,
    this.textInputType,
    this.obsecureText = false,
    this.isPassword = false,
    this.isValidation = false,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.validationType = ValidationType.none,
    this.formFieldState,
    this.validationLength = 8,
    this.readOnly = false,
    this.onChanged,
    this.onTap,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return !isPassword
        ? TextFormField(
            onTap: onTap,
            key: textControllerKey,
            inputFormatters: inputFormatters,
            keyboardType: textInputType,
            controller: textController,
            textAlign: textAlign,
            style: style ??
                MainTextStyle().textStyleBody2,
            autovalidateMode: autovalidateMode,
            autofocus: autofocus ?? false,
            onChanged: onChanged,
            readOnly: readOnly,
            validator: (String? value) {
              if (isValidation && value != null) {
                switch (validationType) {
                  case ValidationType.none:
                    return null;
                  case ValidationType.normalType:
                    return CoreValidation.normalCheck(
                        textHint == '' ? textHint : textLabel,
                        value,
                        validationLength);
                  case ValidationType.emailType:
                    return CoreValidation.emailCheck(value);
                  case ValidationType.passwordType:
                    return CoreValidation.passwordComplex(value);
                  case ValidationType.confrimPasswordType:
                    return CoreValidation.confirmPasswordCheck(
                      value,
                      textControllerKey2!.currentState!.value!,
                    );
                }
              }
              return null;
            },
            decoration: InputDecoration(
              filled: true,
              contentPadding: const EdgeInsets.all(10),
              hintText: textHint,
              hintStyle: style ??
                  MainTextStyle().textStyleBody2,
              fillColor: Colors.white,
              prefixIcon: prefixIcon,
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
          )
        : ViewModelBuilder<PasswordProvider>.reactive(
            viewModelBuilder: () => PasswordProvider(),
            builder: (context, data, _) => TextFormField(
              key: textControllerKey,
              readOnly: readOnly,
              inputFormatters: inputFormatters,
              keyboardType: textInputType,
              controller: textController,
              textAlign: textAlign,
              style: style ??
                  MainTextStyle().textStyleBody2,
              obscureText: data.obsecureText,
              autovalidateMode: autovalidateMode,
              autofocus: false,
              validator: (String? value) {
                if (isValidation && value != null) {
                  switch (validationType) {
                    case ValidationType.none:
                      return null;
                    case ValidationType.normalType:
                      return CoreValidation.normalCheck(
                          textHint == '' ? textHint : textLabel,
                          value,
                          validationLength);
                    case ValidationType.emailType:
                      return CoreValidation.emailCheck(value);
                    case ValidationType.passwordType:
                      return CoreValidation.passwordComplex(value);
                    case ValidationType.confrimPasswordType:
                      return CoreValidation.confirmPasswordCheck(
                        value,
                        textControllerKey2!.currentState!.value!,
                      );
                  }
                }
                return null;
              },
              decoration: InputDecoration(
                filled: true,
                contentPadding: EdgeInsets.all(10),
                hintText: textHint,
                prefixIcon: prefixIcon,
                hintStyle: style ??
                    MainTextStyle()
                        .textStyleBody2
                        ,
                fillColor: Colors.white,
                suffixIcon: IconButton(
                  icon: Icon(
                    data.obsecureText
                        ? MaterialCommunityIcons.eye_off_outline
                        : MaterialCommunityIcons.eye_outline,

                    size: 25,
                  ),
                  onPressed: () {
                    data.obscureText = !data.obsecureText;
                  },
                ),
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
            ),
          );
  }
}
