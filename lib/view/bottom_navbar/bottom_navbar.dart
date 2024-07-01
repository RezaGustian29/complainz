import 'package:complainz/config/app_colors.dart';
import 'package:complainz/config/app_sizes.dart';
import 'package:complainz/view/account/my_account_view.dart';
import 'package:complainz/view/create_report/create_repor_list_viewt.dart';
import 'package:complainz/view/history/history_report_view.dart';
import 'package:complainz/view/home/home_view.dart';
import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int currentIndex = 0;
  int selectedIndex = 0;
  int currentPageIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(AppSizes.radius * 2.5),
            topRight: Radius.circular(AppSizes.radius * 2.5),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 10,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(AppSizes.radius * 2.5),
            topRight: Radius.circular(AppSizes.radius * 2.5),
          ),
          child: SizedBox(
            height: 80,
            child: NavigationBar(
              onDestinationSelected: (int index) {
                setState(() {
                  currentPageIndex = index;
                });
              },
              indicatorColor: AppColors.timelineColor,
              selectedIndex: currentPageIndex,
              destinations: const <Widget>[
                NavigationDestination(
                  selectedIcon: Icon(Icons.home),
                  icon: Icon(
                    Icons.home_outlined,
                    size: 30,
                  ),
                  label: '',
                ),
                NavigationDestination(
                  icon: Icon(
                    Icons.add_comment_outlined,
                    size: 30,
                  ),
                  label: '',
                ),
                NavigationDestination(
                  icon: Icon(
                    Icons.verified_user_outlined,
                    size: 30,
                  ),
                  label: '',
                ),
                NavigationDestination(
                  icon: Icon(
                    Icons.account_box_outlined,
                    size: 30,
                  ),
                  label: '',
                ),
              ],
            ),
          ),
        ),
      ),
      body: <Widget>[
        const HomeView(),
        const CreateReportListView(),
        const HistoryReportView(),
        const MyAccountView(),
      ][currentPageIndex],
    );
  }
}

/* import 'package:complainz/config/app_colors.dart';
import 'package:complainz/config/app_sizes.dart';
import 'package:complainz/view/account/my_account_view.dart';
import 'package:complainz/view/create_report/create_repor_list_viewt.dart';
import 'package:complainz/view/history/history_report_view.dart';
import 'package:complainz/view/home/home_view.dart';
import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int currentIndex = 0;
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeView(),
    CreateReportListView(),
    HistoryReportView(),
    MyAccountView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(AppSizes.radius * 2.5),
            topRight: Radius.circular(AppSizes.radius * 2.5),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 10,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(AppSizes.radius * 2.5),
            topRight: Radius.circular(AppSizes.radius * 2.5),
          ),
          child: SizedBox(
            height: 80,
            child: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_outlined,
                    size: 30,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.add_comment_outlined,
                    size: 30,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.verified_user_outlined,
                    size: 30,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.account_box_outlined,
                    size: 30,
                  ),
                  label: '',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: AppColors.primaryColor,
              unselectedItemColor: Colors.black,
              onTap: _onItemTapped,
            ),
          ),
        ),
      ),
    );
  }
} */

/* import 'package:complainz/config/app_colors.dart';
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
 */