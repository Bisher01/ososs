import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:ososs/core/const/style.dart';
import 'package:ososs/features/pokemons/domain/entities/pokemon_entity.dart';
import 'package:ososs/features/pokemons/presentaion/blocs/pokemon_bloc.dart';
import 'package:ososs/features/pokemons/presentaion/widgets/pokemon_card.dart';
import '../../../../core/widgets/exception_indicator.dart';
import '../../../../core/widgets/loading_widget.dart';

class PokemonScreen extends StatefulWidget {
  static const routeName = 'pokemon';

  const PokemonScreen({super.key});

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  final PagingController<int, PokemonEntity> _pagingController =
      PagingController(
    firstPageKey: 0,
  );

  PokemonBloc get _bloc => context.read<PokemonBloc>();

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageNumber) {
      final isSubsequentPage = pageNumber >= 0;
      if (isSubsequentPage) {
        _bloc.add(
          PokemonListNextPageRequested(
            pageNumber: pageNumber,
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PokemonBloc, PokemonListState>(
      listener: (context, state) {
        _pagingController.value = state.toPagingState();
      },
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: const Text('Pokemons'),
        ),
        body: RefreshIndicator(
          onRefresh: () {
            _bloc.add(
              const PokemonListRefreshed(),
            );
            final stateChangeFuture = _bloc.stream.first;
            return stateChangeFuture;
          },
          child: PagedListView.separated(
            pagingController: _pagingController,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 27),
            builderDelegate: PagedChildBuilderDelegate<PokemonEntity>(
              firstPageProgressIndicatorBuilder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: AppStyle.primaryColor,
                ),
              ),
              itemBuilder: (context, pokemon, index) {
                return PokemonCard(
                  name: pokemon.name,
                  image: pokemon.image,
                );
              },
              firstPageErrorIndicatorBuilder: (context) {
                return ExceptionIndicator(
                  onTryAgain: () {
                    _bloc.add(
                      const PokemonListFailedFetchRetried(),
                    );
                  },
                );
              },
              newPageProgressIndicatorBuilder: (context) => ShimmerWidget(
                height: 138,
                width: MediaQuery.of(context).size.width,
                borderRadiusGeometry:
                    const BorderRadius.all(Radius.circular(14)),
              ),
            ),
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 27,
              );
            },
          ),
        ),
      ),
    );
  }
}

extension on PokemonListState {
  PagingState<int, PokemonEntity> toPagingState() {
    return PagingState(
      itemList: itemList,
      nextPageKey: nextPage,
      error: error,
    );
  }
}
