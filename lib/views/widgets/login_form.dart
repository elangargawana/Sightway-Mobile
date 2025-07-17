import 'package:flutter/material.dart';
import 'package:sightway_mobile/controllers/login_controller.dart';
import 'package:sightway_mobile/core/constants/constants.dart';

class LoginForm extends StatefulWidget {
  final LoginController controller;

  const LoginForm({super.key, required this.controller});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    final controller = widget.controller;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey),
        borderRadius: BorderRadius.circular(16),
        color: AppColors.light,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Email
          Text(
            'Email atau Username',
            style: AppTextStyles.regular12_5.copyWith(color: AppColors.dark),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: controller.emailController,
            style: AppTextStyles.regular12_5,
            decoration: InputDecoration(
              hintText: 'Masukkan Email atau Username',
              hintStyle: AppTextStyles.regular12_5.copyWith(
                color: AppColors.grey,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.grey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.purple1),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Password
          Text(
            'Password',
            style: AppTextStyles.regular12_5.copyWith(color: AppColors.dark),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: controller.passwordController,
            obscureText: true,
            style: AppTextStyles.regular12_5,
            decoration: InputDecoration(
              hintText: 'Masukkan Password',
              hintStyle: AppTextStyles.regular12_5.copyWith(
                color: AppColors.grey,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.grey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.purple1),
              ),
            ),
          ),
          const SizedBox(height: 30),

          // Login As
          Text(
            'Login sebagai :',
            style: AppTextStyles.regular14.copyWith(color: AppColors.dark),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: RadioListTile<String>(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'Penyandang',
                    style: AppTextStyles.regular12_5.copyWith(
                      color: controller.loginAs == 'penyandang'
                          ? AppColors.purple1
                          : AppColors.dark,
                    ),
                  ),
                  value: 'penyandang',
                  groupValue: controller.loginAs,
                  activeColor: AppColors.purple1,
                  onChanged: (value) {
                    setState(() {
                      controller.loginAs = value!;
                    });
                  },
                ),
              ),
              Expanded(
                child: RadioListTile<String>(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    'Pemantau',
                    style: AppTextStyles.regular12_5.copyWith(
                      color: controller.loginAs == 'pemantau'
                          ? AppColors.purple1
                          : AppColors.dark,
                    ),
                  ),
                  value: 'pemantau',
                  groupValue: controller.loginAs,
                  activeColor: AppColors.purple1,
                  onChanged: (value) {
                    setState(() {
                      controller.loginAs = value!;
                    });
                  },
                ),
              ),
            ],
          ),

          // Lupa Password
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Lupa Password?',
                style: AppTextStyles.regular14.copyWith(
                  color: AppColors.purple1,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),

          // Tombol Login
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.purple1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () => controller.login(context),
              child: Text(
                'Login',
                style: AppTextStyles.regular14.copyWith(color: AppColors.light),
              ),
            ),
          ),

          const SizedBox(height: 25),

          // Navigasi ke Daftar
          Center(
            child: RichText(
              text: TextSpan(
                text: 'Belum memiliki akun? ',
                style: AppTextStyles.regular14.copyWith(color: AppColors.dark),
                children: [
                  WidgetSpan(
                    alignment: PlaceholderAlignment.baseline,
                    baseline: TextBaseline.alphabetic,
                    child: GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/register'),
                      child: Text(
                        'Daftar',
                        style: AppTextStyles.regular14.copyWith(
                          color: AppColors.purple1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
