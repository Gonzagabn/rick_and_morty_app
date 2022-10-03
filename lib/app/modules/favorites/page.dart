import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty_app/app/modules/favorites/controller.dart';
import 'package:rick_and_morty_app/app/widgets/custom_btn.dart';
import 'package:rick_and_morty_app/app/widgets/top_section.dart';
import 'package:rick_and_morty_app/core/theme/box_decorations.dart';
import 'package:rick_and_morty_app/core/theme/text_theme.dart';
import 'package:rick_and_morty_app/core/utils/images.dart';
import 'package:rick_and_morty_app/core/utils/size.dart';
import 'package:rick_and_morty_app/core/values/colors.dart';
import 'package:rick_and_morty_app/routes/pages.dart';

class FavoritesPage extends GetView<FavoritesController> {
  const FavoritesPage({Key? key}) : super(key: key);

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
              const TopSectionWidget(title: 'Favoritos'),
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
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        text:
                                            '${controller.storage.characters.value.results!.length}',
                                        style: title_green_20_700,
                                        children: const [
                                          TextSpan(
                                            text: ' personagens favoritos',
                                            style: title_black_20,
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
                                      itemCount: controller.storage.characters
                                          .value.results!.length,
                                      itemBuilder: ((context, i) {
                                        return GestureDetector(
                                          onTap: () => Get.toNamed(
                                              Routes.DETAILS,
                                              arguments: controller
                                                  .storage
                                                  .characters
                                                  .value
                                                  .results![i]),
                                          child: Container(
                                            width: SizeConfig.wp(100),
                                            padding: const EdgeInsets.all(8.0),
                                            margin: EdgeInsets.only(
                                              bottom: i ==
                                                      controller
                                                              .storage
                                                              .characters
                                                              .value
                                                              .results!
                                                              .length -
                                                          1
                                                  ? 76.0
                                                  : 8.0,
                                            ),
                                            decoration:
                                                translucid_blue_box_decoration,
                                            child: Row(
                                              children: [
                                                Image.network(
                                                  height: 136.0,
                                                  width: 136.0,
                                                  controller.storage.characters
                                                      .value.results![i].image!,
                                                ),
                                                Expanded(
                                                  child: Center(
                                                    child: Text(
                                                      controller
                                                              .storage
                                                              .characters
                                                              .value
                                                              .results![i]
                                                              .name ??
                                                          '',
                                                      style: title_white_20,
                                                      textAlign:
                                                          TextAlign.center,
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
                              Positioned(
                                bottom: 0.0,
                                left: 0.0,
                                right: 0.0,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomButtonWidget(
                                    text: 'LIMPAR FAVORITOS',
                                    callback: controller.storage.characters
                                            .value.results!.isEmpty
                                        ? null
                                        : () async {
                                            await controller.clearFavorites();
                                          },
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
