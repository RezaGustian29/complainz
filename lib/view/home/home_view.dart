import 'package:complainz/config/app_colors.dart';
import 'package:complainz/config/app_sizes.dart';
import 'package:complainz/view/report/report_view.dart';
import 'package:complainz/widgets/app_card.dart';
import 'package:complainz/widgets/app_dialog.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: AppSizes.padding),
            child: Column(
              children: [
                header(),
                const SizedBox(height: AppSizes.padding / 2),
                carouselSlider(),
                const SizedBox(height: AppSizes.padding / 4),
                newsButton(),
                const SizedBox(height: AppSizes.padding / 4),
                content(NavigatorState()),
                const SizedBox(height: AppSizes.padding),

                //const SizedBox(height: AppSizes.padding / 4),
                //footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget header() {
    return Container(
      margin: const EdgeInsets.only(
        top: 16,
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/images/images_logo_splash.png',
            height: 40,
          ),
        ],
      ),
    );
  }

  Widget carouselSlider() {
    return Image.asset(
      'assets/images/images_carousel.png',
      height: 192,
    );
  }

  Widget newsButton() {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.radius * 1.5),
        shape: BoxShape.rectangle,
        border: Border.all(
          color: AppColors.primaryColor,
        ),
      ),
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, '/news');
        },
        child: const Text(
          'Lihat Berita Terkini',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }

  Widget content(NavigatorState navigator) {
    return Container(
      margin: const EdgeInsets.only(
        top: 25,
      ),
      child: GridView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 25,
          mainAxisExtent: 219,
        ),
        children: [
          AppCardHome(
            image: 'assets/images/images_staf.png',
            text: 'Dosen dan Staff Akademik',
            onTap: () {
              //Navigator.pushNamed(context, '/report');
              Navigator.of(context).push(
                PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return const ReportView(
                        category: "1",
                      );
                    },
                    transitionDuration: const Duration(milliseconds: 300),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      final tween = Tween(
                        begin: const Offset(2, 0),
                        end: Offset.zero,
                      );
                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      );
                    }),
              );
            },
          ),
          AppCardHome(
            image: 'assets/images/images_sarana.png',
            text: 'Sarana dan Prasarana',
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return const ReportView(
                        category: "2",
                      );
                    },
                    transitionDuration: const Duration(milliseconds: 300),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      final tween = Tween(
                        begin: const Offset(2, 0),
                        end: Offset.zero,
                      );
                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      );
                    }),
              );
            },
          ),
          AppCardHome(
            image: 'assets/images/images_kuliah.png',
            text: 'Sistem \nPerkuliahan',
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return const ReportView(
                        category: "3",
                      );
                    },
                    transitionDuration: const Duration(milliseconds: 300),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      final tween = Tween(
                        begin: const Offset(2, 0),
                        end: Offset.zero,
                      );
                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      );
                    }),
              );
            },
          ),
          AppCardHome(
            image: 'assets/images/images_ormawa.png',
            text: 'Organisasi Mahasiswa',
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return const ReportView(
                        category: "5",
                      );
                    },
                    transitionDuration: const Duration(milliseconds: 300),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      final tween = Tween(
                        begin: const Offset(2, 0),
                        end: Offset.zero,
                      );
                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      );
                    }),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget footer() {
    return Container(
      margin: const EdgeInsets.only(
        top: 30,
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        width: 120,
        height: 36,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: AppColors.primaryColor,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/report');
              },
              child: const Text(
                'Lihat Semua',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            /* SizedBox(
                width: 4,
              ), */
            Image.asset(
              'assets/icons/icons_arrow_right.png',
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
