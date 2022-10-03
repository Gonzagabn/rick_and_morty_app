import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rick_and_morty_app/app/data/services/storage/service.dart';
import 'package:rick_and_morty_app/app/modules/home/binding.dart';
import 'package:rick_and_morty_app/app/modules/home/page.dart';
import 'package:rick_and_morty_app/core/values/colors.dart';
import 'package:rick_and_morty_app/routes/pages.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
  ));

  await GetStorage.init();
  await Get.putAsync(() => StorageService().init());

  runApp(
    GetMaterialApp(
      // debugShowMaterialGrid: true,
      enableLog: true,
      debugShowCheckedModeBanner: false,
      title: "Rick and Morty",
      theme: ThemeData(
          primaryColor: bg_dark_blue_color,
          colorScheme: ColorScheme.fromSeed(seedColor: bg_dark_blue_color)),
      initialBinding: HomeBinding(),
      home: const HomePage(key: Key('home')),
      getPages: AppPages.pages,
    ),
  );
}
