import 'package:complainz/config/app_colors.dart';
import 'package:complainz/config/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                newsCard(),
                const SizedBox(height: AppSizes.padding),
                latestNews(),
                const SizedBox(height: AppSizes.padding),
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
            const Text(
              'Berita Terkini',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryColor,
              ),
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

  Widget latestNews() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Terbaru',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: AppColors.primaryColor,
          ),
        ),
        const SizedBox(height: AppSizes.padding / 2),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/detail-news');
          },
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.secondary100,
              borderRadius: BorderRadius.circular(AppSizes.radius * 2),
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
              children: [
                Padding(
                  padding: const EdgeInsets.all(AppSizes.padding / 2),
                  child: Image.asset(
                    'assets/images/images_news_sample.jpg',
                    width: 96,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
