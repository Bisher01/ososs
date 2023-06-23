import 'package:flutter/material.dart';
import 'package:ososs/core/const/style.dart';
import 'package:ososs/core/widgets/app_button.dart';
import 'package:ososs/features/animations/presentation/pages/animations_screen.dart';
import 'package:ososs/features/pokemons/presentaion/pages/pokemon_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final nameFocusNode = FocusNode();
  late TextEditingController nameController;

  @override
  void initState() {
    nameController = TextEditingController();
    nameController.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    nameFocusNode.dispose();
    nameController.dispose();
    super.dispose();
  }

  String name = "Your name";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
              TextField(
                focusNode: nameFocusNode,
                controller: nameController,
                decoration: const InputDecoration(hintText: 'Enter Your Name'),
              ),
              const SizedBox(
                height: 54,
              ),
              Text(
                nameController.text.isNotEmpty?nameController.text:'Your name',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Spacer(),
              TextButton(
                onPressed: () => nameController.clear(),
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
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AnimationsScreen()));
                },
                hMargin: 0,
                vMargin: 22,
              ),
              AppButton(
                text: 'Go to page 2',
                color: AppStyle.primaryColor,
                action: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const PokemonScreen()));
                },
                hMargin: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
