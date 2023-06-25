part of 'pokemon_bloc.dart';

abstract class PokemonListEvent extends Equatable {
  const PokemonListEvent();

  @override
  List<Object?> get props => [];
}

class PokemonListRefreshed extends PokemonListEvent {
  const PokemonListRefreshed();
}

class PokemonListNextPageRequested extends PokemonListEvent {
  const PokemonListNextPageRequested({
    required this.pageNumber,
  });
  final int pageNumber;
}

class PokemonListFailedFetchRetried extends PokemonListEvent {
  const PokemonListFailedFetchRetried();
}
// class FetchPokemonListEvent extends PokemonEvent {
//   final int offset;
//
//   const FetchPokemonListEvent({
//     required this.offset,
//   });
//
//   @override
//   List<Object?> get props => [
//         offset,
//       ];
// }
