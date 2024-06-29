import 'package:complainz/config/app_colors.dart';
import 'package:complainz/config/app_sizes.dart';
import 'package:flutter/material.dart';

class AppCardStatus extends StatelessWidget {
  final String title;
  final String subTitle;
  final String images;
  final Function() onTap;
  const AppCardStatus({
    super.key,
    required this.title,
    required this.subTitle,
    required this.onTap,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: AppSizes.padding / 1.5),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.radius * 2),
            color: AppColors.timelineColor,
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(
                    AppSizes.radius * 2), // Sesuaikan dengan kebutuhan
                child: Image.asset(
                  images,
                  width: 90,
                  height: 90,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(width: AppSizes.padding / 1.5),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    //'Complaint Diterima',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  Text(
                    subTitle,
                    //'Laporan anda sudah kami terima',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
