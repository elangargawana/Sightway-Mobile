import 'package:flutter/material.dart';
import 'package:sightway_mobile/controllers/register_controller.dart';
import 'package:sightway_mobile/core/constants/constants.dart';
import 'package:sightway_mobile/views/widgets/register_form.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final RegisterController controller = RegisterController();

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text(
              'Buat Akun Baru',
              style: AppTextStyles.bold18.copyWith(color: AppColors.dark),
            ),
            const SizedBox(height: 8),
            Text(
              'Lengkapi data dirimu untuk melanjutkan.',
              style: AppTextStyles.regular14.copyWith(color: AppColors.grey),
            ),
            const SizedBox(height: 24),
            RegisterForm(controller: controller),
          ],
        ),
      ),
    );
  }
}
