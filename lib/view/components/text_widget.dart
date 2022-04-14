import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String desc;
  final TextAlign textAlign;
  final TextStyle? style;
  final TextOverflow textOverflow;

   const TextWidget(
      {Key? key, this.desc = '',
        this.textAlign = TextAlign.left,
        this.style,
        this.textOverflow = TextOverflow.ellipsis}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      desc,
      textAlign: textAlign,
      style: style,
      overflow: textOverflow,
    );
  }
}