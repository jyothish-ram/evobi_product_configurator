import 'package:flutter/material.dart';
import 'package:product_configurator_app/data/text_strings.dart';
import 'package:product_configurator_app/models/part_model.dart';
import 'package:product_configurator_app/screens/4.coloring_screen.dart';
import 'package:product_configurator_app/utils/device/device_utility.dart';
import 'package:product_configurator_app/utils/helpers/helper_functions.dart';
import 'package:product_configurator_app/widget/assembledPart_widget.dart';

class AssemblyScreen extends StatefulWidget {
  final List<PartModel> selectedParts;

  const AssemblyScreen({required this.selectedParts, super.key});

  @override
  State<AssemblyScreen> createState() => _AssemblyScreenState();
}

class _AssemblyScreenState extends State<AssemblyScreen> {
  List<PartModel> assembledParts = [];
  List<List<PartModel>> undoStack = [];
  List<List<PartModel>> redoStack = [];

  void onPartDropped(PartModel part) {
    setState(() {
      _addUndoState();
      if (!assembledParts.contains(part)) {
        assembledParts.add(part);
        assembledParts.sort((a, b) => a.id.compareTo(b.id));
        redoStack.clear(); // Clear the redo stack when a new action is taken
      }
    });
  }

  void _addUndoState() {
    undoStack.add(List.from(assembledParts));
  }

  void _undo() {
    if (undoStack.isNotEmpty) {
      setState(() {
        redoStack.add(List.from(assembledParts));
        assembledParts = undoStack.removeLast();
      });
    }
  }

  void _redo() {
    if (redoStack.isNotEmpty) {
      setState(() {
        _addUndoState();
        assembledParts = redoStack.removeLast();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assemble Parts'),
        actions: [
          IconButton(
            icon: const Icon(Icons.undo),
            onPressed: _undo,
          ),
          IconButton(
            icon: const Icon(Icons.redo),
            onPressed: _redo,
          ),
        ],
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: widget.selectedParts.length,
                itemBuilder: (context, index) {
                  PartModel part = widget.selectedParts[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Draggable<PartModel>(
                      data: part,
                      feedback: Material(
                        elevation: 4.0,
                        child: AssembledPart(part: part, isDragging: true),
                      ),
                      childWhenDragging: Opacity(
                        opacity: 0.5,
                        child: AssembledPart(part: part),
                      ),
                      child: AssembledPart(part: part),
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: DragTarget<PartModel>(
              onWillAccept: (part) => true,
              onAccept: onPartDropped,
              builder: (context, candidateData, rejectedData) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: CustomDeviceUtils.getScreenHeight(context) * 0.7,
                    width: CustomDeviceUtils.getScreenWidth(context) * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.grey[300],
                    ),
                    child: Stack(
                      children: assembledParts.isEmpty
                          ? [
                              const Center(
                                child: Text(
                                  'Drag here to assemble',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ]
                          : assembledParts.map((part) {
                              return Positioned.fill(
                                left: part.positionDx,
                                top: part.positionDy,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    part.imageAssemblyUrl,
                                    width: CustomDeviceUtils.getScreenWidth(
                                            context) *
                                        0.3,
                                    height: CustomDeviceUtils.getScreenHeight(
                                            context) *
                                        0.6,
                                  ),
                                ),
                              );
                            }).toList(),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: CustomDeviceUtils.getScreenHeight(context) * 0.7,
              width: CustomDeviceUtils.getScreenWidth(context) * 0.05,
              child: ElevatedButton(
                onPressed: () {
                  assembledParts.isNotEmpty
                      ? CustomHelperFunctions.navigateToScreen(context,
                          PartColoringScreen(assembledParts: assembledParts))
                      : CustomHelperFunctions()
                          .showSnackBar(context, 'Assemble atleast 1 parts');
                },
                child: const Text(CustomTexts.nextMultiline),
              ),
            ),
          )
        ],
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //     onPressed: () {
      //       assembledParts.isNotEmpty
      //           ? CustomHelperFunctions.navigateToScreen(
      //               context, ColoringScreen(assembledParts: assembledParts))
      //           : CustomHelperFunctions()
      //               .showSnackBar(context, 'Assemble atleast 1 parts');
      //     },
      //     label: const Text('Next >')),
    );
  }
}
