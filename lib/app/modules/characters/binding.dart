import 'package:get/get.dart';
import 'package:rick_and_morty_app/app/data/provider/api.dart';
import 'package:rick_and_morty_app/app/modules/characters/controller.dart';
import 'package:rick_and_morty_app/app/modules/characters/repository.dart';

class CharactersBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CharactersController>(
        () => CharactersController(CharactersRepository(MyApi())));
  }
}
