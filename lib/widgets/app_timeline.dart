import 'package:complainz/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class AppTimeline extends StatelessWidget {
  bool isFirst;
  bool isLast;
  Widget endChild;
  AppTimeline({
    required this.isFirst,
    required this.isLast,
    required this.endChild,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 175,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        endChild: endChild,
        beforeLineStyle: const LineStyle(
          color: AppColors.timelineColor,
          thickness: 5,
        ),
        indicatorStyle:
            const IndicatorStyle(color: AppColors.timelineColor, width: 20),
      ),
    );
  }
}
