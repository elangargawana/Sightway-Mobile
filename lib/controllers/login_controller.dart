import 'package:flutter/material.dart';

class LoginController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String loginAs = ''; // 'penyandang' atau 'pemantau'

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }

  Future<void> login(BuildContext context) async {
    if (loginAs.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Silakan pilih role login terlebih dahulu'),
        ),
      );
      return;
    }

    final email = emailController.text.trim();
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email dan password tidak boleh kosong')),
      );
      return;
    }

    // TODO: Ganti dengan autentikasi API
    if (loginAs == 'penyandang') {
      Navigator.pushReplacementNamed(context, '/penyandang');
    } else if (loginAs == 'pemantau') {
      Navigator.pushReplacementNamed(context, '/pemantau');
    }
  }
}
