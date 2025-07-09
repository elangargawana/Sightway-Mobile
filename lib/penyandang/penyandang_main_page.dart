import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sightway_mobile/penyandang/dashboard_penyandang.dart';
import 'package:sightway_mobile/penyandang/monitor_penyandang.dart';
import 'package:sightway_mobile/penyandang/setting_penyandang.dart';
import 'package:sightway_mobile/theme.dart';

class PenyandangMainPage extends StatefulWidget {
  const PenyandangMainPage({super.key});

  @override
  State<PenyandangMainPage> createState() => _PenyandangMainPageState();
}

class _PenyandangMainPageState extends State<PenyandangMainPage> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    DashboardPenyandang(),
    MonitorPenyandang(),
    SettingPenyandang(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: selectedIndex,
        selectedItemColor: purple1,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/home.svg',
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                selectedIndex == 0 ? purple1 : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/monitor.svg',
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                selectedIndex == 1 ? purple1 : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/setting.svg',
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                selectedIndex == 2 ? purple1 : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
