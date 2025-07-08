import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sightway_mobile/theme.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String selectedRole = ''; // 'penyandang' atau 'pemantau'

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // State visibility ikon
  bool showNameIcon = true;
  bool showEmailIcon = true;
  bool showPasswordIcon = true;
  bool showConfirmPasswordIcon = true;

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
              // Tombol Kembali
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: SvgPicture.asset(
                  'assets/icons/left-arrow.svg',
                  width: 24,
                  height: 24,
                ),
              ),

              const SizedBox(height: 8),

              // Judul
              Center(
                child: Text('Register', style: bold18.copyWith(color: dark)),
              ),

              const SizedBox(height: 24),

              Text(
                'Register sebagai :',
                style: regular12_5.copyWith(color: dark),
              ),
              const SizedBox(height: 12),

              _buildRoleOption(
                label: 'Penyandang',
                value: 'penyandang',
                iconPath: 'assets/icons/user.svg',
              ),
              _buildRoleOption(
                label: 'Pemantau',
                value: 'pemantau',
                iconPath: 'assets/icons/monitor.svg',
              ),

              const SizedBox(height: 24),

              Text('Detail :', style: regular12_5.copyWith(color: dark)),
              const SizedBox(height: 12),

              _buildInputField(
                controller: nameController,
                hintText: 'Masukkan Nama',
                label: 'Nama Lengkap',
                iconPath: 'assets/icons/user.svg',
                showIcon: showNameIcon,
                onChanged: (val) => setState(() => showNameIcon = val.isEmpty),
              ),
              _buildInputField(
                controller: emailController,
                hintText: 'Masukkan Email',
                label: 'Alamat Email',
                iconPath: 'assets/icons/email.svg',
                showIcon: showEmailIcon,
                onChanged: (val) => setState(() => showEmailIcon = val.isEmpty),
              ),
              _buildInputField(
                controller: passwordController,
                hintText: 'Masukkan Password',
                label: 'Password',
                iconPath: 'assets/icons/password.svg',
                showIcon: showPasswordIcon,
                onChanged: (val) =>
                    setState(() => showPasswordIcon = val.isEmpty),
                obscureText: true,
              ),
              _buildInputField(
                controller: confirmPasswordController,
                hintText: 'Konfirmasi Password',
                label: 'Konfirmasi Password',
                iconPath: 'assets/icons/password.svg',
                showIcon: showConfirmPasswordIcon,
                onChanged: (val) =>
                    setState(() => showConfirmPasswordIcon = val.isEmpty),
                obscureText: true,
              ),

              const SizedBox(height: 16),

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
                    // Aksi Register
                  },
                  child: Text(
                    'Register',
                    style: regular12_5.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String hintText,
    required String label,
    required String iconPath,
    required bool showIcon,
    required ValueChanged<String> onChanged,
    bool obscureText = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: regular12_5.copyWith(color: dark)),
          const SizedBox(height: 6),
          TextField(
            controller: controller,
            onChanged: onChanged,
            obscureText: obscureText,
            style: regular12_5.copyWith(color: dark),
            decoration: InputDecoration(
              prefixIcon: showIcon
                  ? Padding(
                      padding: const EdgeInsets.all(15),
                      child: SvgPicture.asset(
                        iconPath,
                        width: 20,
                        height: 20,
                        colorFilter: const ColorFilter.mode(
                          Colors.grey,
                          BlendMode.srcIn,
                        ),
                      ),
                    )
                  : null,
              hintText: hintText,
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
        ],
      ),
    );
  }

  Widget _buildRoleOption({
    required String label,
    required String value,
    required String iconPath,
  }) {
    final isSelected = selectedRole == value;

    return GestureDetector(
      onTap: () => setState(() => selectedRole = value),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: isSelected ? purple1.withAlpha(25) : Colors.white,
          border: Border.all(
            color: isSelected ? purple1 : Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              iconPath,
              width: 20,
              height: 20,
              colorFilter: const ColorFilter.mode(
                Colors.black,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(label, style: regular12_5.copyWith(color: dark)),
            ),
            Radio<String>(
              value: value,
              groupValue: selectedRole,
              activeColor: purple1,
              onChanged: (val) => setState(() => selectedRole = val!),
            ),
          ],
        ),
      ),
    );
  }
}
