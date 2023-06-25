import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:ososs/core/data_sources/http_client.dart';
import 'package:ososs/features/home/presentation/blocs/home_cubit.dart';
import 'package:ososs/features/pokemons/data/data_sources/pokemon_data_source.dart';
import 'package:ososs/features/pokemons/data/repositories/pokemon_repository_impl.dart';
import 'package:ososs/features/pokemons/domain/repositories/pokemon_repository.dart';
import 'package:ososs/features/pokemons/domain/usecases/fetch_pokemons.dart';
import 'package:ososs/features/pokemons/presentaion/blocs/pokemon_bloc.dart';
import 'package:ososs/features/splash/presentaion/blocs/splash_bloc.dart';

import 'features/animations/presentation/blocs/animation_cubit.dart';

final di = GetIt.instance;

Future<void> inject() async {
  di.registerLazySingleton(() => Client());
  di.registerLazySingleton(
      () => HttpService(client: di(), unauthorizedRoutes: []));
  //==========Animation==========//
  di.registerFactory<AnimationCubit>(() => AnimationCubit());
  //==========Home==========//
  di.registerFactory<HomeCubit>(() => HomeCubit());
  //==========Pokemon==========//
  di.registerLazySingleton<PokemonDataSource>(
      () => PokemonDataSourceImpl(client: di()));
  di.registerLazySingleton<PokemonRepository>(
      () => PokemonRepositoryImpl(pokemonDataSource: di()));
  di.registerLazySingleton<FetchPokemons>(
      () => FetchPokemons(pokemonRepository: di()));
  di.registerFactory<PokemonBloc>(() => PokemonBloc(fetchPokemonsUseCase: di()));
  //==========Splash==========//
  di.registerFactory<SplashBloc>(() => SplashBloc());
}
