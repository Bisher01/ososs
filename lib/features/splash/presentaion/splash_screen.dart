import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ososs/features/home/presentation/pages/home_screen.dart';
import 'package:ososs/features/splash/presentaion/blocs/splash_bloc.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = 'splash';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    BlocProvider.of<SplashBloc>(context).add(const StartSplashTimer(timer: 3));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is SplashSuccessState) {
            Navigator.pushReplacementNamed(context, HomeScreen.routeName);
          }
        },
        child: const Center(
            child: FlutterLogo(
          size: 250,
        )),
      ),
    );
  }
}
