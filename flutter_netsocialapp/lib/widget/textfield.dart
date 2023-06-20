import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextfieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obs;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final Icon suffiicon;
  final Icon prefixIcon;
  final Function()? cupertino;
  const TextfieldWidget(
      {super.key,
      required this.controller,
      required this.hintText,
      this.obs = false,
      required this.textInputAction,
      required this.textInputType,
      required this.suffiicon,
      required this.prefixIcon,
      this.cupertino
      });

  @override
  Widget build(BuildContext context) {
    final _outlined = OutlineInputBorder(
        borderSide: BorderSide(
      color: Color(0xff9896f0),
    ),
    borderRadius: BorderRadius.circular(50),
    );
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: _outlined,
        errorBorder: _outlined,
        enabledBorder: _outlined,
        focusedBorder: _outlined,
        disabledBorder: _outlined,
        focusedErrorBorder: _outlined,
        filled: true,
        suffixIcon: CupertinoButton(padding: EdgeInsets.zero,child: suffiicon, onPressed: cupertino),
        prefixIcon: prefixIcon,
      ),
      obscureText: obs,
      textInputAction: textInputAction,
      keyboardType: textInputType,
    );
  }
}
