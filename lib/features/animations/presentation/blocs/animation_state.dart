part of 'animation_cubit.dart';

abstract class AnimationState extends Equatable {
  const AnimationState();
}

class AnimationDone extends AnimationState {
  const AnimationDone({
    required this.color,
    required this.borderRadius,
  });

  final Color color;
  final double borderRadius;

  @override
  List<Object> get props => [
        color,
        borderRadius,
      ];
}
