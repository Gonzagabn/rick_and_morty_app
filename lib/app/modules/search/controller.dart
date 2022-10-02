import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty_app/app/data/models/characters.dart';
import 'package:rick_and_morty_app/app/modules/search/repository.dart';
import 'package:rick_and_morty_app/core/utils/get_errors.dart';
import 'package:rick_and_morty_app/core/utils/size.dart';

class SearchController extends GetxController {
  final SearchRepository repository;
  SearchController(this.repository);

  final isLoadingMore = false.obs;
  final characters = CharactersModel().obs;
  final resultsPageIndex = 1.obs;
  final humanFilterSelected = false.obs;
  final alienFilterSelected = false.obs;
  final characterName = ''.obs;
  final query = ''.obs;
  final scrollController = ScrollController();

  @override
  void onInit() async {
    scrollController.addListener(scrollListener);
    super.onInit();
  }

  scrollListener() {
    if ((scrollController.offset / 152.0).round().toInt() >= 5) {
      print('object');
    }
  }

  switchHumanFilter() => humanFilterSelected.value = !humanFilterSelected.value;

  switchAlienFilter() => alienFilterSelected.value = !alienFilterSelected.value;

  setNameFilter() {
    query.value = 'name=${characterName.value}';
  }

  setSpeciesFilter() {
    if (humanFilterSelected.value == true &&
        alienFilterSelected.value == true) {
      query.value = '${query.value}&species=Human&species=Alien';
    } else if (humanFilterSelected.value == true) {
      query.value = '${query.value}&species=Human';
    } else if (alienFilterSelected.value == true) {
      query.value = '${query.value}&species=Alien';
    }
  }

  setQueryParameters() async {
    query.value = '';
    await setNameFilter();
    await setSpeciesFilter();
    await getFilteredCharacters();
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

  getMoreFilteredCharacters() async {
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
        characters.value.results!.addAll(data.results!);
      }
    });
    isLoadingMore.value = false;
  }

  onChangedName(s) => characterName.value = s;
  onValidateName(s) =>
      s.length >= 3 && s.length <= 100 ? null : 'Insira um nome válido.';
  onSavedName(s) => characterName.value = s;
}
