// login_page.dart
import 'package:flutter/material.dart';
import 'package:sightway_mobile/controllers/login_controller.dart';
import 'package:sightway_mobile/core/constants/constants.dart';
import 'package:sightway_mobile/views/widgets/login_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController controller = LoginController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.light,
      appBar: AppBar(
        backgroundColor: AppColors.light,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: AppColors.dark,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text(
              'Masuk ke Akunmu',
              style: AppTextStyles.bold18.copyWith(color: AppColors.dark),
            ),
            const SizedBox(height: 24),
            LoginForm(controller: controller),
          ],
        ),
      ),
    );
  }
}
