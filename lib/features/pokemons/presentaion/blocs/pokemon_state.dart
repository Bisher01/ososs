part of 'pokemon_bloc.dart';

class PokemonListState extends Equatable {
  const PokemonListState({
    this.itemList,
    this.nextPage,
    this.error,
    this.refreshError,
  });

  /// Holds all of the items from the pages you have loaded so far.
  final List<PokemonEntity>? itemList;

  /// The next page to be fetched, or `null` if you have already loaded the entire list.
  ///
  /// Besides determining which page should be asked next, it also determines
  /// whether you need a loading indicator at the bottom to indicate you haven't
  /// fetched all pages yet.
  final int? nextPage;

  /// Indicates an error occurred trying to fetch any page of quotes.
  ///
  /// If both this property and [itemList] holds values, that means the error
  /// occurred trying to fetch a subsequent page. If, on the other hand, this
  /// property has a value but [itemList] doesn't, that means the error occurred
  /// when fetching the first page.
  final dynamic error;


  /// Indicates an error occurred trying to refresh the list.
  ///
  /// Used to display a toast to indicate the failure.
  final dynamic refreshError;


  /// Auxiliary constructor that facilitates building the state for when the app
  /// couldn't find any items for the selected filter.
  const PokemonListState.noItemsFound() : this(
    itemList: const [],
    error: null,
    nextPage: 1,
  );

  /// Auxiliary constructor that facilitates building the state for when the app
  /// has successfully loaded a new page.
  const PokemonListState.success({
    required int? nextPage,
    required List<PokemonEntity> itemList,
    required bool isRefresh,
  }) : this(
    nextPage: nextPage,
    itemList: itemList,
  );

  /// Auxiliary function that creates a copy of the current state with a new
  /// value for the [error] property.
  PokemonListState copyWithNewError(
      dynamic error,
      ) =>
      PokemonListState(
        itemList: itemList,
        nextPage: nextPage,
        error: error,
        refreshError: null,
      );

  /// Auxiliary function that creates a copy of the current state with a new
  /// value for the [refreshError] property.
  PokemonListState copyWithNewRefreshError(
      dynamic refreshError,
      ) =>
      PokemonListState(
        itemList: itemList,
        nextPage: nextPage,
        error: error,
        refreshError: refreshError,
      );


  @override
  List<Object?> get props => [
    itemList,
    nextPage,
    error,
    refreshError,
  ];
}

// abstract class PokemonState extends Equatable {
//   const PokemonState();
// }
//
// class PokemonInitialState extends PokemonState {
//   @override
//   List<Object> get props => [];
// }
//
// class PokemonLoadingState extends PokemonState {
//   @override
//   List<Object> get props => [];
// }
//
// class PokemonSuccessState extends PokemonState {
//   final PokemonListEntity pokemonListEntity;
//
//   const PokemonSuccessState({
//     required this.pokemonListEntity,
//   });
//   @override
//   List<Object> get props => [
//         pokemonListEntity,
//       ];
// }
