import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty_app/app/modules/home/controller.dart';
import 'package:rick_and_morty_app/core/theme/box_decorations.dart';
import 'package:rick_and_morty_app/core/theme/text_theme.dart';
import 'package:rick_and_morty_app/core/values/colors.dart';

class HomeCardWidget extends Container {
  final controller = Get.find<HomeController>();
  final String title;
  final String description;
  final IconData iconData;
  final String imageAsset;
  final String route;

  HomeCardWidget({
    required this.title,
    required this.description,
    required this.iconData,
    required this.imageAsset,
    required this.route,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(title, style: body_black_16_700),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () => Get.toNamed(route),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: translucid_blue_box_decoration,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Icon(
                            iconData,
                            color: bg_medium_blue_color,
                            size: 180.0,
                          ),
                          Positioned(
                            left: -24.0,
                            right: 0.0,
                            top: 0.0,
                            bottom: -24.0,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(imageAsset),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Text(
                        description,
                        style: body_white_16,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
