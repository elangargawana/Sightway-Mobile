import 'package:flutter/material.dart';
import 'package:sightway_mobile/splash_screen_1.dart';
import 'package:sightway_mobile/login_screen.dart';
import 'package:sightway_mobile/register_screen.dart';
import 'package:sightway_mobile/penyandang/penyandang_main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen1(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/penyandang': (context) => const PenyandangMainPage(),
        // Tambahkan route lain jika diperlukan
      },
    );
  }
}
