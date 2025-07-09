// inbox_penyandang.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sightway_mobile/theme.dart';

class InboxPenyandang extends StatelessWidget {
  const InboxPenyandang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: light,
      body: SafeArea(
        child: Column(
          children: [
            // AppBar custom
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              color: light,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: SvgPicture.asset(
                      'assets/icons/left-arrow.svg',
                      width: 24,
                      height: 24,
                      colorFilter: ColorFilter.mode(dark, BlendMode.srcIn),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text('Pesan Masuk', style: regular14.copyWith(color: dark)),
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
                        _buildActionButton('Setujui', Colors.green.shade400),
                        const SizedBox(width: 8),
                        _buildActionButton('Tolak', Colors.red.shade300),
                      ],
                    ),
                  ),
                  _buildMessageCard(
                    name: 'Santi Pemantau',
                    status: 'ingin terhubung ke kamu\nsebagai pemantau !',
                    date: '10 Juli 2025 · 09.30',
                    buttons: _buildActionButton(
                      'Disetujui',
                      Colors.green.shade400,
                    ),
                  ),
                  _buildMessageCard(
                    name: 'Budi Pemantau',
                    status: 'ingin terhubung ke kamu\nsebagai pemantau !',
                    date: '09 Juli 2025 · 17.45',
                    buttons: _buildActionButton('Ditolak', Colors.red.shade300),
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
              color: purple1.withAlpha(40),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '!',
              style: bold18.copyWith(color: purple1, fontSize: 28),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: regular12_5.copyWith(color: dark),
                    children: [
                      TextSpan(
                        text: '$name ',
                        style: bold16.copyWith(color: dark),
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
                  style: regular12_5.copyWith(color: Colors.grey.shade600),
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
      child: Text(label, style: regular12_5.copyWith(color: Colors.white)),
    );
  }
}
