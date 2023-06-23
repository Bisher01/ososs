import 'package:flutter/material.dart';

import '../../../../core/const/style.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: 138,
      decoration: ShapeDecoration(
        color: AppStyle.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        shadows: const [
          BoxShadow(
            color: AppStyle.shadowColor,
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 3,
          )
        ],
      ),
    );
  }
}
