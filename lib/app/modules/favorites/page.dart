import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty_app/app/modules/favorites/controller.dart';
import 'package:rick_and_morty_app/app/widgets/characters_cards_list.dart';
import 'package:rick_and_morty_app/app/widgets/custom_btn.dart';
import 'package:rick_and_morty_app/app/widgets/top_section.dart';
import 'package:rick_and_morty_app/core/theme/text_theme.dart';
import 'package:rick_and_morty_app/core/values/images.dart';
import 'package:rick_and_morty_app/core/utils/size.dart';
import 'package:rick_and_morty_app/core/values/colors.dart';

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
                              controller
                                      .storage.characters.value.results!.isEmpty
                                  ? Center(
                                      child: Image.asset(
                                      image2,
                                      color: white_color.withOpacity(0.16),
                                      colorBlendMode: BlendMode.modulate,
                                    ))
                                  : Padding(
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
                              controller
                                      .storage.characters.value.results!.isEmpty
                                  ? const Center(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 24.0, right: 24.0),
                                        child: Text(
                                          'Quando você clica na foto de um personagem\n na página de detalhes ele vem parar aqui!',
                                          style: body_black_14_700,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    )
                                  : CharactersCardListWidget(
                                      controller: controller,
                                      isFavoritesPage: true,
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
