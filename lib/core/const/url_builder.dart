class UrlBuilder {
  const UrlBuilder({
    String? baseUrl,
  }) : _baseUrl = baseUrl ?? 'https://pokeapi.co/api/v2';

  final String _baseUrl;

  String buildGetPokemonListPageUrl(int page) {
    return '$_baseUrl/pokemon?limit=20&offset=$page';
  }

  static String buildGetPokemonImageUrl(String id){
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';
  }

}
