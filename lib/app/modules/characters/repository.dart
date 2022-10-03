import 'package:rick_and_morty_app/app/data/provider/api.dart';

class CharactersRepository {
  final MyApi api;

  CharactersRepository(this.api);
  getAllCharacters({page}) => api.getCharacters(page: page);
}
