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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 138,
            height: 138,
            decoration: ShapeDecoration(
              color: AppStyle.lightGreyColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: const Icon(
              Icons.photo_outlined,
              size: 40,
              color: AppStyle.blackColor,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(top: 5, start: 16,end: 5),
              child: Text(
                'Pokemon Name',
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          )
        ],
      ),
    );
  }
}
