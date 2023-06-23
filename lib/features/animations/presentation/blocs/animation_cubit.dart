import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ososs/core/const/style.dart';

part 'animation_state.dart';

class AnimationCubit extends Cubit<AnimationState> {
  AnimationCubit()
      : super(
          const AnimationDone(
            color: AppStyle.darkBlueColor,
            borderRadius: 0,
          ),
        );

  void animate(Color color,double borderRadius){
    emit(AnimationDone(color: color, borderRadius: borderRadius));
  }
}
