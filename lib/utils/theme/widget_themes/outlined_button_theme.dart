import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';

/* -- Light & Dark Outlined Button Themes -- */
class CustomOutlinedButtonTheme {
  CustomOutlinedButtonTheme._(); //To avoid creating instances


  /* -- Light Theme -- */
  static final lightOutlinedButtonTheme  = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: CustomColors.dark,
      side: const BorderSide(color: CustomColors.borderPrimary),
      textStyle: const TextStyle(fontSize: 16, color: CustomColors.black, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: CustomSizes.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(CustomSizes.buttonRadius)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: CustomColors.light,
      side: const BorderSide(color: CustomColors.borderPrimary),
      textStyle: const TextStyle(fontSize: 16, color: CustomColors.textWhite, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: CustomSizes.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(CustomSizes.buttonRadius)),
    ),
  );
}
