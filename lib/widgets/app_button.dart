import 'package:complainz/config/app_colors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final double? width;
  final double? height;
  final double? elevation;
  final Color? buttonColor;
  final Function() onTap;
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  const AppButton({
    super.key,
    this.width,
    this.height,
    this.elevation,
    this.buttonColor = AppColors.primaryColor,
    required this.onTap,
    required this.text,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: buttonColor,
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}

 /* SizedBox(
            width: 350,
            height: 45,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: AppColors.primaryColor,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: const Text(
                'Buat Akun Baru',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ), */
