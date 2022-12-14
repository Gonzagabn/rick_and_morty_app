import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty_app/app/modules/search/controller.dart';
import 'package:rick_and_morty_app/app/widgets/characters_cards_list.dart';
import 'package:rick_and_morty_app/app/widgets/custom_btn.dart';
import 'package:rick_and_morty_app/app/widgets/custom_tff.dart';
import 'package:rick_and_morty_app/app/widgets/top_section.dart';
import 'package:rick_and_morty_app/core/theme/text_theme.dart';
import 'package:rick_and_morty_app/core/values/images.dart';
import 'package:rick_and_morty_app/core/utils/size.dart';
import 'package:rick_and_morty_app/core/values/colors.dart';

class SearchPage extends GetView<SearchController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  SearchPage({Key? key}) : super(key: key);

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
              const TopSectionWidget(title: 'Busca'),
              Positioned(
                left: 0.0,
                right: 0.0,
                top: 48.0,
                bottom: 0.0,
                child: Form(
                  key: _formKey,
                  child: Container(
                    color: white_color,
                    child: Stack(
                      children: [
                        Obx(
                          () => controller.characters.value.results!.isEmpty
                              ? Center(
                                  child: Image.asset(
                                  image3,
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
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, bottom: 8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Padding(
                                            padding:
                                                EdgeInsets.only(right: 8.0),
                                            child: Text(
                                              'Humano',
                                              style: body_black_16_700,
                                            ),
                                          ),
                                          Obx(
                                            () => FlutterSwitch(
                                              width: 40.0,
                                              height: 20.0,
                                              valueFontSize: 14.0,
                                              toggleSize: 15.0,
                                              activeToggleColor:
                                                  bg_medium_blue_color,
                                              activeText: '',
                                              inactiveText: '',
                                              activeColor: green_logo_color,
                                              inactiveColor: black_color,
                                              value: controller
                                                  .humanFilterSelected.value,
                                              borderRadius: 105.0,
                                              padding: 2.5,
                                              showOnOff: true,
                                              onToggle: (val) => controller
                                                  .switchHumanFilter(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Padding(
                                            padding:
                                                EdgeInsets.only(right: 8.0),
                                            child: Text(
                                              'Alien',
                                              style: body_black_16_700,
                                            ),
                                          ),
                                          Obx(
                                            () => FlutterSwitch(
                                              width: 40.0,
                                              height: 20.0,
                                              valueFontSize: 14.0,
                                              toggleSize: 15.0,
                                              activeToggleColor:
                                                  bg_medium_blue_color,
                                              activeText: '',
                                              inactiveText: '',
                                              activeColor: green_logo_color,
                                              inactiveColor: black_color,
                                              value: controller
                                                  .alienFilterSelected.value,
                                              borderRadius: 105.0,
                                              padding: 2.5,
                                              showOnOff: true,
                                              onToggle: (val) => controller
                                                  .switchAlienFilter(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: CustomTffWidget(
                                  text: 'Nome',
                                  icon: const Icon(Icons.search,
                                      color: bg_dark_blue_color),
                                  type: TextInputType.name,
                                  onChanged: (s) => controller.onChangedName(s),
                                  onSaved: (s) => controller.onSavedName(s),
                                  onValidate: (s) =>
                                      controller.onValidateName(s),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Obx(
                          () => controller.characters.value.results!.isEmpty
                              ? const Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 24.0, right: 24.0),
                                    child: Text(
                                      'Busque um personagem pelo nome\n e escolha o filtro que desejar!',
                                      style: body_black_14_700,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(top: 100.0),
                                  child: CharactersCardListWidget(
                                    controller: controller,
                                    scrollController:
                                        controller.scrollController,
                                  ),
                                ),
                        ),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Obx(
                              () => controller.isLoadingMore.value == true
                                  ? SizedBox(
                                      height: 60.0,
                                      width: SizeConfig.wp(100),
                                      child: const Center(
                                          child: CircularProgressIndicator()),
                                    )
                                  : CustomButtonWidget(
                                      text: 'BUSCAR',
                                      callback: () async {
                                        await SystemChannels.textInput
                                            .invokeMethod('TextInput.hide');
                                        final FormState form =
                                            _formKey.currentState!;
                                        if (form.validate()) {
                                          form.save();
                                          controller.setupSearch();
                                        }
                                      },
                                    ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
