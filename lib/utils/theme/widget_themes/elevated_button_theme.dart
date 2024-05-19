import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

/* -- Light & Dark Elevated Button Themes -- */
class CustomElevatedButtonTheme {
  CustomElevatedButtonTheme._(); //To avoid creating instances


  /* -- Light Theme -- */
  static final lightElevatedButtonTheme  = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: CustomColors.light,
      backgroundColor: CustomColors.primary,
      disabledForegroundColor: CustomColors.darkGrey,
      disabledBackgroundColor: CustomColors.buttonDisabled,
      side: const BorderSide(color: CustomColors.primary),
      padding: const EdgeInsets.symmetric(vertical: CustomSizes.buttonHeight),
      textStyle: const TextStyle(fontSize: 16, color: CustomColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(CustomSizes.buttonRadius)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: CustomColors.light,
      backgroundColor: CustomColors.primary,
      disabledForegroundColor: CustomColors.darkGrey,
      disabledBackgroundColor: CustomColors.darkerGrey,
      side: const BorderSide(color: CustomColors.primary),
      padding: const EdgeInsets.symmetric(vertical: CustomSizes.buttonHeight),
      textStyle: const TextStyle(fontSize: 16, color: CustomColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(CustomSizes.buttonRadius)),
    ),
  );
}
