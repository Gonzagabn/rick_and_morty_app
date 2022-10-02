import 'package:get/get.dart';
import 'package:rick_and_morty_app/app/data/models/characters.dart';
import 'package:rick_and_morty_app/app/modules/characters/repository.dart';
import 'package:rick_and_morty_app/core/utils/get_errors.dart';

class CharactersController extends GetxController {
  final CharactersRepository repository;
  CharactersController(this.repository);
  final isReady = false.obs;
  final isLoadingMore = false.obs;
  final characters = Characters().obs;
  final resultsPageIndex = 1.obs;

  @override
  void onInit() {
    getCharacter();
    super.onInit();
  }

  getCharacter() async {
    isReady.value = false;
    await repository.getCharacter().then((data) {
      if (VerifyError.verify(data)) {
        isReady.value = true;
      } else {
        characters.value = data;
      }
    });
    isReady.value = true;
  }

  getMoreCharacters(index) async {
    isLoadingMore.value = true;
    await repository.getCharacter().then((data) {
      if (VerifyError.verify(data)) {
        isLoadingMore.value = false;
      } else {
        data as Characters;
        resultsPageIndex.value++;
        characters.value.results!.addAll(data.results!);
      }
    });
    isLoadingMore.value = false;
  }
}
