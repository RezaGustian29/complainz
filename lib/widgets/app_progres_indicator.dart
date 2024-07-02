import 'dart:ffi';

import 'package:complainz/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class AppProgresIndicator extends StatelessWidget {
  final Color color;
  final Color? textColor;
  final double size;
  final double fontSize;
  final bool showMessage;
  final String message;
  const AppProgresIndicator({
    super.key,
    this.color = Colors.amber,
    this.textColor,
    this.size = 42,
    this.fontSize = 10,
    this.showMessage = true,
    this.message = 'Please wait',
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: size,
            width: size,
            child: LoadingIndicator(
              indicatorType: Indicator.ballSpinFadeLoader,
              colors: [color],
            ),
          ),
          showMessage
              ? Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    message,
                    style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.w700,
                        color: textColor ?? Colors.black),
                  ),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
