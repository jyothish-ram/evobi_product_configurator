import 'package:flutter/material.dart';

class CustomHelperFunctions {
  static void showAlert(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  static void navigateToScreenReplacement(BuildContext context, Widget screen) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  void showSnackBar(BuildContext context, String content) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        shape: const RoundedRectangleBorder(),
        backgroundColor: Colors.white,
        content: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              content,
              style: const TextStyle(
                  fontWeight: FontWeight.w700, color: Colors.blue),
            )),
      ),
    );
  }

  // void showCustomSnackBar(BuildContext context, String content) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       shape: const RoundedRectangleBorder(),
  //       backgroundColor: Colors.purple,

  //       content: Align(alignment: Alignment.bottomCenter, child: Text(content, style: TextStyle(fontWeight: FontWeight.w700,color: Colors.white),)),

  //     ),
  //   );
  // }
}
