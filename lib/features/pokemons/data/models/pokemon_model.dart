import 'package:ososs/features/pokemons/domain/entities/pokemon_entity.dart';

class PokemonListModel extends PokemonListEntity {
  const PokemonListModel({
    required int count,
    required String next,
    required String previous,
    required List<PokemonModel> results,
  }) : super(
          count: count,
          next: next,
          previous: previous,
          results: results,
        );

  factory PokemonListModel.fromJson(Map<String, dynamic> json) {
    return PokemonListModel(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results:
          (json['results'] as List).map((e) => PokemonModel.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['count'] = count;
    data['next'] = next;
    data['previous'] = previous;
    if (results.isNotEmpty) {
      data['results'] = (results as List<PokemonModel>).map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PokemonModel extends PokemonEntity{

  const PokemonModel({
    required String name,
    required String url,
  }) : super(name: name, url:url);

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(name: json['name'], url: json['url']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}
