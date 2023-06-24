import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ososs/features/pokemons/domain/entities/pokemon_entity.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc() : super(PokemonInitialState()) {
    on<PokemonEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
