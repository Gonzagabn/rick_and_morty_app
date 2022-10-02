import 'package:get/get.dart';
import 'package:rick_and_morty_app/app/data/provider/api.dart';
import 'package:rick_and_morty_app/app/modules/details/controller.dart';
import 'package:rick_and_morty_app/app/modules/details/repository.dart';

class DetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsController>(
        () => DetailsController(DetailsRepository(MyApi())));
  }
}
