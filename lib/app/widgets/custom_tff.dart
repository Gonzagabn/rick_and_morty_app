import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/theme/text_theme.dart';
import 'package:rick_and_morty_app/core/values/colors.dart';

class CustomTffWidget extends Container {
  final Function(String s)? onSaved;
  final Function(String s)? onValidate;
  final Function(String s)? onChanged;
  final TextEditingController? controller;
  final text,
      type,
      colorInitialValue,
      initialValue,
      icon,
      bgColor,
      enabledBorderColor,
      focusedBorderColor,
      errordBorderColor,
      disabledBorderColor,
      fErrordBorderColor,
      primaryColor;
  CustomTffWidget({
    this.onChanged,
    this.onSaved,
    this.onValidate,
    this.controller,
    this.text,
    this.type,
    this.colorInitialValue = bg_blue_color,
    this.initialValue,
    this.icon,
    this.bgColor = white_color,
    this.enabledBorderColor = bg_dark_blue_color,
    this.focusedBorderColor = bg_dark_blue_color,
    this.errordBorderColor = error_color,
    this.disabledBorderColor = Colors.transparent,
    this.fErrordBorderColor = error_color,
    this.primaryColor = Colors.white,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: primaryColor,
        errorColor: error_color,
      ),
      child: TextFormField(
        textInputAction: TextInputAction.done,
        autofocus: false,
        key: key,
        initialValue: initialValue,
        style: TextStyle(
          color: colorInitialValue,
          fontSize: 16.0,
          fontWeight: FontWeight.w700,
        ),
        controller: controller,
        onSaved: (v) => onSaved!(v!),
        validator: (v) => onValidate!(v!),
        onChanged: (v) => onChanged!(v),
        cursorColor: bg_dark_blue_color,
        keyboardType: type,
        decoration: InputDecoration(
          fillColor: bgColor,
          errorStyle: const TextStyle(color: error_color),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: enabledBorderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: focusedBorderColor),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: disabledBorderColor),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: errordBorderColor),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: fErrordBorderColor),
          ),
          labelStyle: body_green_18_700,
          counterStyle: const TextStyle(color: Colors.white),
          suffixIcon: icon,
          labelText: text,
        ),
      ),
    );
  }
}
