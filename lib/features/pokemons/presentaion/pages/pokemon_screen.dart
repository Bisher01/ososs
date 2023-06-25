import 'package:flutter/material.dart';
import 'package:ososs/features/pokemons/presentaion/widgets/pokemon_card.dart';

class PokemonScreen extends StatelessWidget {
  static const routeName = 'pokemon';
  const PokemonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: const Text('Pokemons'),
        ),
        body: ListView.separated(
            itemCount: 10,
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 26),
            separatorBuilder: (context, index) => const SizedBox(height: 27),
            itemBuilder: (context, index) {
              return PokemonCard();
            }));
  }
}
