import 'package:flutter/material.dart';

class RegisterController {
  // TextEditingControllers untuk input form
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // Selected role (penyandang/pemantau)
  String selectedRole = 'penyandang';

  // Method register sementara
  void register(BuildContext context) {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      _showSnackbar(context, 'Semua kolom harus diisi');
      return;
    }

    if (password != confirmPassword) {
      _showSnackbar(context, 'Password dan konfirmasi tidak cocok');
      return;
    }

    // Di sini nanti bisa lanjut ke logic backend
    _showSnackbar(context, 'Berhasil mendaftar sebagai $selectedRole');
  }

  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  // Wajib dispose saat tidak digunakan agar tidak memory leak
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }
}
