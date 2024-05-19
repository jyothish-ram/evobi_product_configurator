import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class CustomChipTheme {
  CustomChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: CustomColors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: CustomColors.black),
    selectedColor: CustomColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: CustomColors.white,
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: CustomColors.darkerGrey,
    labelStyle: TextStyle(color: CustomColors.white),
    selectedColor: CustomColors.primary,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: CustomColors.white,
  );
}
