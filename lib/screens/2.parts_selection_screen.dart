import 'package:flutter/material.dart';
import 'package:product_configurator_app/data/parts_data.dart';
import 'package:product_configurator_app/data/text_strings.dart';
import 'package:product_configurator_app/models/part_model.dart';
import 'package:product_configurator_app/screens/3.assembly_screen.dart';
import 'package:product_configurator_app/utils/constants/colors.dart';
import 'package:product_configurator_app/utils/constants/sizes.dart';
import 'package:product_configurator_app/utils/device/device_utility.dart';
import 'package:product_configurator_app/utils/helpers/helper_functions.dart';

class PartsSelectionScreen extends StatefulWidget {
  const PartsSelectionScreen({super.key});

  @override
  State<PartsSelectionScreen> createState() => _PartsSelectionScreenState();
}

class _PartsSelectionScreenState extends State<PartsSelectionScreen> {
  List<String> selectedPartIds = [];
  List<PartModel> selectedParts = [];

  void togglePartSelection(PartModel part) {
    setState(() {
      if (selectedPartIds.contains(part.id)) {
        selectedPartIds.remove(part.id);
        selectedParts.remove(part);
      } else {
        selectedPartIds.add(part.id);
        selectedParts.add(part);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<PartModel> productParts = parts;

    return Scaffold(
      appBar: AppBar(title: const Text('Select Parts')),
      body: Column(
        children: [
          SizedBox(
            height: CustomDeviceUtils.getScreenHeight(context) * 0.6,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: productParts.length,
              itemBuilder: (context, index) {
                PartModel part = productParts[index];
                bool isSelected = selectedPartIds.contains(part.id);
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      togglePartSelection(part);
                    },
                    child: Container(
                      width: CustomDeviceUtils.getScreenWidth(context) * 0.4,
                      height: CustomDeviceUtils.getScreenHeight(context) * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isSelected
                              ? CustomColors.primary
                              : CustomColors.borderSecondary,
                          width: 2,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            SizedBox(
                                width:
                                    CustomDeviceUtils.getScreenWidth(context) *
                                        0.2,
                                height:
                                    CustomDeviceUtils.getScreenHeight(context) *
                                        0.2,
                                child: Image(
                                  image: AssetImage(part.imageUrl),
                                  fit: BoxFit.contain,
                                )),
                            const SizedBox(height: CustomSizes.spaceBtwItems),
                            Text(
                              part.name,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: CustomSizes.spaceBtwItems),
                            Text(
                              part.description,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
              width: CustomDeviceUtils.getScreenWidth(context) * 0.9,
              child: ElevatedButton(
                  onPressed: () {
                    selectedPartIds.length >= 3
                        ? CustomHelperFunctions.navigateToScreen(context,
                            AssemblyScreen(selectedParts: selectedParts))
                        : CustomHelperFunctions()
                            .showSnackBar(context, 'Select atleast 3 parts');
                  },
                  child: const Text(CustomTexts.next)))
        ],
      ),
    );
  }
}
