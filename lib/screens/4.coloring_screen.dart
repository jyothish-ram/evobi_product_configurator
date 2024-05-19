import 'package:flutter/material.dart';
import 'package:product_configurator_app/data/text_strings.dart';
import 'package:product_configurator_app/models/part_model.dart';
import 'package:product_configurator_app/models/selectedColors_model.dart';
import 'package:product_configurator_app/screens/5.final_product_screen.dart';
import 'package:product_configurator_app/utils/constants/colors.dart';
import 'package:product_configurator_app/utils/constants/sizes.dart';
import 'package:product_configurator_app/utils/device/device_utility.dart';
import 'package:product_configurator_app/utils/helpers/helper_functions.dart';

class PartColoringScreen extends StatefulWidget {
  final List<PartModel> assembledParts;

  PartColoringScreen({required this.assembledParts});

  @override
  _PartColoringScreenState createState() => _PartColoringScreenState();
}

class _PartColoringScreenState extends State<PartColoringScreen> {
  Map<String, SelectedColorsModel> selectedColors = {};

  void onColorSelected(
      PartModel part, int colorIndex, String colorImageUrl, String colorName) {
    setState(() {
      selectedColors[part.id] = SelectedColorsModel(
        id: part.id,
        colorIndex: colorIndex.toString(),
        imageUrl: colorImageUrl,
        selectedColor: colorName,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    List<PartModel> colorableParts =
        widget.assembledParts.where((part) => part.isColored).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Color Parts'),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: ListView.builder(
              itemCount: colorableParts.length,
              itemBuilder: (context, index) {
                PartModel part = colorableParts[index];
                return ListTile(
                  title: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(CustomSizes.borderRadiusMd),
                      color: CustomColors.grey,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        part.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  subtitle: Wrap(
                    spacing: 8.0,
                    children: part.availableColor!.map((colorName) {
                      int colorIndex = part.availableColor!.indexOf(colorName);
                      String colorImageUrl = part.colorImageUrl![colorIndex];
                      bool isSelected = selectedColors[part.id]?.colorIndex ==
                          colorIndex.toString();
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () => onColorSelected(
                              part, colorIndex, colorImageUrl, colorName),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  CustomSizes.borderRadiusMd),
                              border: isSelected
                                  ? Border.all(
                                      color: CustomColors.primary, width: 2)
                                  : Border.all(
                                      color: CustomColors.borderSecondary,
                                      width: 2),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      image: DecorationImage(
                                        image: AssetImage(colorImageUrl),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Text(colorName),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                );
              },
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: CustomDeviceUtils.getScreenHeight(context) * 0.7,
                width: CustomDeviceUtils.getScreenWidth(context) * 0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.grey[300],
                ),
                child: Stack(
                  children: widget.assembledParts.map((part) {
                    String imageUrl = selectedColors[part.id]?.imageUrl ??
                        part.imageAssemblyUrl;
                    return Positioned.fill(
                      left: part.positionDx,
                      top: part.positionDy,
                      child: Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          imageUrl,
                          width:
                              CustomDeviceUtils.getScreenWidth(context) * 0.3,
                          height:
                              CustomDeviceUtils.getScreenHeight(context) * 0.6,
                          fit: BoxFit.contain,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: CustomDeviceUtils.getScreenHeight(context) * 0.7,
              width: CustomDeviceUtils.getScreenWidth(context) * 0.05,
              child: ElevatedButton(
                onPressed: () {
                  if (selectedColors.length == colorableParts.length) {
                    List<SelectedColorsModel> selectedColorsData =
                        selectedColors.values.toList();
                    CustomHelperFunctions.navigateToScreen(
                      context,
                      FinalProductScreen(
                        assembledParts: widget.assembledParts,
                        selectedColors: selectedColorsData,
                      ),
                    );
                  } else {
                    CustomHelperFunctions()
                        .showSnackBar(context, 'Select Valid Color Options');
                  }
                },
                child: const Text(CustomTexts.nextMultiline),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
