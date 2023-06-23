import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ososs/core/const/style.dart';
import 'package:ososs/features/animations/presentation/blocs/animation_cubit.dart';
import 'package:ososs/features/animations/presentation/widgets/animation_button.dart';

class AnimationsScreen extends StatelessWidget {
  const AnimationsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AnimationCubit>(
      create: (_) => AnimationCubit(),
      child: const AnimationView(),
    );
  }
}


class AnimationView extends StatelessWidget {
  const AnimationView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AnimationCubit>();
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: const Text('Animations'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Your Name',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Spacer(
              flex: 1,
            ),
            BlocBuilder<AnimationCubit, AnimationState>(
                builder: (context, state) {
              state as AnimationDone;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                width: width - 70,
                height: width - 70,
                decoration: BoxDecoration(
                  color: state.color,
                  borderRadius: BorderRadius.all(
                    Radius.circular(state.borderRadius),
                  ),
                ),
              );
            }),
            const Spacer(
              flex: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AnimationButton(
                  color: AppStyle.darkBlueColor,
                  onTab: () {
                    cubit.animate(AppStyle.darkBlueColor, 0);
                  },
                ),
                AnimationButton(
                  color: AppStyle.primaryColor,
                  onTab: () {
                    cubit.animate(AppStyle.primaryColor, 48);
                  },
                  borderRadius: 15,
                ),
                AnimationButton(
                  color: AppStyle.lightRedColor,
                  onTab: () {
                    cubit.animate(AppStyle.lightRedColor, 250);
                  },
                  borderRadius: 50,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
