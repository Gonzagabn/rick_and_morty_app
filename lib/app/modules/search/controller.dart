import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty_app/app/data/models/characters.dart';
import 'package:rick_and_morty_app/app/modules/search/repository.dart';
import 'package:rick_and_morty_app/core/utils/verify_error.dart';

class SearchController extends GetxController {
  final SearchRepository repository;
  SearchController(this.repository);

  final isLoadingMore = false.obs;
  final characters = CharactersModel(results: []).obs;
  // Query Parameters
  final resultsPageIndex = 1.obs;
  final humanFilterSelected = false.obs;
  final alienFilterSelected = false.obs;
  final characterName = ''.obs;
  final query = ''.obs;
  // Scroll Behavior
  final scrollController = ScrollController();
  final lockForMoreCharacters = false.obs;

  @override
  void onInit() async {
    scrollController.addListener(scrollListener);
    super.onInit();
  }

  switchHumanFilter() {
    humanFilterSelected.value = !humanFilterSelected.value;
    if (humanFilterSelected.value == true &&
        alienFilterSelected.value == true) {
      alienFilterSelected.value = false;
    }
  }

  switchAlienFilter() {
    alienFilterSelected.value = !alienFilterSelected.value;
    if (humanFilterSelected.value == true &&
        alienFilterSelected.value == true) {
      humanFilterSelected.value = false;
    }
  }

  setupSearch() {
    clearResultsList();
    resetResultsPageIndex();
    resetLockForMoreCharacters();
    resetQueryParameters();
    setQueryParameters();
  }

  clearResultsList() => characters.value.results!.clear();

  resetResultsPageIndex() => resultsPageIndex.value = 1;

  resetLockForMoreCharacters() => lockForMoreCharacters.value = false;

  resetQueryParameters() => query.value = '';

  setQueryParameters() async {
    await setNameFilter();
    await setSpeciesFilter();
    await getFilteredCharacters();
  }

  setNameFilter() => query.value = 'name=${characterName.value}&';

  setSpeciesFilter() {
    // if (humanFilterSelected.value == true &&
    //     alienFilterSelected.value == true) {
    //   query.value = '${query.value}&species=Alien&species=Human&';
    //   query.value = '${query.value}&species[]=Alien&species[]=Human&';
    //   query.value = '${query.value}&species=Alien&Human&';
    //   query.value = '${query.value}&species=Alien,Human&';
    // } else
    if (humanFilterSelected.value == true) {
      query.value = '${query.value}species=Human&';
    } else if (alienFilterSelected.value == true) {
      query.value = '${query.value}species=Alien&';
    }
  }

  getFilteredCharacters() async {
    isLoadingMore.value = true;
    await repository
        .getFilteredCharacters(query: query.value, page: resultsPageIndex.value)
        .then((data) {
      if (VerifyError.verify(data)) {
        isLoadingMore.value = false;
      } else {
        if (data.info!.next != null) {
          resultsPageIndex.value++;
        }
        characters.value = data;
      }
    });
    isLoadingMore.value = false;
  }

  onChangedName(s) => characterName.value = s;
  onValidateName(s) =>
      s.length >= 2 && s.length <= 100 ? null : 'Insira um nome válido.';
  onSavedName(s) => characterName.value = s;

  scrollListener() {
    if (lockForMoreCharacters.value == false) {
      if (characters.value.results!.length >= 10) {
        if ((scrollController.offset / 152.0).round().toInt() >=
            (characters.value.results!.length - 5)) {
          lockForMoreCharacters.value = true;
          getMoreFilteredCharacters();
          return;
        }
      }
    }
  }

  getMoreFilteredCharacters() async {
    if (characters.value.results!.length < characters.value.info!.count!) {
      await repository
          .getFilteredCharacters(
              query: query.value, page: resultsPageIndex.value)
          .then((data) {
        if (VerifyError.verify(data)) {
          lockForMoreCharacters.value = false;
        } else {
          if (data.info!.next != null) {
            resultsPageIndex.value++;
          }
          characters.update((val) => val!.results!.addAll(data.results!));
        }
      });
      lockForMoreCharacters.value = false;
    }
  }
}
