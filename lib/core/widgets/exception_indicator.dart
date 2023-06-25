import 'package:flutter/material.dart';
import 'package:ososs/core/const/style.dart';
import 'package:ososs/core/widgets/app_button.dart';

import '../const/messages.dart';

class ExceptionIndicator extends StatelessWidget {
  const ExceptionIndicator({
    this.title,
    this.message,
    this.onTryAgain,
    Key? key,
  }) : super(key: key);

  final String? title;
  final String? message;
  final VoidCallback? onTryAgain;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 32,
          horizontal: 16,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error,
              size: 48,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              title ?? genericErrorMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              title ?? genericErrorMessage,
              textAlign: TextAlign.center,
            ),
            if (onTryAgain != null)
              const SizedBox(
                height: 2,
              ),
            if (onTryAgain != null)
              AppButton(
                text: 'Try Again', color: AppStyle.primaryColor, action: ()=>onTryAgain,
              ),
          ],
        ),
      ),
    );
  }
}
