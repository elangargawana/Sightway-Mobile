import 'package:flutter/material.dart';
import 'package:sightway_mobile/views/pages/splash_screen_1.dart';
import 'package:sightway_mobile/views/pages/splash_screen_2.dart';
import 'package:sightway_mobile/views/pages/login_page.dart';
import 'package:sightway_mobile/views/pages/register_page.dart';
// Tambahkan import lainnya sesuai kebutuhan

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen1());
      case '/splash2':
        return MaterialPageRoute(builder: (_) => const SplashScreen2());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case '/register':
        return MaterialPageRoute(builder: (_) => const RegisterPage());

      // Tambahkan rute lainnya di sini jika dibutuhkan

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Halaman "${settings.name}" tidak ditemukan'),
            ),
          ),
        );
    }
  }
}
