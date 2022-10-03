import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty_app/app/modules/home/repository.dart';

class HomeController extends GetxController {
  final HomeRepository repository;
  HomeController(this.repository);

  @override
  Future<void> onInit() async {
    FlutterNativeSplash.remove();
    super.onInit();
  }
}
