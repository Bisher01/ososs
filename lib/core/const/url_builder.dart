class UrlBuilder {
  const UrlBuilder({
    String? baseUrl,
  }) : _baseUrl = baseUrl ?? 'https://pokeapi.co/api/v2';

  final String _baseUrl;

  String buildGetPokemonListPageUrl(int page) {
    return '$_baseUrl/pokemon?limit=20&offset=$page';
  }

  String buildGetPokemonImageUrl(int id){
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/$id.png';
  }

}
