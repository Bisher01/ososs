import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ososs/features/pokemons/domain/entities/pokemon_entity.dart';
import 'package:ososs/features/pokemons/domain/usecases/fetch_pokemons.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonListEvent, PokemonListState> {
  final FetchPokemons fetchPokemonsUseCase;
  PokemonBloc({required this.fetchPokemonsUseCase})
      : super(const PokemonListState()) {
    on<PokemonListEvent>((event, emitter) async {
      if (event is PokemonListFailedFetchRetried) {
        await _handlePokemonListFailedFetchRetried(emitter);
      } else if (event is PokemonListRefreshed) {
        await _handlePokemonListRefreshed(emitter, event);
      } else if (event is PokemonListNextPageRequested) {
        await _handlePokemonListNextPageRequested(emitter, event);
      }
    });
  }

  Future<void> _handlePokemonListFailedFetchRetried(Emitter emitter) {
    // Clears out the error and puts the loading indicator back on the screen.
    emitter(
      state.copyWithNewError(null),
    );
    final firstPageFetchStream = _fetchPokemonPage(
      0,
    );

    return emitter.onEach<PokemonListState>(
      firstPageFetchStream,
      onData: emitter,
    );
  }

  Future<void> _handlePokemonListRefreshed(
    Emitter emitter,
    PokemonListRefreshed event,
  ) {
    final firstPageFetchStream = _fetchPokemonPage(
      0,
      isRefresh: true,
    );

    return emitter.onEach<PokemonListState>(
      firstPageFetchStream,
      onData: emitter,
    );
  }

  Future<void> _handlePokemonListNextPageRequested(
    Emitter emitter,
    PokemonListNextPageRequested event,
  ) {
    emitter(
      state.copyWithNewError(null),
    );

    final nextPageFetchStream = _fetchPokemonPage(
      event.pageNumber,
    );

    return emitter.onEach<PokemonListState>(
      nextPageFetchStream,
      onData: emitter,
    );
  }

  Stream<PokemonListState> _fetchPokemonPage(
    int page, {
    bool isRefresh = false,
  }) async* {
    final response = await fetchPokemonsUseCase(
      params: page,
    );
    PokemonListEntity? data;
    response.fold((l)  {
      print(l.properties[0]);
    }, (r) {
      data = r;
    });
    try {
      final newPage = data!;
      final newItemList = newPage.results;
      final oldItemList = state.itemList ?? [];
      final completeItemList =
      isRefresh || page == 0 ? newItemList : (oldItemList + newItemList);
      final nextPage = newPage.next == null ? null : page+20;
      yield PokemonListState.success(
        nextPage: nextPage,
        itemList: completeItemList,
        isRefresh: isRefresh,
      );
    } catch (error) {
      if (isRefresh) {
        yield state.copyWithNewRefreshError(
          error,
        );
      } else {
        yield state.copyWithNewError(
          error,
        );
      }
    }

  }
}
