import 'package:flutter/material.dart';
import 'package:sightway_mobile/core/constants/constants.dart';

class InboxPenyandang extends StatelessWidget {
  const InboxPenyandang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.light,
      body: SafeArea(
        child: Column(
          children: [
            // AppBar custom
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              color: AppColors.light,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 24,
                      color: AppColors.dark,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Pesan Masuk',
                    style: AppTextStyles.regular14.copyWith(
                      color: AppColors.dark,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Daftar pesan
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildMessageCard(
                    name: 'Andi Pemantau',
                    status: 'ingin terhubung ke kamu\nsebagai pemantau !',
                    date: '10 Juli 2025 · 10.00',
                    buttons: Row(
                      children: [
                        _buildActionButton('Setujui', Colors.green),
                        const SizedBox(width: 8),
                        _buildActionButton('Tolak', Colors.red),
                      ],
                    ),
                  ),
                  _buildMessageCard(
                    name: 'Santi Pemantau',
                    status: 'ingin terhubung ke kamu\nsebagai pemantau !',
                    date: '10 Juli 2025 · 09.30',
                    buttons: _buildActionButton('Disetujui', Colors.green),
                  ),
                  _buildMessageCard(
                    name: 'Budi Pemantau',
                    status: 'ingin terhubung ke kamu\nsebagai pemantau !',
                    date: '09 Juli 2025 · 17.45',
                    buttons: _buildActionButton('Ditolak', Colors.red),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageCard({
    required String name,
    required String status,
    required String date,
    required Widget buttons,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.purple1.withAlpha(40),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '!',
              style: AppTextStyles.bold18.copyWith(
                color: AppColors.purple1,
                fontSize: 28,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: AppTextStyles.regular12_5.copyWith(
                      color: AppColors.dark,
                    ),
                    children: [
                      TextSpan(
                        text: '$name ',
                        style: AppTextStyles.bold16.copyWith(
                          color: AppColors.dark,
                        ),
                      ),
                      TextSpan(text: status),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                buttons,
                const SizedBox(height: 4),
                Text(
                  date,
                  style: AppTextStyles.regular12_5.copyWith(
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: AppTextStyles.regular12_5.copyWith(color: Colors.white),
      ),
    );
  }
}
