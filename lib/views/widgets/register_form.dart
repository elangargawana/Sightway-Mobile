import 'package:flutter/material.dart';
import 'package:sightway_mobile/controllers/register_controller.dart';
import 'package:sightway_mobile/core/constants/constants.dart';

class RegisterForm extends StatefulWidget {
  final RegisterController controller;
  const RegisterForm({super.key, required this.controller});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  @override
  Widget build(BuildContext context) {
    final controller = widget.controller;

    Widget buildInput({
      required String label,
      required String hint,
      required IconData icon,
      required TextEditingController controller,
      bool obscure = false,
    }) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: AppTextStyles.regular14.copyWith(color: AppColors.dark),
            ),
            const SizedBox(height: 6),
            TextField(
              controller: controller,
              obscureText: obscure,
              style: AppTextStyles.regular12_5,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: AppTextStyles.regular12_5.copyWith(
                  color: AppColors.grey,
                ),
                prefixIcon: Icon(icon, size: 20, color: AppColors.grey),
                filled: true,
                fillColor: Colors.white,
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
          ],
        ),
      );
    }

    Widget buildRoleOption(String role, String label, String description) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => setState(() => controller.selectedRole = role),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              margin: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                border: Border.all(
                  color: controller.selectedRole == role
                      ? AppColors.purple1
                      : AppColors.grey,
                ),
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Icon(Icons.person_outline, size: 20, color: AppColors.dark),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      label,
                      style: AppTextStyles.regular14.copyWith(
                        color: AppColors.dark,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Radio<String>(
                    value: role,
                    groupValue: controller.selectedRole,
                    onChanged: (val) =>
                        setState(() => controller.selectedRole = val!),
                    activeColor: AppColors.purple1,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, bottom: 12),
            child: Text(
              description,
              style: AppTextStyles.regular12_5.copyWith(color: AppColors.grey),
            ),
          ),
        ],
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Register sebagai :',
            style: AppTextStyles.regular14.copyWith(color: AppColors.dark),
          ),
          const SizedBox(height: 12),

          buildRoleOption(
            'penyandang',
            'Penyandang',
            'Orang dengan keterbatasan penglihatan yang menggunakan alat bantu.',
          ),
          buildRoleOption(
            'pemantau',
            'Pemantau',
            'Orang yang memantau dan menerima notifikasi dari penyandang.',
          ),

          const SizedBox(height: 24),
          Text('Detail :', style: AppTextStyles.regular14),
          const SizedBox(height: 12),

          buildInput(
            label: 'Nama Lengkap',
            hint: 'Masukkan Nama',
            icon: Icons.person_outline,
            controller: controller.nameController,
          ),

          buildInput(
            label: 'Email',
            hint: 'Masukkan Email',
            icon: Icons.email_outlined,
            controller: controller.emailController,
          ),

          buildInput(
            label: 'Password',
            hint: 'Masukkan Password',
            icon: Icons.lock_outline,
            controller: controller.passwordController,
            obscure: true,
          ),

          buildInput(
            label: 'Konfirmasi Password',
            hint: 'Konfirmasi Password',
            icon: Icons.lock_outline,
            controller: controller.confirmPasswordController,
            obscure: true,
          ),

          const SizedBox(height: 8),

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
              onPressed: () => controller.register(context),
              child: Text(
                'Register',
                style: AppTextStyles.regular14.copyWith(color: AppColors.light),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
