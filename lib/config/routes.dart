import 'package:flutter/material.dart';
import 'package:sightway_mobile/views/pages/splash_screen_1.dart';
import 'package:sightway_mobile/views/pages/splash_screen_2.dart';
import 'package:sightway_mobile/views/pages/login_page.dart';
import 'package:sightway_mobile/views/pages/register_page.dart';
import 'package:sightway_mobile/views/pages/penyandang/main_penyandang.dart';
import 'package:sightway_mobile/views/pages/penyandang/home_penyandang.dart';
import 'package:sightway_mobile/views/pages/penyandang/monitor_penyandang.dart';
import 'package:sightway_mobile/views/pages/penyandang/setting_penyandang.dart';
import 'package:sightway_mobile/views/pages/pemantau/main_pemantau.dart';
import 'package:sightway_mobile/views/pages/pemantau/home_pemantau.dart';
import 'package:sightway_mobile/views/pages/pemantau/monitor_pemantau.dart';
import 'package:sightway_mobile/views/pages/pemantau/setting_pemantau.dart';
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

      //Penyandang
      case '/penyandang':
        return MaterialPageRoute(builder: (_) => const MainPenyandang());
      case '/home-penyandang':
        return MaterialPageRoute(builder: (_) => const HomePenyandang());
      case '/monitor-penyandang':
        return MaterialPageRoute(builder: (_) => const MonitorPenyandang());
      case '/setting-penyandang':
        return MaterialPageRoute(builder: (_) => const SettingPenyandang());

      //Pemantau
      case '/pemantau':
        return MaterialPageRoute(builder: (_) => const MainPemantau());
      case '/home-pemantau':
        return MaterialPageRoute(builder: (_) => const HomePemantau());
      case '/monitor-pemantau':
        return MaterialPageRoute(builder: (_) => const MonitorPemantau());
      case '/setting-pemantau':
        return MaterialPageRoute(builder: (_) => const SettingPemantau());

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
