import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ososs/features/animations/presentation/pages/animations_screen.dart';
import 'package:ososs/features/home/presentation/pages/home_screen.dart';
import 'package:ososs/features/pokemons/presentaion/pages/pokemon_screen.dart';
import 'package:ososs/features/splash/presentaion/splash_screen.dart';

import 'core/const/style.dart';
import 'dependency_injection.dart' as dii;
import 'dependency_injection.dart';
import 'features/pokemons/presentaion/blocs/pokemon_bloc.dart';
import 'features/splash/presentaion/blocs/splash_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dii.inject();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Task By Bisher',
      debugShowCheckedModeBanner: false,
      theme: AppStyle.lightTheme(),
      onGenerateRoute: (settings) {
        if (settings.name == SplashScreen.routeName) {
          return PageRouteBuilder(pageBuilder: (context, first, secondary) {
            return BlocProvider<SplashBloc>(
              create: (context) => di<SplashBloc>(),
              child: const SplashScreen(),
            );
          });
        }
        if (settings.name == PokemonScreen.routeName) {
          return PageRouteBuilder(pageBuilder: (context, first, second) {
            return BlocProvider<PokemonBloc>(
              create: (context) => di<PokemonBloc>(),
              child: const PokemonScreen(),
            );
          });
        }
        if (settings.name == HomeScreen.routeName) {
          return PageRouteBuilder(
            pageBuilder: (context, first, second) {
              return const HomeScreen();
            },
          );
        }
        if (settings.name == AnimationsScreen.routeName) {
          final arg = settings.arguments as Map<String, dynamic>;
          return PageRouteBuilder(
            pageBuilder: (context, first, second) {
              return AnimationsScreen(
                name: arg['name'],
              );
            },
          );
        }
        return null;
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
