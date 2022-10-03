import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty_app/app/modules/characters/controller.dart';
import 'package:rick_and_morty_app/app/modules/characters/widgets/header_section.dart';
import 'package:rick_and_morty_app/app/modules/characters/widgets/page_button.dart';
import 'package:rick_and_morty_app/app/widgets/characters_cards_list.dart';
import 'package:rick_and_morty_app/app/widgets/top_section.dart';
import 'package:rick_and_morty_app/core/values/images.dart';
import 'package:rick_and_morty_app/core/utils/size.dart';
import 'package:rick_and_morty_app/core/values/colors.dart';

class CharactersPage extends GetView<CharactersController> {
  const CharactersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: SizeConfig.hp(100.0),
        width: SizeConfig.wp(100.0),
        color: bg_dark_blue_color,
        child: SafeArea(
          child: Stack(
            children: [
              const TopSectionWidget(title: 'Personagens'),
              Positioned(
                left: 0.0,
                right: 0.0,
                top: 48.0,
                bottom: 0.0,
                child: Container(
                  color: white_color,
                  child: Obx(
                    () => controller.isReady.value == false
                        ? const Center(child: CircularProgressIndicator())
                        : Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                    child: Image.asset(
                                  logo,
                                  color: white_color.withOpacity(0.64),
                                  colorBlendMode: BlendMode.modulate,
                                )),
                              ),
                              CharacterHeaderSectionWidget(),
                              CharactersCardListWidget(controller: controller),
                              CharacterPageButonWidget()
                            ],
                          ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
