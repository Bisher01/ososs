import 'package:dartz/dartz.dart';
import 'package:ososs/core/error/failures.dart';
import 'package:ososs/features/pokemons/domain/entities/pokemon_entity.dart';

abstract class PokemonRepository {
  Future<Either<Failure, PokemonListEntity>> getPokemonList({required int offset});
}
