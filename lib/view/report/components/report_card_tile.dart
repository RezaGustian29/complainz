import 'dart:convert';

import 'package:complainz/config/app_colors.dart';
import 'package:complainz/config/app_sizes.dart';
import 'package:flutter/material.dart';

class AppReportCardTile extends StatelessWidget {
  final String? photoUrl;
  final String username;
  final String fullname;
  final String createdAt;
  final String description;
  final String fedback;
  final String? reportImage;

  const AppReportCardTile({
    super.key,
    this.photoUrl,
    required this.username,
    required this.fullname,
    required this.createdAt,
    required this.description,
    required this.fedback,
    this.reportImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: AppSizes.padding, vertical: AppSizes.padding / 2),
      child: Container(
        width: double.infinity,
        //height: 337,
        //height: 250,
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
        child: Container(
          margin: const EdgeInsets.symmetric(
              vertical: AppSizes.radius * 2.5,
              horizontal: AppSizes.radius * 2.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (photoUrl?.isNotEmpty == true)
                    Container(
                      decoration: const ShapeDecoration(
                        shape: OvalBorder(
                          side: BorderSide(
                            width: 1.5,
                            strokeAlign: BorderSide.strokeAlignOutside,
                            color: Color(0xFF636D89),
                          ),
                        ),
                      ),
                      child: ClipOval(
                        child: Image.network(
                          photoUrl!,
                          width: 40,
                          height:
                              40, // Tambahkan height untuk memastikan bentuk bulat
                          fit: BoxFit
                              .cover, // Gunakan BoxFit.cover untuk mengisi area dengan baik
                        ),
                      ),
                    ),
                  if (photoUrl?.isEmpty == true)
                    Image.asset('assets/images/images_profile.png', width: 40),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //final result = model.getAllReport[i];
                        Text(
                          fullname,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primaryColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Text(
                          username,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    createdAt,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 10,
                ),
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Colors.amber,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize
                        .min, // This makes the column take the minimum space required
                    children: [
                      const Text(
                        'Laporan',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        description,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryColor,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (reportImage != null) _buildImageWidget(reportImage!),
                      /*  if (reportImage != null && reportImage!.isNotEmpty)
                        Image.memory(
                          base64Decode(reportImage!),
                          width: 50,
                        ), */

                      /* if (reportImage != null && reportImage!.isNotEmpty)
                        (Uri.tryParse(reportImage!)?.hasAbsolutePath ?? false)
                            ? Image.network(reportImage!)
                            : Image.memory(
                                base64Decode(reportImage!),
                                width: 50,
                              ), */
                      /* Image.asset(
                        'assets/images/images_logo.png',
                        width: 50,
                      ), */
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.padding,
                    vertical: AppSizes.padding / 2),
                width: double.infinity,
                //height: 82,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  color: AppColors.primaryColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Tindak Lanjut',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.secondaryTextColor,
                      ),
                    ),
                    const SizedBox(height: AppSizes.padding / 3),
                    Text(
                      fedback,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: AppColors.secondaryTextColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageWidget(String imageString) {
    if (Uri.tryParse(imageString)?.hasAbsolutePath ?? false) {
      // If it's a valid URL
      return Image.network(
        imageString,
        width: 80,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const Center(child: CircularProgressIndicator());
        },
        errorBuilder: (context, error, stackTrace) {
          return const Icon(Icons.error);
        },
      );
    } else if (imageString.startsWith('data:image')) {
      // If it's a base64 encoded image
      final base64String = imageString.split(',').last;
      return Image.memory(
        base64Decode(base64String),
        width: 80,
      );
    } else {
      // If it's neither a URL nor base64, show an error icon
      return const Icon(Icons.broken_image);
    }
  }
}






/* import 'package:complainz/config/app_colors.dart';
import 'package:complainz/config/app_sizes.dart';
import 'package:flutter/material.dart';

class AppReportCard extends StatelessWidget {
  final String photoUrl;
  final String fullname;
  final String username;
  final String createdAt;
  final String description;
  final String feedBack;
  const AppReportCard({
    super.key,
    required this.photoUrl,
    required this.fullname,
    required this.username,
    required this.createdAt,
    required this.description,
    required this.feedBack,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: AppSizes.padding, vertical: AppSizes.padding / 2),
      child: Container(
        width: double.infinity,
        //height: 337,
        height: 250,
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
        child: Container(
          margin: const EdgeInsets.symmetric(
              vertical: AppSizes.radius * 2.5,
              horizontal: AppSizes.radius * 2.5),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    photoUrl,
                    width: 40,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //final result = model.getAllReport[i];
                        Text(
                          fullname,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primaryColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Text(
                          username,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    createdAt,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 10,
                ),
                width: double.infinity,
                height: 63,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: AppColors.secondaryTextColor,
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Laporan',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        description,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryColor,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      /*  Image.asset(
                                    'assets/images/images_logo.png',
                                    width: 50,
                                  ), */
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.padding,
                    vertical: AppSizes.padding / 2),
                width: double.infinity,
                height: 82,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  color: AppColors.primaryColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Tindak Lanjut',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.secondaryTextColor,
                      ),
                    ),
                    const SizedBox(height: AppSizes.padding / 3),
                    Text(
                      feedBack,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: AppColors.secondaryTextColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
 */