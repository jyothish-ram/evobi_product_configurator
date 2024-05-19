import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:product_configurator_app/screens/1.start_screen.dart';
import 'package:product_configurator_app/utils/theme/theme.dart';

void main() {
  //For app working only on Landscape Orientation
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Product Configurator',
        // theme: ThemeData(
        //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //   useMaterial3: true,
        // ),
        debugShowCheckedModeBanner: false,
        theme: CustomAppTheme.lightTheme,
        home: const StartScreen());
  }
}
