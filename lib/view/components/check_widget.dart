import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckboxWidget extends StatelessWidget {
  final bool? check;
  final Function(bool?)? onChange;

  const CheckboxWidget({Key? key, this.check, this.onChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: check,
      onChanged: onChange,
    );
  }
}
