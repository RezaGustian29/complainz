import 'package:complainz/config/app_colors.dart';
import 'package:complainz/config/app_sizes.dart';
import 'package:flutter/material.dart';

class HistoryReportTile extends StatelessWidget {
  final String? description;
  const HistoryReportTile({
    super.key,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.padding / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              description!,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryColor,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSizes.radius * 1.5),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.padding,
                vertical: AppSizes.padding / 2,
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/status');
            },
            child: const Text(
              'Detail',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppColors.secondaryTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/* Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: AppSizes.padding / 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            //'${index + 1}. ${reports[index]['title']}',
                            //result.description,
                            "${i + 1}. ${result.description}",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primaryColor,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(AppSizes.radius * 1.5),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSizes.padding,
                              vertical: AppSizes.padding / 2,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/status');
                          },
                          child: const Text(
                            'Detail',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: AppColors.secondaryTextColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ); */
