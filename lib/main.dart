import 'package:dentistreservation/core/theme/app_theme.dart';
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
      theme: AppTheme.lightTheme(),
      home: RootView(currentScreen: 0),
    );
  }
}
