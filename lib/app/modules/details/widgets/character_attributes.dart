import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty_app/app/modules/home/controller.dart';
import 'package:rick_and_morty_app/core/theme/box_decorations.dart';
import 'package:rick_and_morty_app/core/theme/text_theme.dart';
import 'package:rick_and_morty_app/core/utils/size.dart';

class CharacterAttributesWidget extends Container {
  final controller = Get.find<HomeController>();
  final String attribute;
  final String attributeValue;

  CharacterAttributesWidget({
    required this.attribute,
    required this.attributeValue,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.wp(100),
      margin: const EdgeInsets.only(top: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: translucid_blue_box_decoration,
      child: Center(
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: '$attribute: ',
            style: title_white_20,
            children: [
              TextSpan(text: attributeValue, style: title_white_20_700)
            ],
          ),
        ),
      ),
    );
  }
}
