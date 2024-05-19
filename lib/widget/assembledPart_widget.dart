import 'package:flutter/material.dart';
import 'package:product_configurator_app/models/part_model.dart';

class AssembledPart extends StatelessWidget {
  final PartModel part;
  final bool isDragging;

  const AssembledPart({
    super.key,
    required this.part,
    this.isDragging = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: isDragging ? Colors.white.withOpacity(0.5) : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border:
            isDragging ? Border.all(width: 0) : Border.all(color: Colors.black),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            part.imageUrl,
            width: 50,
            height: 50,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 8),
          Text(
            part.name,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
