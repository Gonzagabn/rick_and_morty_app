import 'package:get/get.dart';
import 'package:rick_and_morty_app/app/data/models/characters.dart';
import 'package:rick_and_morty_app/core/utils/http_status_response.dart';

const baseUrl = 'https://rickandmortyapi.com/api/character';

class MyApi extends GetConnect {
  getCharacters({query, page}) async {
    final resp =
        await get('$baseUrl/?${query ?? ''}page=$page', decoder: (_) => _);
    return HttpStatusResponse.verifyData(resp.statusCode,
        callback: CharactersModel.fromJson(resp.body));
  }
}
