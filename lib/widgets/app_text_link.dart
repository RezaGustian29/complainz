import 'package:complainz/config/app_colors.dart';
import 'package:complainz/config/app_sizes.dart';
import 'package:flutter/material.dart';

class AppTextLink extends StatelessWidget {
  final Function() onTap;
  final IconData icon;
  final String text;
  final bool? divider;
  const AppTextLink({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
    this.divider = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(icon),
            const SizedBox(width: AppSizes.padding),
            GestureDetector(
              onTap: onTap,
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSizes.padding / 1.5),
        if (divider == true) withDivider()
      ],
    );
  }

  Widget withDivider() {
    return const Divider(
      color: AppColors.primaryColor,
      thickness: 1,
    );
  }
}
