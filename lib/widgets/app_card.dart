import 'package:complainz/config/app_colors.dart';
import 'package:flutter/material.dart';

class AppCardHome extends StatelessWidget {
  final String image;
  final String text;
  final Function() onTap;
  const AppCardHome({
    super.key,
    required this.image,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: 150,
              fit: BoxFit.fill,
            ),
            const Divider(
              color: AppColors.dividerColor,
              thickness: 1,
            ),
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryColor,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}


/* GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/report');
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/images_staf.png',
                    height: 150,
                    fit: BoxFit.fill,
                  ),
                  const Divider(
                    color: AppColors.dividerColor,
                    thickness: 1,
                  ),
                  const Text(
                    'Dosen dan Staff Akademik',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryColor,
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ), */