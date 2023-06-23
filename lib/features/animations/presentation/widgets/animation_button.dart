import 'package:flutter/material.dart';

class AnimationButton extends StatelessWidget {
  const AnimationButton({
    super.key,
    required this.color,
    this.width = 70,
    this.height = 70,
    this.borderRadius=0,
    required this.onTab,
  });

  final Color color;
  final double width;
  final double height;
  final double borderRadius;
  final Function() onTab;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        width: width,
        height: height,
        decoration:  BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          color: color,
        ),
      ),
    );
  }
}
