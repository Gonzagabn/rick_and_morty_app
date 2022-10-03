import 'package:get/get.dart';
import 'package:rick_and_morty_app/app/modules/home/repository.dart';

class HomeController extends GetxController {
  final HomeRepository repository;
  HomeController(this.repository);

  @override
  void onInit() async {
    super.onInit();
  }
}
