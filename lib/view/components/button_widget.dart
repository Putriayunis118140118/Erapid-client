// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:erapid_new/view/components/utility_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:hovering/hovering.dart";

class ButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? text;
  final Color? primary;
  final Color? onPrimary;
  final Color? onSurface;

  const ButtonWidget(
      {Key? key,
      this.onPressed,
      this.text,
      this.primary,
      this.onPrimary,
      this.onSurface})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: text!,
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
        minimumSize: MaterialStateProperty.all<Size>(const Size.fromHeight(50)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            // side: const BorderSide(color: Colors.red),
          ),
        ),
      ),
    );
  }
}

class ElevatedButtonW extends StatelessWidget {
  final Function()? onPressed;
  final Widget? child;
  final Color? primary;
  final Color? onPrimary;
  final Color? onSurface;
  final Size? minimumSize;
  final EdgeInsets? padding;
  final bool block;
  final bool loading;

  const ElevatedButtonW({
    this.child,
    this.onPressed,
    this.primary,
    this.onPrimary,
    this.onSurface,
    this.minimumSize,
    this.padding,
    this.block = false,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: primary ?? primaryTextColor,
        onPrimary: onPrimary ?? primaryColor,
        onSurface: onSurface ?? primaryColor,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(8.0),
        ),
        // elevation: 5,
        // shadowColor: Colors.teal,
        minimumSize: block ? Size(Get.width, 50) : (minimumSize ?? null),
        padding: padding ??
            EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 15,
            ),
      ),
      child: loading ? CupertinoActivityIndicator() : child,
      onPressed: loading ? () {} : onPressed,
    );
  }
}

class TextButtonW extends StatelessWidget {
  final Function()? onPressed;
  final Widget? child;
  final Size? minimumSize;
  final Padding? padding;
  final bool block;

  const TextButtonW({
    @required this.child,
    this.onPressed,
    this.minimumSize,
    this.padding,
    this.block = false,
  });

  @override
  Widget build(BuildContext context) {
    EdgeInsetsGeometry defaultPadding = EdgeInsets.symmetric(
      horizontal: 30,
      vertical: 15,
    );

    return TextButton(
      style: ElevatedButton.styleFrom(
        // primary: primaryTextColor,
        // onPrimary: primaryTextColor,
        onSurface: primaryTextColor,
        // shape: RoundedRectangleBorder(
        //   borderRadius: new BorderRadius.circular(8.0),
        // ),
        // elevation: 5,
        // shadowColor: Colors.teal,
        minimumSize: block ? Size(Get.width, 50) : (minimumSize ?? null),
        padding: (padding ?? defaultPadding) as EdgeInsetsGeometry,
      ),
      child: child!,
      onPressed: onPressed,
    );
  }
}

class OutlinedButtonW extends StatelessWidget {
  final Function()? onPressed;
  final Widget? child;
  final Size? minimumSize;
  final Padding? padding;
  final bool block;

  const OutlinedButtonW({
    @required this.child,
    this.onPressed,
    this.minimumSize,
    this.padding,
    this.block = false,
  });

  @override
  Widget build(BuildContext context) {
    EdgeInsetsGeometry defaultPadding = EdgeInsets.symmetric(
      horizontal: 30,
      vertical: 15,
    );
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        onSurface: Colors.red,
        textStyle: TextStyle(
          color: primaryTextColor,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(8.0),
        ),
        side: BorderSide(color: primaryTextColor, width: 1),
        minimumSize: block ? Size(Get.width, 50) : (minimumSize ?? null),
        padding: (padding ?? defaultPadding) as EdgeInsetsGeometry,
      ),
      child: child!,
      onPressed: onPressed,
    );
  }
}

class LinkButtonW extends StatelessWidget {
  final Function()? onPressed;
  final String? text;
  final TextStyle? style;
  final TextOverflow? textOverflow;

  const LinkButtonW({
    this.text,
    this.style,
    this.onPressed,
    this.textOverflow,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: HoverWidget(
        child: Text(
          text ?? "",
          style: (style ?? TextStyle()),
        ),
        hoverChild: Text(
          text ?? "",
          style: (style ?? TextStyle()).copyWith(
            decoration: TextDecoration.underline,
          ),
          overflow: textOverflow ?? TextOverflow.visible,
        ),
        onHover: (v) {},
      ),
      onPressed: onPressed,
    );
  }
}

Widget buttonKecil({Function()? onPressed, String? text}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      primary: primaryTextColor,
      onPrimary: primaryTextColor,
      onSurface: primaryTextColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
    ),
    child: Text(
      text ?? "",
      style: MainTextStyle().textStyleButton,
    ),
    onPressed: onPressed,
  );
}
