import 'dart:convert';

import '../../../../core/const/messages.dart';
import '../../../../core/const/url_builder.dart';
import '../../../../core/data_sources/http_client.dart';
import '../../../../core/error/exceptions.dart';
import '../models/pokemon_model.dart';

abstract class PokemonDataSource{
  Future<PokemonListModel> fetchPokemonList({required int offset});
}

class PokemonDataSourceImpl extends PokemonDataSource{

  final HttpService client;
  final UrlBuilder urlBuilder;

  PokemonDataSourceImpl({required this.client}):urlBuilder=const UrlBuilder();

  @override
  Future<PokemonListModel> fetchPokemonList({required int offset})  async {
    var url = Uri.parse(urlBuilder.buildGetPokemonListPageUrl(offset));
    final response = await client.get(url).timeout(const Duration(seconds: 10));
    var data = json.decode(response.body);
    if (response.statusCode >= 200 && response.statusCode <= 300) {
      var pokemonData = PokemonListModel.fromJson(data);
      return pokemonData;
    } else {
      throw ServerException(message: fetchPokemonErrorMessage);
    }
  }

}