import 'package:complainz/config/app_colors.dart';
import 'package:complainz/config/app_sizes.dart';
import 'package:flutter/material.dart';

class DetailNewsView extends StatefulWidget {
  const DetailNewsView({super.key});

  @override
  State<DetailNewsView> createState() => _DetailNewsViewState();
}

class _DetailNewsViewState extends State<DetailNewsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding),
            child: Column(
              children: [
                newsCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget newsCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/icons/icons_arrow_back.png',
              width: 40,
            ),
          ],
        ),
        const SizedBox(height: AppSizes.padding),
        Container(
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(AppSizes.radius * 2),
          ),
          child: Row(
            children: [
              Image.asset(
                'assets/images/images_logo.png',
                width: 100,
                height: 200,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
