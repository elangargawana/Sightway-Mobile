import 'package:flutter/material.dart';
import 'package:sightway_mobile/login_screen.dart';
import 'package:sightway_mobile/theme.dart';

class SettingPenyandang extends StatefulWidget {
  const SettingPenyandang({super.key});

  @override
  State<SettingPenyandang> createState() => _SettingPenyandangState();
}

class _SettingPenyandangState extends State<SettingPenyandang> {
  bool notif = true;
  bool update = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: light,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          color: light,
          alignment: Alignment.centerLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Pengaturan',
                  style: regular14.copyWith(color: dark),
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
          // Navigasi Profil
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

          // Bantuan
          _buildSettingItem(
            title: 'Bantuan',
            subtitle: 'Pusat bantuan & hubungi support',
            onTap: () {
              // Navigasi ke halaman bantuan atau tampilkan dialog
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

          // Toggle Pengaturan
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

          // Logout
          ListTile(
            leading: Icon(Icons.logout, color: Colors.red),
            title: Text('Logout', style: regular14.copyWith(color: Colors.red)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            tileColor: Colors.white,
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const LoginScreen()),
                (route) => false,
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
        title: Text(title, style: regular14.copyWith(color: dark)),
        subtitle: Text(
          subtitle,
          style: regular12_5.copyWith(color: Colors.grey),
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }

  Widget _buildSwitchTile({
    required String title,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return SwitchListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title, style: regular14.copyWith(color: dark)),
      activeColor: purple1,
      value: value,
      onChanged: onChanged,
    );
  }
}
