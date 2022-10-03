import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty_app/app/modules/characters/binding.dart';
import 'package:rick_and_morty_app/app/modules/characters/page.dart';
import 'package:rick_and_morty_app/app/modules/details/binding.dart';
import 'package:rick_and_morty_app/app/modules/details/page.dart';
import 'package:rick_and_morty_app/app/modules/favorites/binding.dart';
import 'package:rick_and_morty_app/app/modules/favorites/page.dart';
import 'package:rick_and_morty_app/app/modules/home/binding.dart';
import 'package:rick_and_morty_app/app/modules/home/page.dart';
import 'package:rick_and_morty_app/app/modules/search/binding.dart';
import 'package:rick_and_morty_app/app/modules/search/page.dart';

part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.CHARACTERS,
      page: () => const CharactersPage(key: Key('characters_page')),
      binding: CharactersBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.DETAILS,
      page: () => const DetailsPage(),
      binding: DetailsBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.FAVORITES,
      page: () => const FavoritesPage(key: Key('favorites_page')),
      binding: FavoritesBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.SEARCH,
      page: () => SearchPage(),
      binding: SearchBinding(),
      transition: Transition.cupertino,
    ),
  ];
}
