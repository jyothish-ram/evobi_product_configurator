import 'package:flutter/material.dart';
import 'package:product_configurator_app/models/part_model.dart';
import 'package:product_configurator_app/models/selectedColors_model.dart';
import 'package:product_configurator_app/utils/constants/sizes.dart';
import 'package:product_configurator_app/utils/device/device_utility.dart';

class FinalProductScreen extends StatelessWidget {
  final List<PartModel> assembledParts;
  final List<SelectedColorsModel> selectedColors;

  const FinalProductScreen(
      {required this.assembledParts, required this.selectedColors});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Final Product Configuration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // Left side: Assembled and colored product
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
                    children: assembledParts.map((part) {
                      String imageUrl = selectedColors
                          .firstWhere(
                            (color) => color.id == part.id,
                            orElse: () => SelectedColorsModel(
                              id: part.id,
                              colorIndex: '',
                              imageUrl: part.imageAssemblyUrl,
                              selectedColor: '',
                            ),
                          )
                          .imageUrl;
                      return Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            imageUrl,
                            width:
                                CustomDeviceUtils.getScreenWidth(context) * 0.3,
                            height: CustomDeviceUtils.getScreenHeight(context) *
                                0.6,
                            fit: BoxFit.contain,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),

            // Right side: Part names and selected colors
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(CustomSizes.borderRadiusMd),
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  child: ListView.builder(
                    itemCount: assembledParts.length,
                    itemBuilder: (context, index) {
                      PartModel part = assembledParts[index];
                      SelectedColorsModel selectedColor =
                          selectedColors.firstWhere(
                        (color) => color.id == part.id,
                        orElse: () => SelectedColorsModel(
                          id: part.id,
                          colorIndex: '',
                          imageUrl: part.imageUrl,
                          selectedColor: '',
                        ),
                      );
                      // return ListTile(
                      //   title: Text(
                      //     part.name,
                      //     style: const TextStyle(fontWeight: FontWeight.bold),
                      //   ),
                      //   subtitle: selectedColor.selectedColor.isNotEmpty
                      //       ? Text('Color: ${selectedColor.selectedColor}')
                      //       : SizedBox.shrink(),
                      // );
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '>${part.name}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            selectedColor.selectedColor.isNotEmpty
                                ? Text(
                                    '  Color: ${selectedColor.selectedColor}')
                                : SizedBox.shrink(),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
