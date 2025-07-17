import 'package:flutter/material.dart';
import 'package:sightway_mobile/views/components/bottom_nav.dart';
import 'package:sightway_mobile/views/pages/pemantau/home_pemantau.dart';
import 'package:sightway_mobile/views/pages/pemantau/monitor_pemantau.dart';
import 'package:sightway_mobile/views/pages/pemantau/setting_pemantau.dart';

class MainPemantau extends StatefulWidget {
  const MainPemantau({super.key});

  @override
  State<MainPemantau> createState() => _MainPemantauState();
}

class _MainPemantauState extends State<MainPemantau> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomePemantau(),
    MonitorPemantau(),
    SettingPemantau(),
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
