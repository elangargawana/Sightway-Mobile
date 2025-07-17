import 'package:flutter/material.dart';
import 'package:sightway_mobile/views/components/bottom_nav.dart';
import 'package:sightway_mobile/views/pages/penyandang/home_penyandang.dart';
import 'package:sightway_mobile/views/pages/penyandang/monitor_penyandang.dart';
import 'package:sightway_mobile/views/pages/penyandang/setting_penyandang.dart';

class MainPenyandang extends StatefulWidget {
  const MainPenyandang({super.key});

  @override
  State<MainPenyandang> createState() => _MainPenyandangState();
}

class _MainPenyandangState extends State<MainPenyandang> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomePenyandang(),
    MonitorPenyandang(),
    SettingPenyandang(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: BottomNav(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
