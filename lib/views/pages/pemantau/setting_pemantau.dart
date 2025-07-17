import 'package:flutter/material.dart';
import 'package:sightway_mobile/core/constants/constants.dart';
import 'package:sightway_mobile/views/pages/login_page.dart';

class SettingPemantau extends StatefulWidget {
  const SettingPemantau({super.key});

  @override
  State<SettingPemantau> createState() => _SettingPemantauState();
}

class _SettingPemantauState extends State<SettingPemantau> {
  bool notif = true;
  bool update = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.light,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          color: AppColors.light,
          alignment: Alignment.centerLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Pengaturan',
                  style: AppTextStyles.regular14.copyWith(
                    color: AppColors.dark,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Divider(height: 1, thickness: 1, color: Colors.grey.shade300),
            ],
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSettingItem(
            title: 'Profil',
            subtitle: 'Lihat dan ubah informasi profil Anda',
            onTap: () {},
          ),
          const SizedBox(height: 12),

          _buildSettingItem(
            title: 'Ganti Password',
            subtitle: 'Ubah kata sandi akun Anda',
            onTap: () {},
          ),
          const SizedBox(height: 12),

          _buildSettingItem(
            title: 'Bahasa',
            subtitle: 'Pilih bahasa aplikasi',
            onTap: () {},
          ),
          const SizedBox(height: 24),

          _buildSettingItem(
            title: 'Bantuan',
            subtitle: 'Pusat bantuan & hubungi support',
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Hubungi Bantuan'),
                  content: const Text(
                    'Kamu bisa menghubungi tim kami di support@sightway.id',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Tutup'),
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 24),

          // ===== Pengaturan Switch =====
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                _buildSwitchTile(
                  title: 'Notifikasi',
                  value: notif,
                  onChanged: (val) => setState(() => notif = val),
                ),
                _buildSwitchTile(
                  title: 'Update Aplikasi',
                  value: update,
                  onChanged: (val) => setState(() => update = val),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),

          // ===== Logout =====
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: Text(
              'Logout',
              style: AppTextStyles.regular14.copyWith(color: Colors.red),
            ),
            tileColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Konfirmasi Logout'),
                  content: const Text(
                    'Apakah Anda yakin ingin keluar dari akun?',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Batal'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); // Tutup dialog
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => const LoginPage()),
                          (route) => false,
                        );
                      },
                      child: const Text('Logout'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSettingItem({
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: Text(
          title,
          style: AppTextStyles.regular14.copyWith(color: AppColors.dark),
        ),
        subtitle: Text(
          subtitle,
          style: AppTextStyles.regular12_5.copyWith(color: Colors.grey),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.grey,
        ),
        onTap: onTap,
      ),
    );
  }

  Widget _buildSwitchTile({
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return SwitchListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: AppTextStyles.regular14.copyWith(color: AppColors.dark),
      ),
      activeColor: AppColors.purple1,
      value: value,
      onChanged: onChanged,
    );
  }
}
