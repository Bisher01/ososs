import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/pokemon_entity.dart';
import '../../domain/repositories/pokemon_repository.dart';
import '../data_sources/pokemon_data_source.dart';

class PokemonRepositoryImpl extends PokemonRepository {
  final PokemonDataSource pokemonDataSource;

  PokemonRepositoryImpl({
    required this.pokemonDataSource,
  });

  @override
  Future<Either<Failure, PokemonListEntity>> getPokemonList(
      {required int offset}) async {
    try {
      PokemonListEntity pokemonListEntity =
          await pokemonDataSource.fetchPokemonList(offset: offset);
      return Right(pokemonListEntity);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(message: e.message),
      );
    } on Exception catch (e) {
      return Left(
        ServerFailure(
          message: e.toString(),
        ),
      );
    }
  }
}
