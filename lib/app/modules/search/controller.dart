import 'package:get/get.dart';
import 'package:rick_and_morty_app/app/modules/search/repository.dart';

class SearchController extends GetxController {
  final SearchRepository repository;
  SearchController(this.repository);
}
