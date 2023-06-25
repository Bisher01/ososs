import 'package:equatable/equatable.dart';

class PokemonListEntity extends Equatable {
  final int count;
  final String? next;
  final String? previous;
  final List<PokemonEntity> results;

  const PokemonListEntity({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  @override
  List<Object?> get props => [
        count,
        next,
        previous,
        results,
      ];
}

class PokemonEntity extends Equatable {
  final String name;
  final String url;
  final String image;

  const PokemonEntity({
    required this.name,
    required this.url,
    required this.image,
  });

  @override
  List<Object?> get props => [
        name,
        url,
    image,
      ];
}
