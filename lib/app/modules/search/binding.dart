import 'package:get/get.dart';
import 'package:rick_and_morty_app/app/data/provider/api.dart';
import 'package:rick_and_morty_app/app/modules/search/controller.dart';
import 'package:rick_and_morty_app/app/modules/search/repository.dart';

class SearchBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchController>(
        () => SearchController(SearchRepository(MyApi())));
  }
}
