import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sightway_mobile/views/pages/splash_screen_2.dart';
import 'package:sightway_mobile/core/constants/constants.dart';

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({super.key});

  @override
  State<SplashScreen1> createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const SplashScreen2()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.light,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/sightway-logomark-color.svg',
              width: 140,
            ),
            const SizedBox(height: 24),
            Text(
              'Sightway',
              style: AppTextStyles.bold18.copyWith(color: AppColors.dark),
            ),
            const SizedBox(height: 8),
            Text(
              'Navigate with Clarity',
              style: AppTextStyles.regular14.copyWith(color: AppColors.dark),
            ),
            Text(
              'Connect with Confidence',
              style: AppTextStyles.regular14.copyWith(color: AppColors.dark),
            ),
          ],
        ),
      ),
    );
  }
}
