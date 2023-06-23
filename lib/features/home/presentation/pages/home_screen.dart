import 'package:flutter/material.dart';
import 'package:ososs/core/const/style.dart';
import 'package:ososs/core/widgets/app_button.dart';
import 'package:ososs/features/animations/presentation/pages/animations_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  //final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyle.primaryColor,
        centerTitle: false,
        title: const Text(
          'Home',
          style: TextStyle(
            color: AppStyle.whiteColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 24),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(hintText: 'Enter Your Name'),
            ),
            const SizedBox(height: 54,),
            Text(
              'Your Name',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Spacer(),
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(
                      AppStyle.redColor.withOpacity(0.05))),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.delete,
                    color: AppStyle.redColor,
                  ),
                  Text(
                    'Clear text',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: AppStyle.redColor),
                  )
                ],
              ),
            ),
            AppButton(
              text: 'Go to page 1',
              color: AppStyle.darkBlueColor,
              action: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const AnimationsScreen()));
              },
              hMargin: 0,
              vMargin: 22,
            ),
            AppButton(
              text: 'Go to page 2',
              color: AppStyle.primaryColor,
              action: () {},
              hMargin: 0,
            ),
          ],
        ),
      ),
    );
  }
}
