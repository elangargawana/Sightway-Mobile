import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sightway_mobile/theme.dart';
import 'package:sightway_mobile/login_screen.dart';
import 'package:sightway_mobile/register_screen.dart';

class SplashScreen2 extends StatelessWidget {
  const SplashScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: light,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              SvgPicture.asset(
                'assets/icons/sightway-logomark-color.svg',
                width: 140,
              ),
              const SizedBox(height: 24),

              // Judul
              Text('Sightway', style: bold18.copyWith(color: dark)),

              const SizedBox(height: 8),

              // Subjudul
              Text(
                'Navigate with Clarity',
                style: regular14.copyWith(color: dark),
                textAlign: TextAlign.center,
              ),
              Text(
                'Connect with Confidence',
                style: regular14.copyWith(color: dark),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 32),

              // Tombol Login
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: purple1,
                    foregroundColor: light,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const LoginScreen()),
                    ); // Arahkan ke halaman login
                  },
                  child: const Text('Login'),
                ),
              ),

              const SizedBox(height: 12),

              // Tombol Register
              SizedBox(
                width: double.infinity,
                height: 45,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: dark,
                    side: BorderSide(color: dark),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const RegisterScreen()),
                    );
                  },
                  child: const Text('Register'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
