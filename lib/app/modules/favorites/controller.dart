import 'package:get/get.dart';
import 'package:rick_and_morty_app/app/modules/favorites/repository.dart';

class FavoritesController extends GetxController {
  final FavoritesRepository repository;
  FavoritesController(this.repository);
}
