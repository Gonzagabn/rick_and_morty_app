import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty_app/app/modules/characters/controller.dart';
import 'package:rick_and_morty_app/core/theme/text_theme.dart';

class CharacterHeaderSectionWidget extends Container {
  final controller = Get.find<CharactersController>();

  CharacterHeaderSectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                text: '${controller.characters.value.results!.length}',
                style: title_green_20_700,
                children: [
                  const TextSpan(
                    text: ' personagens de ',
                    style: title_black_20,
                  ),
                  TextSpan(
                    text: '${controller.characters.value.info!.count}',
                    style: title_blue_20_700,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
