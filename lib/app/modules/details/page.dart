import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty_app/app/modules/details/controller.dart';
import 'package:rick_and_morty_app/app/modules/details/widgets/character_attributes.dart';
import 'package:rick_and_morty_app/app/widgets/top_section.dart';
import 'package:rick_and_morty_app/core/theme/box_decorations.dart';
import 'package:rick_and_morty_app/core/values/images.dart';
import 'package:rick_and_morty_app/core/utils/size.dart';
import 'package:rick_and_morty_app/core/values/colors.dart';

class DetailsPage extends GetView<DetailsController> {
  const DetailsPage({Key? key}) : super(key: key);

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
              const TopSectionWidget(title: 'Detalhes'),
              Positioned(
                left: 0.0,
                right: 0.0,
                top: 48.0,
                bottom: 0.0,
                child: Container(
                  color: white_color,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Image.asset(
                            logo,
                            color: white_color.withOpacity(0.64),
                            colorBlendMode: BlendMode.modulate,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 2.0),
                        child: RawScrollbar(
                          thickness: 2.0,
                          thumbVisibility: true,
                          thumbColor: brown_color,
                          child: SingleChildScrollView(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () =>
                                              controller.markAsFavorite(),
                                          child: Container(
                                            padding: const EdgeInsets.all(16.0),
                                            decoration:
                                                translucid_blue_box_decoration,
                                            child: Row(
                                              children: [
                                                FadeInImage.assetNetwork(
                                                  height: 200.0,
                                                  width: 200.0,
                                                  placeholder: image1,
                                                  image: controller
                                                      .arguments.image!,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 16.0),
                                                  child: Obx(
                                                    () => Icon(
                                                      controller.isFavorite
                                                                  .value ==
                                                              true
                                                          ? Icons.favorite
                                                          : Icons
                                                              .favorite_border,
                                                      color: white_color,
                                                      size: 64.0,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  CharacterAttributesWidget(
                                    attribute: 'Nome',
                                    attributeValue: controller.arguments.name!,
                                  ),
                                  CharacterAttributesWidget(
                                    attribute: 'Gênero',
                                    attributeValue:
                                        controller.arguments.gender!,
                                  ),
                                  CharacterAttributesWidget(
                                    attribute: 'Origem',
                                    attributeValue:
                                        controller.arguments.origin!.name!,
                                  ),
                                  CharacterAttributesWidget(
                                    attribute: 'Status',
                                    attributeValue:
                                        controller.arguments.status!,
                                  ),
                                  CharacterAttributesWidget(
                                    attribute: 'Spécie',
                                    attributeValue:
                                        controller.arguments.species!,
                                  ),
                                  CharacterAttributesWidget(
                                      attribute: 'Episódios',
                                      attributeValue: controller
                                          .arguments.episode!
                                          .toList()
                                          .toString()
                                          .replaceAll(
                                              'https://rickandmortyapi.com/api/episode/',
                                              '')
                                          .replaceAll('[', '')
                                          .replaceAll(']', '')),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
