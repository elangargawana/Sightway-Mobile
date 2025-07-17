import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sightway_mobile/core/constants/constants.dart';
import 'package:sightway_mobile/views/pages/login_page.dart';
import 'package:sightway_mobile/views/pages/register_page.dart';

class SplashScreen2 extends StatelessWidget {
  const SplashScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.light,
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
              Text(
                'Sightway',
                style: AppTextStyles.bold18.copyWith(color: AppColors.dark),
              ),
              const SizedBox(height: 8),

              // Subjudul
              Text(
                'Navigate with Clarity',
                style: AppTextStyles.regular14.copyWith(color: AppColors.dark),
                textAlign: TextAlign.center,
              ),
              Text(
                'Connect with Confidence',
                style: AppTextStyles.regular14.copyWith(color: AppColors.dark),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 32),

              // Tombol Login
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.purple1,
                    foregroundColor: AppColors.light,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const LoginPage()),
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
                    foregroundColor: AppColors.dark,
                    side: BorderSide(color: AppColors.dark),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const RegisterPage()),
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
