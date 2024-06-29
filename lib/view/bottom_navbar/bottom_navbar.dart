import 'package:complainz/config/app_colors.dart';
import 'package:complainz/provider/bottom_navbar_provider.dart';
import 'package:complainz/view/account/my_account_view.dart';
import 'package:complainz/view/create_report/create_repor_list_viewt.dart';
import 'package:complainz/view/history/history_report_view.dart';
import 'package:complainz/view/home/home_view.dart';
import 'package:complainz/view/status/status_complaint_view.dart';
import 'package:flutter/material.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';
import 'package:provider/provider.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int selectedIndex = 0;

  final List<Widget> pages = <Widget>[
    const HomeView(),
    const CreateReportListView(),
    const HistoryReportView(),
    const MyAccountView(),
  ];
  @override
  Widget build(BuildContext context) {
    final bottomNavbarProvider = Provider.of<BottomNavBarProvider>(context);
    return Scaffold(
      body: pages[bottomNavbarProvider.currentIndex],
      bottomNavigationBar: MoltenBottomNavigationBar(
        borderRaduis: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        barHeight: 80,
        domeCircleSize: 36,
        domeWidth: 100,
        domeHeight: 10,
        domeCircleColor: AppColors.secondary100,
        barColor: AppColors.secondary100,
        borderColor: Colors.black12,
        borderSize: 2,
        selectedIndex: bottomNavbarProvider.currentIndex,
        onTabChange: (int index) => bottomNavbarProvider.currentIndex = index,
        tabs: [
          MoltenTab(
            selectedColor: AppColors.primaryColor,
            icon: Image.asset('assets/icons/icons_home.png'),
          ),
          MoltenTab(
            selectedColor: AppColors.primaryColor,
            icon: Image.asset('assets/icons/icons_chat_add.png'),
          ),
          MoltenTab(
            selectedColor: AppColors.primaryColor,
            icon: Image.asset('assets/icons/icons_shield.png'),
          ),
          MoltenTab(
            selectedColor: AppColors.primaryColor,
            icon: Image.asset('assets/icons/icons_user.png'),
          ),
        ],
      ),
    );
  }
}
