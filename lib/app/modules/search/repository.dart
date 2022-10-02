import 'package:rick_and_morty_app/app/data/provider/api.dart';

class SearchRepository {
  final MyApi api;

  SearchRepository(this.api);
  getFilteredCharacters({query, page}) =>
      api.getFilteredCharacters(query: query, page: page);
}
