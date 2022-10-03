import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rick_and_morty_app/app/data/models/characters.dart';
import 'package:rick_and_morty_app/core/values/store_keys.dart';

class StorageService extends GetxService {
  GetStorage? box;
  final characters = CharactersModel(results: []).obs;

  Future<StorageService> init() async {
    await setupService();
    return this;
  }

  setupService() async {
    box = GetStorage();
    await box?.writeIfNull(favoriteCharacters, null);
    await checkForFavoriteCharacters();
  }

  checkForFavoriteCharacters() async {
    var storedCharacters = await getStorageFavoriteCharacters();
    if (storedCharacters != null) {
      characters.value = CharactersModel.fromJson(storedCharacters);
    }
  }

  saveStorageFavoriteCharacters() async =>
      await box?.write(favoriteCharacters, characters.value);

  getStorageFavoriteCharacters() async => await box?.read(favoriteCharacters);
}
