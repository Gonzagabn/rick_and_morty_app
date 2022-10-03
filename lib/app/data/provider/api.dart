import 'package:get/get.dart';
import 'package:rick_and_morty_app/app/data/models/characters.dart';

const baseUrl = 'https://rickandmortyapi.com/api';

class MyApi extends GetConnect {
  getAllCharacters({page}) async {
    final resp = await get('$baseUrl/character/?page=$page', decoder: (_) => _);
    return CharactersModel.fromJson(resp.body);
  }

  getFilteredCharacters({query, page}) async {
    final resp =
        await get('$baseUrl/character/?$query&page=$page', decoder: (_) => _);
    return CharactersModel.fromJson(resp.body);
  }
}
