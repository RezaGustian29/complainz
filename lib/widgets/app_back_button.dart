import 'package:complainz/config/app_colors.dart';
import 'package:flutter/material.dart';

class AppBackButton extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final FontWeight? fontWeight;
  const AppBackButton({
    super.key,
    this.text,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            'assets/icons/icons_arrow_back.png',
            width: 35,
          ),
        ),
        if (text != null)
          Text(
            text!,
            style: TextStyle(
              fontSize: fontSize ?? 20,
              fontWeight: fontWeight ?? FontWeight.w600,
              color: AppColors.primaryColor,
            ),
          ),
      ],
    );
  }
}
