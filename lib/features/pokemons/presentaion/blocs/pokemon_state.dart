part of 'pokemon_bloc.dart';

abstract class PokemonState extends Equatable {
  const PokemonState();
}

class PokemonInitialState extends PokemonState {
  @override
  List<Object> get props => [];
}

class PokemonLoadingState extends PokemonState {
  @override
  List<Object> get props => [];
}

class PokemonSuccessState extends PokemonState {
  final PokemonListEntity pokemonListEntity;

  const PokemonSuccessState({
    required this.pokemonListEntity,
  });
  @override
  List<Object> get props => [
        pokemonListEntity,
      ];
}
