import 'package:get/get.dart';
import 'package:rick_and_morty_app/app/modules/details/repository.dart';

class DetailsController extends GetxController {
  final DetailsRepository repository;
  DetailsController(this.repository);
}
