import 'package:get/get.dart';
import 'package:rick_and_morty_app/app/data/provider/api.dart';
import 'package:rick_and_morty_app/app/modules/home/controller.dart';
import 'package:rick_and_morty_app/app/modules/home/repository.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(HomeRepository(MyApi())));
  }
}
