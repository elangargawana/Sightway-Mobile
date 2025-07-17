import 'package:flutter/material.dart';
import 'package:sightway_mobile/core/constants/constants.dart';

class MonitorPemantau extends StatefulWidget {
  const MonitorPemantau({super.key});

  @override
  State<MonitorPemantau> createState() => _MonitorPemantauState();
}

class _MonitorPemantauState extends State<MonitorPemantau> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, String>> _penyandangList = [
    {
      'name': 'Raka',
      'email': 'raka@example.com',
      'hubungan': 'Ayah',
      'lokasi': 'Semarang, Jawa Tengah',
    },
    {
      'name': 'Tiara',
      'email': 'tiara@example.com',
      'hubungan': 'Ibu',
      'lokasi': 'Kendal, Jawa Tengah',
    },
  ];

  List<Map<String, String>> _filteredPenyandangList = [];

  @override
  void initState() {
    super.initState();
    _filteredPenyandangList = List.from(_penyandangList);
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredPenyandangList = _penyandangList.where((item) {
        final name = item['name']?.toLowerCase() ?? '';
        final email = item['email']?.toLowerCase() ?? '';
        return name.contains(query) || email.contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

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
                  'Penyandang yang Terhubung',
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Cari berdasarkan nama atau email...',
                hintStyle: AppTextStyles.regular12_5.copyWith(
                  color: Colors.grey,
                ),
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: _filteredPenyandangList.isEmpty
                ? _buildEmptyState()
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: _filteredPenyandangList.length,
                    itemBuilder: (context, index) {
                      final item = _filteredPenyandangList[index];
                      return GestureDetector(
                        onTap: () {
                          // TODO: Navigasi ke halaman detail penyandang jika seluruh card ditekan
                        },
                        child: _buildPenyandangCard(
                          name: item['name'] ?? '',
                          email: item['email'] ?? '',
                          hubungan: item['hubungan'] ?? '',
                          lokasi: item['lokasi'] ?? '',
                          onDelete: () {
                            // TODO: Tambahkan logika hapus jika diperlukan
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.group_off, size: 80, color: Colors.grey.shade400),
            const SizedBox(height: 16),
            Text(
              'Belum ada penyandang terhubung',
              textAlign: TextAlign.center,
              style: AppTextStyles.regular14.copyWith(
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPenyandangCard({
    required String name,
    required String email,
    required String hubungan,
    required String lokasi,
    required VoidCallback onDelete,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(50),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              // TODO: Navigasi ke halaman detail profil penyandang (seperti di Home)
              // Misalnya: Navigator.push(context, MaterialPageRoute(builder: (_) => const DetailProfilPenyandang()));
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
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
                  name,
                  style: AppTextStyles.bold16.copyWith(color: AppColors.dark),
                ),
                const SizedBox(height: 4),
                Text(
                  email,
                  style: AppTextStyles.regular12_5.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      hubungan,
                      style: AppTextStyles.regular12_5.copyWith(
                        color: AppColors.dark,
                      ),
                    ),
                    Row(
                      children: [
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
                            lokasi,
                            style: AppTextStyles.regular12_5.copyWith(
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            softWrap: false,
                          ),
                        ),
                        const SizedBox(width: 8),
                        InkWell(
                          onTap: onDelete,
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.red.shade50,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.delete_outline,
                              size: 18,
                              color: Colors.red.shade400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
