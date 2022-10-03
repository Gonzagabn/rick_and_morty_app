import 'package:get/get.dart';
import 'package:rick_and_morty_app/app/data/services/storage/service.dart';
import 'package:rick_and_morty_app/app/modules/favorites/repository.dart';

class FavoritesController extends GetxController {
  final FavoritesRepository repository;
  FavoritesController(this.repository);
  late StorageService storage;
  final isReady = false.obs;

  @override
  void onInit() async {
    await setupController();
    super.onInit();
  }

  setupController() async {
    storage = Get.find<StorageService>();
    isReady.value = true;
  }

  clearFavorites() {
    storage.characters.update((val) => val!.results!.clear());
    storage.saveStorageFavoriteCharacters();
  }
}
