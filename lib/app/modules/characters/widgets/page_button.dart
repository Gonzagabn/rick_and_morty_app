import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty_app/app/modules/characters/controller.dart';
import 'package:rick_and_morty_app/app/widgets/custom_btn.dart';
import 'package:rick_and_morty_app/core/utils/size.dart';

class CharacterPageButonWidget extends Container {
  final controller = Get.find<CharactersController>();

  CharacterPageButonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0.0,
      left: 0.0,
      right: 0.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: controller.isLoadingMore.value == true
            ? SizedBox(
                height: 60.0,
                width: SizeConfig.wp(100),
                child: const Center(child: CircularProgressIndicator()),
              )
            : CustomButtonWidget(
                text: 'CARREGAR MAIS',
                callback: controller.characters.value.results!.length ==
                        controller.characters.value.info!.count
                    ? null
                    : () => controller.getMoreCharacters(),
              ),
      ),
    );
  }
}
