import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rick_and_morty_app/core/values/store_keys.dart';

class StorageService extends GetxService {
  GetStorage? box;

  Future<StorageService> init() async {
    box = GetStorage();
    await box?.writeIfNull(favoriteCharacters, []);
    return this;
  }

  clearLocalStorage() async {
    await box?.writeIfNull(favoriteCharacters, []);
  }

  saveStorageFavoriteCharacters(characters) async =>
      await box?.write(favoriteCharacters, characters);
  getStorageFavoriteCharacters() async => await box?.read(favoriteCharacters);
}
