import 'package:complainz/config/app_colors.dart';
import 'package:complainz/config/app_sizes.dart';
import 'package:flutter/material.dart';

class AppSnackbar {
  static Future<void> show(
    NavigatorState navigator, {
    IconData? icon,
    Color? backgroundColor,
    Color? textColor,
    Color? iconColor,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    double? borderRadius,
    double? iconSize,
    required String title,
    TextStyle? titleStyle,
    String? subtitle,
    TextStyle? subtitleStyle,
    bool? showCloseButton,
    Duration? displayDuration,
  }) async {
    final messenger = ScaffoldMessenger.of(navigator.context);
    messenger.hideCurrentSnackBar();
    messenger.showSnackBar(SnackBar(
      backgroundColor: Colors.transparent,
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      padding: EdgeInsets.zero,
      margin: margin ?? const EdgeInsets.all(AppSizes.padding),
      duration: displayDuration ?? const Duration(seconds: 5),
      content: AppSnackbarWidget(
        messenger: messenger,
        icon: icon,
        backgroundColor: backgroundColor ?? AppColors.primaryColor,
        textColor: textColor ?? Colors.white,
        iconColor: iconColor ?? Colors.white,
        padding: padding ?? const EdgeInsets.all(14),
        borderRadius: borderRadius ?? 8,
        iconSize: iconSize ?? 16,
        title: title,
        subtitle: subtitle,
        titleStyle: titleStyle,
        subtitleStyle: subtitleStyle,
        showCloseButton: showCloseButton ?? false,
      ),
    ));
  }
}

class AppSnackbarWidget extends StatelessWidget {
  final ScaffoldMessengerState? messenger;
  final IconData? icon;
  final Color backgroundColor;
  final Color textColor;
  final Color iconColor;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final double iconSize;
  final String title;
  final TextStyle? titleStyle;
  final String? subtitle;
  final TextStyle? subtitleStyle;
  final bool? showCloseButton;
  final Function()? onTapCloseButton;
  final double? fontSize;
  final FontWeight? fontWeight;

  const AppSnackbarWidget(
      {super.key,
      this.messenger,
      this.icon,
      this.backgroundColor = AppColors.primaryColor,
      this.textColor = Colors.white,
      this.iconColor = Colors.white,
      this.padding = const EdgeInsets.all(14),
      this.borderRadius = 8,
      this.iconSize = 16,
      required this.title,
      this.subtitle,
      this.titleStyle,
      this.subtitleStyle,
      this.showCloseButton = false,
      this.onTapCloseButton,
      this.fontSize,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: const [],
        ),
        child: Row(
          children: [
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  icon != null
                      ? Padding(
                          padding:
                              EdgeInsets.only(right: padding.horizontal / 3),
                          child: Icon(
                            icon,
                            size: iconSize,
                            color: iconColor,
                          ),
                        )
                      : const SizedBox.shrink(),
                  Expanded(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: titleStyle ??
                            TextStyle(
                              fontSize: fontSize,
                              fontWeight: fontWeight,
                              color: textColor,
                            ),
                      ),
                      subtitle != null
                          ? Text(
                              subtitle!,
                              style: titleStyle ??
                                  TextStyle(
                                    fontSize: fontSize,
                                    fontWeight: fontWeight,
                                    color: textColor,
                                  ),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ))
                ],
              ),
            ),
            showCloseButton == true
                ? IconButton(
                    padding: EdgeInsets.zero,
                    color: Colors.transparent,
                    icon: Icon(
                      Icons.close,
                      size: iconSize,
                      color: iconColor,
                    ),
                    onPressed: onTapCloseButton ??
                        () {
                          messenger?.hideCurrentSnackBar();
                        })
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
