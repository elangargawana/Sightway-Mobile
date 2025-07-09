import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sightway_mobile/theme.dart';
import 'package:sightway_mobile/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();

  String loginAs = ''; // penyandang / pemantau

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: light,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Icon
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: SvgPicture.asset(
                  'assets/icons/left-arrow.svg',
                  width: 24,
                  height: 24,
                ),
              ),

              const SizedBox(height: 8),

              // Title
              Center(
                child: Text('Login', style: bold18.copyWith(color: dark)),
              ),

              const SizedBox(height: 24),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                  color: light,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Email
                    Text(
                      'Email atau Username',
                      style: regular12_5.copyWith(color: dark),
                    ),
                    const SizedBox(height: 6),
                    TextField(
                      controller: emailController,
                      focusNode: emailFocus,
                      style: regular12_5.copyWith(color: dark),
                      decoration: InputDecoration(
                        hintText: 'Masukkan Email atau Username',
                        hintStyle: regular12_5.copyWith(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: dark),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Password
                    Text('Password', style: regular12_5.copyWith(color: dark)),
                    const SizedBox(height: 6),
                    TextField(
                      controller: passwordController,
                      focusNode: passwordFocus,
                      obscureText: true,
                      style: regular12_5.copyWith(color: dark),
                      decoration: InputDecoration(
                        hintText: 'Masukkan Password',
                        hintStyle: regular12_5.copyWith(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: dark),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Login sebagai (Row style)
                    Text(
                      'Login sebagai :',
                      style: regular12_5.copyWith(color: dark),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Radio<String>(
                          value: 'penyandang',
                          groupValue: loginAs,
                          activeColor: purple1,
                          onChanged: (value) =>
                              setState(() => loginAs = value!),
                        ),
                        Text(
                          'Penyandang',
                          style: regular12_5.copyWith(color: dark),
                        ),

                        const SizedBox(width: 16),

                        Radio<String>(
                          value: 'pemantau',
                          groupValue: loginAs,
                          activeColor: purple1,
                          onChanged: (value) =>
                              setState(() => loginAs = value!),
                        ),
                        Text(
                          'Pemantau',
                          style: regular12_5.copyWith(color: dark),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    // Lupa Password
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // Proses page lupa password
                        },
                        child: Text(
                          'Lupa Password?',
                          style: regular12_5.copyWith(color: purple1),
                        ),
                      ),
                    ),

                    const SizedBox(height: 5),

                    // Tombol Login
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: purple1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          if (loginAs == 'pemantau') {
                            Navigator.pushReplacementNamed(
                              context,
                              '/pemantau',
                            );
                          } else if (loginAs == 'penyandang') {
                            Navigator.pushReplacementNamed(
                              context,
                              '/penyandang',
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Silakan pilih role login terlebih dahulu',
                                ),
                              ),
                            );
                          }
                        },
                        child: Text(
                          'Login',
                          style: regular12_5.copyWith(color: Colors.white),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Belum memiliki akun? Register
                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Belum memiliki akun? ',
                            style: regular12_5.copyWith(color: dark),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const RegisterScreen(),
                                ),
                              );
                            },
                            style: TextButton.styleFrom(
                              padding:
                                  EdgeInsets.zero, // hilangkan padding default
                              minimumSize: Size(0, 0),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Text(
                              'Register',
                              style: regular12_5.copyWith(color: purple1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
