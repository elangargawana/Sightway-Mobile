import 'package:flutter/material.dart';
import 'package:sightway_mobile/config/routes.dart';
import 'package:sightway_mobile/core/constants/constants.dart';

void main() {
  runApp(const SightwayApp());
}

class SightwayApp extends StatelessWidget {
  const SightwayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sightway',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.light,
        fontFamily: 'Montserrat',
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.purple1),
        useMaterial3: true,
      ),
      initialRoute: '/',
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
