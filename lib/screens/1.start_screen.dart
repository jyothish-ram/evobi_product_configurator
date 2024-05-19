import 'package:flutter/material.dart';
import 'package:product_configurator_app/data/image_strings.dart';
import 'package:product_configurator_app/data/text_strings.dart';
import 'package:product_configurator_app/screens/2.parts_selection_screen.dart';
import 'package:product_configurator_app/utils/constants/sizes.dart';
import 'package:product_configurator_app/utils/helpers/helper_functions.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.center,
            colors: [Colors.blueGrey, Colors.white],
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: CustomHelperFunctions.screenWidth(context) * 0.5,
                child: const Image(
                    image: AssetImage(CustomImages.startModelImage)),
              ),
              SizedBox(
                width: CustomHelperFunctions.screenWidth(context) * .40,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      CustomTexts.productTitle,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: CustomSizes.spaceBtwSections),
                    const Text(CustomTexts.productDescription),
                    const SizedBox(height: CustomSizes.spaceBtwSections),
                    ElevatedButton(
                        onPressed: () {
                          CustomHelperFunctions.navigateToScreen(
                              context, const PartsSelectionScreen());
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Text(CustomTexts.start),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
