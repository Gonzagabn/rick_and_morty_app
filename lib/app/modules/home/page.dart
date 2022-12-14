import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty_app/app/modules/home/controller.dart';
import 'package:rick_and_morty_app/app/modules/home/widgets/home_card.dart';
import 'package:rick_and_morty_app/app/widgets/top_section.dart';
import 'package:rick_and_morty_app/core/theme/text_theme.dart';
import 'package:rick_and_morty_app/core/values/images.dart';
import 'package:rick_and_morty_app/core/utils/size.dart';
import 'package:rick_and_morty_app/core/values/colors.dart';
import 'package:rick_and_morty_app/routes/pages.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        height: SizeConfig.hp(100.0),
        width: SizeConfig.wp(100.0),
        color: bg_dark_blue_color,
        child: SafeArea(
          child: Stack(
            children: [
              Stack(
                children: [
                  Container(
                    height: 48.0,
                    width: SizeConfig.wp(100),
                    color: bg_dark_blue_color,
                    child: Row(
                      children: const [
                        SizedBox(width: 16.0),
                        Text('Home', style: title_white_20_700),
                      ],
                    ),
                  ),
                  Positioned(
                      top: 4.0,
                      bottom: 4.0,
                      right: 4.0,
                      child: Center(child: Image.asset(logo)))
                ],
              ),
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
                        )),
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
                                  HomeCardWidget(
                                    key: const Key('characters_buton'),
                                    title: 'Lista de Personagens',
                                    description:
                                        'Lista completa dos personagens de Rick and Morty.',
                                    iconData: Icons.list_rounded,
                                    imageAsset: characters,
                                    route: Routes.CHARACTERS,
                                  ),
                                  HomeCardWidget(
                                    title: 'Busca',
                                    description:
                                        'Busque por personagens do seu interesse quando quiser!',
                                    iconData: Icons.search,
                                    imageAsset: search,
                                    route: Routes.SEARCH,
                                  ),
                                  HomeCardWidget(
                                    key: const Key('favorites_buton'),
                                    title: 'Favoritos',
                                    description:
                                        'Veja todos os personagens que voc?? marcou como favorito.',
                                    iconData: Icons.favorite,
                                    imageAsset: favorites,
                                    route: Routes.FAVORITES,
                                  ),
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
