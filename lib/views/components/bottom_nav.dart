import 'package:flutter/material.dart';
import 'package:sightway_mobile/core/constants/constants.dart';

class BottomNav extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNav({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      selectedItemColor: AppColors.purple1,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home, size: 32), label: ''),
        BottomNavigationBarItem(
          icon: Icon(Icons.monitor_heart_outlined, size: 32),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings, size: 32),
          label: '',
        ),
      ],
    );
  }
}
