import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty_app/app/modules/characters/controller.dart';
import 'package:rick_and_morty_app/app/widgets/custom_btn.dart';
import 'package:rick_and_morty_app/app/widgets/top_section.dart';
import 'package:rick_and_morty_app/core/theme/box_decorations.dart';
import 'package:rick_and_morty_app/core/theme/text_theme.dart';
import 'package:rick_and_morty_app/core/utils/images.dart';
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
              TopSectionWidget(
                controller: controller,
                title: 'Personagens',
              ),
              Positioned(
                left: 0.0,
                right: 0.0,
                top: 48.0,
                bottom: 0.0,
                child: Obx(
                  () => Container(
                    color: white_color,
                    child: controller.isReady.value == false
                        ? const Center(child: CircularProgressIndicator())
                        : Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(child: Image.asset(logo)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        text:
                                            '${controller.characters.value.results!.length}',
                                        style: title_green_20_700,
                                        children: [
                                          const TextSpan(
                                            text: ' personagens de ',
                                            style: title_black_20,
                                          ),
                                          TextSpan(
                                            text:
                                                '${controller.characters.value.info!.count}',
                                            style: title_blue_20_700,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 2.0, top: 40.0, bottom: 0.0),
                                child: RawScrollbar(
                                  thickness: 2.0,
                                  thumbVisibility: true,
                                  thumbColor: brown_color,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8.0),
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: controller
                                          .characters.value.results!.length,
                                      itemBuilder: ((context, i) {
                                        return Container(
                                          width: SizeConfig.wp(100),
                                          padding: const EdgeInsets.all(8.0),
                                          margin: EdgeInsets.only(
                                            bottom: i ==
                                                    controller.characters.value
                                                            .results!.length -
                                                        1
                                                ? 76.0
                                                : 8.0,
                                          ),
                                          decoration:
                                              translucid_blue_box_decoration,
                                          child: Row(
                                            children: [
                                              FadeInImage.assetNetwork(
                                                  height: 136.0,
                                                  width: 136.0,
                                                  placeholder: image1,
                                                  image: controller
                                                      .characters
                                                      .value
                                                      .results![i]
                                                      .image!),
                                              Expanded(
                                                child: Center(
                                                  child: Text(
                                                    controller.characters.value
                                                            .results![i].name ??
                                                        '',
                                                    style: title_white_20,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0.0,
                                left: 0.0,
                                right: 0.0,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: controller.isLoadingMore.value == true
                                      ? SizedBox(
                                          height: 60.0,
                                          width: SizeConfig.wp(100),
                                          child: const Center(
                                              child:
                                                  CircularProgressIndicator()),
                                        )
                                      : CustomButtonWidget(
                                          text: 'CARREGAR MAIS',
                                          callback: () =>
                                              controller.getMoreCharacters(),
                                        ),
                                ),
                              )
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
