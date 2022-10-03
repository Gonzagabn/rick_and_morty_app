// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/utils/size.dart';
import 'package:rick_and_morty_app/core/values/colors.dart';

class CustomButtonWidget extends Container {
  final callback,
      text,
      borderColor,
      borderWidth,
      bgColor,
      textColor,
      largura,
      altura,
      elevation;

  CustomButtonWidget({
    this.callback,
    required this.text,
    this.borderColor = bg_medium_blue_color,
    this.borderWidth = 1.0,
    this.bgColor = bg_medium_blue_color,
    this.textColor = Colors.white,
    this.largura = 100.0,
    this.altura = 60.0,
    this.elevation = 2.0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: altura,
      width: SizeConfig.wp(largura),
      child: MaterialButton(
        elevation: elevation,
        textColor: textColor,
        color: bgColor,
        splashColor: Colors.white,
        disabledColor: black_color.withOpacity(0.64),
        disabledElevation: 0.0,
        shape: RoundedRectangleBorder(
            side: BorderSide(
              width: borderWidth,
              color: callback != null ? borderColor : Colors.white,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(16.0))),
        onPressed: callback,
        child: Text(
          text,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
