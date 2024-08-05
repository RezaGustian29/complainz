import 'package:complainz/config/app_sizes.dart';
import 'package:flutter/material.dart';

class AppEmptyState extends StatelessWidget {
  const AppEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/images_empty_state.png',
          width: 200,
        ),
        const SizedBox(height: AppSizes.padding),
        const Text(
          'Pilih kategori',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}
