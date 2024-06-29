import 'package:complainz/config/app_colors.dart';
import 'package:complainz/config/app_sizes.dart';
import 'package:complainz/widgets/app_back_button.dart';
import 'package:complainz/widgets/app_card_news.dart';
import 'package:flutter/cupertino.dart';
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
                const AppBackButton(
                  text: 'Berita Terkini',
                ),
                const SizedBox(height: AppSizes.padding),
                popularNews(),
                const SizedBox(height: AppSizes.padding),
                //newsCard(),
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

  Widget popularNews() {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 250,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(AppSizes.radius * 2),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppSizes.radius * 2),
            child: Image.asset(
              'assets/images/images_news_sample.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: -25, // Half of the height of the container
          left: 20,
          right: 20,
          child: Container(
            height: 50,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              'News Headline',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
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
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Terbaru',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: AppColors.primaryColor,
          ),
        ),
        SizedBox(height: AppSizes.padding / 2),
        AppCardNews(),
        SizedBox(height: AppSizes.padding / 2),
        AppCardNews(),
        SizedBox(height: AppSizes.padding / 2),
        AppCardNews(),
        SizedBox(height: AppSizes.padding / 2),
        AppCardNews(),
        SizedBox(height: AppSizes.padding / 2),
        AppCardNews(),
      ],
    );
  }
}
