import 'package:flutter/material.dart';

import 'app/module/root/root_view.dart';
import 'core/theme/app_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DentalCare',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: AppColor.primary500,
            primary: AppColor.primary500,
            brightness: Brightness.light),
        primaryColor: AppColor.primary500,
        scaffoldBackgroundColor: AppColor.backgroundColor,
        useMaterial3: true,
      ),
      home: RootView(currentScreen: 0),
    );
  }
}
