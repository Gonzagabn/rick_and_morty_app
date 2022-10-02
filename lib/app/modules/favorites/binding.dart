import 'package:get/get.dart';
import 'package:rick_and_morty_app/app/data/provider/api.dart';
import 'package:rick_and_morty_app/app/modules/favorites/controller.dart';
import 'package:rick_and_morty_app/app/modules/favorites/repository.dart';

class FavoritesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavoritesController>(
        () => FavoritesController(FavoritesRepository(MyApi())));
  }
}
