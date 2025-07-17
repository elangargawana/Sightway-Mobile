import 'package:flutter/material.dart';
import 'package:sightway_mobile/core/constants/constants.dart';
import 'package:sightway_mobile/views/pages/penyandang/inbox_penyandang.dart';

class HomePenyandang extends StatelessWidget {
  const HomePenyandang({super.key});

  @override
  Widget build(BuildContext context) {
    final int unreadMessages = 3; // TODO: Ambil dari backend nanti

    return Scaffold(
      backgroundColor: AppColors.light,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: Container(
          color: AppColors.light,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          alignment: Alignment.centerLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Dashboard Penyandang',
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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ==== HEADER PENYANDANG ====
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    // TODO: Navigasi ke halaman detail profil penyandang
                    // Navigator.push(context, MaterialPageRoute(builder: (_) => const DetailProfilPage()));
                  },
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade300,
                      // TODO: Ganti dengan foto profil penyandang (NetworkImage/AssetImage)
                      image: const DecorationImage(
                        image: AssetImage('assets/icons/placeholder.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Selamat datang,',
                        style: AppTextStyles.regular12_5.copyWith(
                          color: AppColors.dark,
                        ),
                      ),
                      Text(
                        'Baba Jijimon!',
                        style: AppTextStyles.bold16.copyWith(
                          color: AppColors.dark,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.purple1,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'PENYANDANG',
                          style: AppTextStyles.regular12_5.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const InboxPenyandang(),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.purple1,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.purple1.withAlpha(50),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.mail_outline,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    if (unreadMessages > 0)
                      Positioned(
                        right: 4,
                        top: 4,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 18,
                            minHeight: 18,
                          ),
                          child: Center(
                            child: Text(
                              unreadMessages.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),

            // ==== SCAN QR CODE ====
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      title: const Text('Scan Berhasil'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Tongkat berhasil terhubung.'),
                          SizedBox(height: 8),
                          Text(
                            'MAC Address:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('00:1A:7D:DA:71:13'),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Tutup'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(30),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.qr_code_scanner,
                      size: 36,
                      color: AppColors.purple1,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Scan QR Code Tongkat',
                      style: AppTextStyles.regular12_5.copyWith(
                        color: AppColors.dark,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // ==== KELUARGA PENYANDANG ====
            Text(
              'Keluarga Penyandang:',
              style: AppTextStyles.regular14.copyWith(color: AppColors.dark),
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  // TODO: Tambahkan foto profil keluarga penyandang (NetworkImage/AssetImage)
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade300,
                      image: const DecorationImage(
                        image: AssetImage('assets/icons/placeholder.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Raka',
                          style: AppTextStyles.bold16.copyWith(
                            color: AppColors.dark,
                          ),
                        ),
                        Text(
                          'Ayah',
                          style: AppTextStyles.regular12_5.copyWith(
                            color: AppColors.dark,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.purple1,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    constraints: const BoxConstraints(maxWidth: 140),
                    child: Text(
                      'Semarang, Jawa Tengah',
                      style: AppTextStyles.regular12_5.copyWith(
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: false,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
