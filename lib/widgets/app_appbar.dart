import 'package:complainz/config/app_colors.dart';
import 'package:complainz/config/app_sizes.dart';
import 'package:flutter/material.dart';

class AppAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  //final TextStyle? titleStyle;
  final double? fontSize;
  final Color? titleColor;
  const AppAppbar({
    super.key,
    this.title,
    //this.titleStyle,
    this.fontSize = 30,
    this.titleColor = AppColors.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_outlined),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      centerTitle: true,
      actions: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.only(right: AppSizes.padding),
            child: Text(
              title!,
              style: TextStyle(
                fontSize: fontSize ?? 30,
                fontWeight: FontWeight.w700,
                color: titleColor ?? AppColors.primaryColor,
              ),
            ),
          )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

/* import 'package:complainz/config/app_colors.dart';
import 'package:complainz/config/app_sizes.dart';
import 'package:flutter/material.dart';

class AppAppbar extends StatelessWidget {
  final String? title;
  //final TextStyle? titleStyle;
  final double? fontSize;
  final Color? titleColor;
  const AppAppbar({
    super.key,
    this.title,
    //this.titleStyle,
    this.fontSize = 30,
    this.titleColor = AppColors.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return appAppbar(context);
  }

  PreferredSizeWidget appAppbar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_outlined),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: AppSizes.padding),
          child: Text(
            title!,
            style: TextStyle(
              fontSize: fontSize ?? 30,
              fontWeight: FontWeight.w700,
              color: titleColor ?? AppColors.primaryColor,
            ),
          ),
        )
      ],
    );
  }
}
 */
