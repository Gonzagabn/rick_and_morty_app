import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rick_and_morty_app/core/theme/text_theme.dart';
import 'package:rick_and_morty_app/core/values/colors.dart';

class CustomTffWidget extends Container {
  final Function(String s)? onSaved;
  final Function(String s)? onValidate;
  final Function(String s)? onChanged;
  final TextEditingController? controller;
  final Key? key;
  final text,
      obscure,
      mask,
      maxLength,
      maxLines,
      check,
      icon,
      type,
      enabled,
      filled,
      initialValue,
      colorInitialValue,
      contentPadding,
      counterText,
      prefixText,
      prefixStyle,
      prefixIcon,
      enabledBorderColor,
      focusedBorderColor,
      errordBorderColor,
      disabledBorderColor,
      fErrordBorderColor,
      focusNode,
      bgColor,
      hintText,
      primaryColor;
  CustomTffWidget({
    this.key,
    this.text,
    this.onChanged,
    this.onSaved,
    this.onValidate,
    this.type,
    this.enabled = true,
    this.colorInitialValue = bg_blue_color,
    this.mask = const <TextInputFormatter>[],
    this.controller,
    this.initialValue,
    this.icon,
    this.obscure = false,
    this.check = false,
    this.maxLength,
    this.counterText = '',
    this.maxLines = 1,
    this.filled = true,
    this.contentPadding,
    this.prefixText,
    this.prefixStyle,
    this.prefixIcon,
    this.bgColor = white_color,
    this.focusNode,
    this.enabledBorderColor = bg_dark_blue_color,
    this.disabledBorderColor = Colors.transparent,
    this.focusedBorderColor = bg_dark_blue_color,
    this.errordBorderColor = error_color,
    this.fErrordBorderColor = error_color,
    this.primaryColor = Colors.white,
    // ignore: avoid_init_to_null
    this.hintText = null,
  });
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
        focusNode: focusNode,
        inputFormatters: mask,
        maxLength: maxLength,
        initialValue: initialValue,
        style: TextStyle(
          color: colorInitialValue,
          fontSize: 16.0,
          fontWeight: FontWeight.w700,
        ),
        enabled: enabled,
        controller: controller,
        obscureText: obscure,
        onSaved: (v) => onSaved!(v!),
        validator: (v) => onValidate!(v!),
        onChanged: (v) => onChanged!(v),
        cursorColor: bg_dark_blue_color,
        maxLines: maxLines,
        keyboardType: type,
        decoration: InputDecoration(
          counterText: counterText,
          contentPadding: contentPadding,
          prefixIcon: prefixIcon,
          prefixText: prefixText,
          prefixStyle: prefixStyle,
          filled: filled,
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
          hintText: hintText,
        ),
      ),
    );
  }
}
