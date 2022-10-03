import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty_app/app/data/models/characters.dart';
import 'package:rick_and_morty_app/app/data/services/storage/service.dart';
import 'package:rick_and_morty_app/app/modules/details/repository.dart';
import 'package:rick_and_morty_app/core/theme/text_theme.dart';
import 'package:rick_and_morty_app/core/values/colors.dart';

class DetailsController extends GetxController {
  final DetailsRepository repository;
  DetailsController(this.repository);
  late Result arguments;
  late StorageService storage;
  final isFavorite = false.obs;

  @override
  void onInit() async {
    await setupController();
    super.onInit();
  }

  setupController() async {
    arguments = Get.arguments;
    storage = Get.find<StorageService>();
    await checkFavoriteStatus();
  }

  checkFavoriteStatus() {
    print(arguments.toJson());
    print('checkFavoriteStatus');
    if (storage.characters.value.results!.contains(arguments)) {
      print('true');
      isFavorite.value = true;
    } else {
      print('false');
      isFavorite.value = false;
    }
  }

  markAsFavorite() async {
    toggleFavorite();
    showSnackBarFavoriteStatus();
    if (isFavorite.value == true) {
      await addCharacterToFavoritesList();
    } else {
      await removeCharacterFromFavoritesList();
    }
    await saveFavorites();
  }

  toggleFavorite() => isFavorite.value = !isFavorite.value;

  showSnackBarFavoriteStatus() {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 1),
        backgroundColor:
            isFavorite.value == true ? green_logo_color : black_color,
        content: Text(
          isFavorite.value == true
              ? 'Adicionado na lista de favoritos'
              : 'Removido da lista de favoritos',
          style:
              isFavorite.value == true ? body_black_14_700 : body_white_14_700,
        ),
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(
            label: 'FECHAR',
            textColor: isFavorite.value == true ? black_color : white_color,
            onPressed: () =>
                ScaffoldMessenger.of(Get.context!).clearSnackBars()),
      ),
    );
  }

  addCharacterToFavoritesList() {
    storage.characters.value.results!.addIf(
        storage.characters.value.results!
                .firstWhereOrNull((element) => element == arguments) ==
            null,
        arguments);
  }

  removeCharacterFromFavoritesList() {
    storage.characters.update((val) =>
        val!.results!.removeWhere(((element) => element == arguments)));
  }

  saveFavorites() => storage.saveStorageFavoriteCharacters();
}
