import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty_app/core/theme/text_theme.dart';
import 'package:rick_and_morty_app/core/values/images.dart';
import 'package:rick_and_morty_app/core/utils/size.dart';
import 'package:rick_and_morty_app/core/values/colors.dart';

class TopSectionWidget extends StatelessWidget {
  final String title;

  const TopSectionWidget({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 48.0,
          width: SizeConfig.wp(100),
          color: bg_dark_blue_color,
          child: Row(
            children: [
              IconButton(
                key: const Key('back_page'),
                onPressed: () => Get.back(),
                icon: const Icon(Icons.arrow_back, color: white_color),
              ),
              Text(title, style: title_white_20_700),
            ],
          ),
        ),
        Positioned(
            top: 4.0,
            bottom: 4.0,
            right: 4.0,
            child: Center(child: Image.asset(logo)))
      ],
    );
  }
}
