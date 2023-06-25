import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:ososs/dependency_injection.dart';
import 'package:ososs/features/pokemons/domain/entities/pokemon_entity.dart';
import 'package:ososs/features/pokemons/presentaion/blocs/pokemon_bloc.dart';
import 'package:ososs/features/pokemons/presentaion/widgets/pokemon_card.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

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
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: const Text('Pokemons'),
      ),
      body: PagedListView.separated(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<PokemonEntity>(
          itemBuilder: (context, pokemon, index) {
            return PokemonCard(
              name: pokemon.name,
            );
          },
        ),
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 27,
          );
        },
      ),
    );
  }
}
