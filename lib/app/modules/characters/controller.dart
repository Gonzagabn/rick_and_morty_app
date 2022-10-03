import 'package:get/get.dart';
import 'package:rick_and_morty_app/app/data/models/characters.dart';
import 'package:rick_and_morty_app/app/modules/characters/repository.dart';
import 'package:rick_and_morty_app/core/utils/verify_error.dart';

class CharactersController extends GetxController {
  final CharactersRepository repository;
  CharactersController(this.repository);
  final isReady = false.obs;
  final isLoadingMore = false.obs;
  final characters = CharactersModel().obs;
  final resultsPageIndex = 1.obs;

  @override
  void onInit() async {
    await setupController();
    super.onInit();
  }

  setupController() async {
    await getCharacter();
    isReady.value = true;
  }

  getCharacter() async {
    await repository.getAllCharacters().then((data) {
      if (VerifyError.verify(data)) {
        isReady.value = true;
      } else {
        resultsPageIndex.value++;
        characters.value = data;
      }
    });
  }

  getMoreCharacters() async {
    isLoadingMore.value = true;
    await repository
        .getAllCharacters(page: resultsPageIndex.value)
        .then((data) {
      if (VerifyError.verify(data)) {
        isLoadingMore.value = false;
      } else {
        resultsPageIndex.value++;
        characters.value.results!.addAll(data.results!);
      }
    });
    isLoadingMore.value = false;
  }
}
