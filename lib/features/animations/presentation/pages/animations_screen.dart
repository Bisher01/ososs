import 'package:flutter/material.dart';
import 'package:ososs/core/const/style.dart';
import 'package:ososs/core/widgets/app_button.dart';

class AnimationsScreen extends StatelessWidget {
  const AnimationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyle.primaryColor,
        centerTitle: false,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          'Animations',
          style: TextStyle(
            color: AppStyle.whiteColor,
          ),
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
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              width: width - 70,
              height: width - 70,
              decoration: BoxDecoration(
                color: AppStyle.primaryColor,
              ),
            ),
            const Spacer(
              flex: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: const BoxDecoration(
                    color: AppStyle.darkBlueColor,
                  ),
                ),
                Container(
                  width: 70,
                  height: 70,
                  decoration: ShapeDecoration(
                    color: AppStyle.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                Container(
                  width: 70,
                  height: 70,
                  decoration: const BoxDecoration(
                    color: AppStyle.lightRedColor,
                    shape: BoxShape.circle,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
