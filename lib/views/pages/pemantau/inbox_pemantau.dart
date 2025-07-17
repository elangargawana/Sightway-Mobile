import 'package:flutter/material.dart';
import 'package:sightway_mobile/core/constants/constants.dart';

class InboxPemantau extends StatelessWidget {
  const InboxPemantau({super.key});

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
                    penyandang: 'Raka',
                    message: 'Penyandang Raka dalam bahaya!',
                    date: '17 Juli 2025 · 14.15',
                  ),
                  _buildMessageCard(
                    penyandang: 'Sinta',
                    message: 'Penyandang Sinta menekan tombol darurat.',
                    date: '17 Juli 2025 · 11.02',
                  ),
                  _buildMessageCard(
                    penyandang: 'Bayu',
                    message: 'Penyandang Bayu tidak bergerak selama 30 menit.',
                    date: '16 Juli 2025 · 21.40',
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
    required String penyandang,
    required String message,
    required String date,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.red.withAlpha(26),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.red.withAlpha(26),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.warning_amber_rounded,
              color: Colors.red,
              size: 28,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message,
                  style: AppTextStyles.bold16.copyWith(color: AppColors.dark),
                ),
                const SizedBox(height: 8),
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
}
