part of 'pokemon_bloc.dart';

abstract class PokemonEvent extends Equatable {
  const PokemonEvent();
}

class FetchPokemonListEvent extends PokemonEvent {
  final int offset;

  const FetchPokemonListEvent({
    required this.offset,
  });

  @override
  List<Object?> get props => [
        offset,
      ];
}
