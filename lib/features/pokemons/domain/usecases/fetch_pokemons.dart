import 'package:dartz/dartz.dart';
import 'package:ososs/core/error/failures.dart';
import 'package:ososs/core/usecases/usecase.dart';
import 'package:ososs/features/pokemons/domain/entities/pokemon_entity.dart';
import 'package:ososs/features/pokemons/domain/repositories/pokemon_repository.dart';

class FetchPokemons extends UseCase<PokemonListEntity,int>{

  final PokemonRepository pokemonRepository;

  FetchPokemons({required this.pokemonRepository});

  @override
  Future<Either<Failure, PokemonListEntity>> call({required int params}) async {
   return await pokemonRepository.getPokemonList(offset: params);
  }
}