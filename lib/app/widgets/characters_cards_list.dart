import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty_app/core/theme/box_decorations.dart';
import 'package:rick_and_morty_app/core/theme/text_theme.dart';
import 'package:rick_and_morty_app/core/utils/size.dart';
import 'package:rick_and_morty_app/core/values/colors.dart';
import 'package:rick_and_morty_app/core/values/images.dart';
import 'package:rick_and_morty_app/routes/pages.dart';

class CharactersCardListWidget extends Container {
  final controller;
  final ScrollController? scrollController;
  final bool isFavoritesPage;

  CharactersCardListWidget({
    required this.controller,
    this.scrollController,
    this.isFavoritesPage = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.only(right: 2.0, top: 40.0, bottom: 0.0),
        child: RawScrollbar(
          thickness: 2.0,
          controller: scrollController,
          thumbVisibility: true,
          thumbColor: brown_color,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: ListView.builder(
              shrinkWrap: true,
              controller: scrollController,
              itemCount: isFavoritesPage
                  ? controller.storage.characters.value.results!.length
                  : controller.characters.value.results!.length,
              itemBuilder: ((context, i) {
                return GestureDetector(
                  onTap: () => Get.toNamed(Routes.DETAILS,
                      arguments: isFavoritesPage
                          ? controller.storage.characters.value.results![i]
                          : controller.characters.value.results![i]),
                  child: Container(
                    width: SizeConfig.wp(100),
                    padding: const EdgeInsets.all(8.0),
                    margin: EdgeInsets.only(
                      bottom: isFavoritesPage
                          ? i ==
                                  controller.storage.characters.value.results!
                                          .length -
                                      1
                              ? 76.0
                              : 8.0
                          : i == controller.characters.value.results!.length - 1
                              ? 76.0
                              : 8.0,
                    ),
                    decoration: translucid_blue_box_decoration,
                    child: Row(
                      children: [
                        isFavoritesPage
                            ? Image.network(
                                controller.storage.characters.value.results![i]
                                    .image!,
                                height: 136.0,
                                width: 136.0,
                              )
                            : FadeInImage.assetNetwork(
                                height: 136.0,
                                width: 136.0,
                                placeholder: image1,
                                image: isFavoritesPage
                                    ? controller.storage.characters.value
                                        .results![i].image!
                                    : controller
                                        .characters.value.results![i].image!,
                              ),
                        Expanded(
                          child: Center(
                            child: Text(
                              isFavoritesPage
                                  ? controller.storage.characters.value
                                          .results![i].name ??
                                      ''
                                  : controller
                                          .characters.value.results![i].name ??
                                      '',
                              style: title_white_20,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
