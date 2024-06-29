import 'package:complainz/config/app_colors.dart';
import 'package:complainz/config/app_sizes.dart';
import 'package:flutter/material.dart';

enum CardReport { pengaduan, aspirasi }

class AppCardReport extends StatelessWidget {
  final Function onTap;
  final String images;
  final String text;
  const AppCardReport({
    super.key,
    required this.onTap,
    required this.images,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            onTap;
          },
          child: Container(
            padding: const EdgeInsets.only(
                left: AppSizes.padding, right: AppSizes.padding * 2),
            width: double.infinity,
            height: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSizes.radius * 2),
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
                  images,
                  width: 124,
                  height: 100,
                  //fit: BoxFit.cover,
                ),
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  /* Widget cardReport() {
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
              borderRadius: BorderRadius.circular(AppSizes.radius * 2),
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
      ],
    );
  } */
}
