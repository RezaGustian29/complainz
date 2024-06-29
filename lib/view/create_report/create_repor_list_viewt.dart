import 'package:complainz/config/app_colors.dart';
import 'package:complainz/config/app_sizes.dart';
import 'package:flutter/material.dart';

class CreateReportListView extends StatefulWidget {
  const CreateReportListView({super.key});

  @override
  State<CreateReportListView> createState() => _CreateReportListViewState();
}

class _CreateReportListViewState extends State<CreateReportListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: AppSizes.padding, horizontal: AppSizes.padding / 1.5),
          child: Column(
            children: [
              title(),
              const SizedBox(height: AppSizes.padding),
              cardReport(),
              const Spacer(),
              footerTitle(),
            ],
          ),
        ),
      ),
    );
  }

  Widget title() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'Laporkan!',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }

  Widget cardReport() {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/create-complaint');
          },
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: AppSizes.padding / 2),
            width: double.infinity,
            height: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSizes.radius * 1.5),
              color: AppColors.contentColor,
              boxShadow: const [
                BoxShadow(
                  color: AppColors.shadowColor,
                  blurRadius: 8,
                  offset: Offset(0, 0),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/images_pengaduan.png',
                  width: 124,
                  height: 100,
                  //fit: BoxFit.cover,
                ),
                const Text(
                  'Pengaduan',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryColor,
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: AppSizes.padding),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/create-aspiration');
          },
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: AppSizes.padding * 2),
            width: double.infinity,
            height: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSizes.radius * 1.5),
              color: AppColors.contentColor,
              boxShadow: const [
                BoxShadow(
                  color: AppColors.shadowColor,
                  blurRadius: 8,
                  offset: Offset(0, 0),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Aspirasi',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryColor,
                  ),
                ),
                Image.asset(
                  'assets/images/images_aspirasi.png',
                  width: 124,
                  height: 100,
                  //fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Widget footerTitle() {
  return const Center(
    child: Text(
      'Pilih Kategori \nLaporan',
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: AppColors.primaryColor,
      ),
      textAlign: TextAlign.center,
    ),
  );
}
