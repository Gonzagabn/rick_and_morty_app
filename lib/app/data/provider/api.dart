import 'package:get/get.dart';
import 'package:rick_and_morty_app/app/data/models/characters.dart';

const baseUrl = 'https://rickandmortyapi.com/api';

class MyApi extends GetConnect {
  getCharacter() async {
    final resp = await get('$baseUrl/character', decoder: (_) => _);
    return Characters.fromJson(resp.body);
  }

  getLocation() async {
    final resp = await get('$baseUrl/location', decoder: (_) => _);
    print(resp.statusCode);
    print(resp.body);
    return resp.body;
  }

  getEpisode() async {
    final resp = await get('$baseUrl/episode', decoder: (_) => _);
    print(resp.statusCode);
    print(resp.body);
    return resp.body;
  }
}
