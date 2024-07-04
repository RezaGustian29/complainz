import 'package:complainz/config/app_colors.dart';
import 'package:complainz/config/app_sizes.dart';
import 'package:complainz/widgets/app_button.dart';
import 'package:complainz/widgets/app_progres_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppDialog {
  static Future<dynamic> show(
    NavigatorState navigator, {
    String? title,
    Widget? child,
    String? text,
    EdgeInsetsGeometry? padding,
    String? leftButtonText,
    String? rightButtonText,
    Color? backgroundColor,
    Function()? onTapLeftButton,
    Function()? onTapRightButton,
    bool? dismissible,
    bool? showButtons,
    bool? enableRightButton,
    bool? enableLeftButton,
    Color? leftButtonTextColor,
    Color? rightButtonTextColor,
    double? elevation,
  }) async {
    return await showDialog(
      context: navigator.context,
      builder: (context) {
        return AppDialogWidget(
          title: title,
          text: text,
          padding: padding,
          rightButtonText: rightButtonText,
          leftButtonText: leftButtonText,
          backgroundColor: backgroundColor ?? Colors.white,
          onTapLeftButton: onTapLeftButton,
          onTapRightButton: onTapRightButton,
          dismissible: dismissible ?? true,
          showButtons: showButtons ?? true,
          enableRightButton: enableRightButton ?? true,
          enableLeftButton: enableLeftButton ?? true,
          leftButtonTextColor: leftButtonTextColor ?? Colors.black,
          rightButtonTextColor: rightButtonTextColor ?? AppColors.primaryColor,
          elevation: elevation,
          child: child,
        );
      },
    );
  }

  static Future<void> showErrorDialog(
    NavigatorState navigator, {
    String? title,
    String? message,
    String? error,
    Function()? onTapClose,
  }) async {
    showDialog(
      context: navigator.context,
      barrierDismissible: false,
      builder: (context) {
        return AppDialogWidget(
          title: title ?? 'Oops!',
          onTapRightButton: onTapClose ??
              () {
                navigator.pop();
                navigator.pop();
              },
          child: Column(
            children: [
              Text(
                message ??
                    'Something went wrong, please contact your system administrator or try restart the app',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
              if (error != null)
                Padding(
                  padding: const EdgeInsets.only(top: AppSizes.padding),
                  child: Text(
                    error.toString().length > 35
                        ? error.toString().substring(0, 35)
                        : error.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  static Future<void> showDialogProgress(
    NavigatorState navigator, {
    bool dismissible = false,
  }) async {
    showDialog(
      context: navigator.context,
      builder: (context) {
        return AppDialogWidget(
          dismissible: kDebugMode ? true : dismissible,
          backgroundColor: Colors.transparent,
          elevation: 0,
          showButtons: false,
          child: const AppProgresIndicator(
            color: Colors.white,
            textColor: Colors.white,
          ),
        );
      },
    );
  }
}

// Default Dialog
class AppDialogWidget extends StatelessWidget {
  final String? title;
  final Widget? child;
  final String? text;
  final EdgeInsetsGeometry? padding;
  final String? leftButtonText;
  final String? rightButtonText;
  final Color backgroundColor;
  final bool dismissible;
  final bool showButtons;
  final bool enableRightButton;
  final bool enableLeftButton;
  final Color leftButtonTextColor;
  final Color rightButtonTextColor;
  final double? elevation;
  final Function()? onTapLeftButton;
  final Function()? onTapRightButton;

  const AppDialogWidget({
    super.key,
    this.title,
    this.child,
    this.text,
    this.padding,
    this.rightButtonText = 'Close',
    this.leftButtonText,
    this.backgroundColor = Colors.white,
    this.onTapLeftButton,
    this.onTapRightButton,
    this.dismissible = true,
    this.showButtons = true,
    this.enableRightButton = true,
    this.enableLeftButton = true,
    this.leftButtonTextColor = Colors.white,
    this.rightButtonTextColor = AppColors.primaryColor,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () => Future.value(dismissible),
      child: Dialog(
        elevation: elevation,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 512),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                dialogTitle(),
                dialogBody(),
                dialogButtons(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dialogTitle() {
    return title != null
        ? Container(
            padding: const EdgeInsets.all(24),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                // border: Border(
                //   bottom: BorderSide(
                //     width: 0.5,
                //     color: AppColors.blackLv12,
                //   ),
                // ),
                ),
            child: Text(title!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.black)),
          )
        : const SizedBox.shrink();
  }

  Widget dialogBody() {
    return Container(
      padding: padding ??
          const EdgeInsets.symmetric(
            horizontal: 22,
            vertical: 10,
          ),
      alignment: Alignment.center,
      child: text != null
          ? Text(
              text!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.amber),
            )
          : child ?? const SizedBox.shrink(),
    );
  }

  Widget dialogButtons(BuildContext context) {
    return !showButtons
        ? const SizedBox.shrink()
        : Container(
            decoration: const BoxDecoration(
                // border: Border(
                //   top: BorderSide(
                //     width: 0.5,
                //     color: AppColors.blackLv13,
                //   ),
                // ),
                ),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: <Widget>[
                  leftButtonText != null
                      ? Expanded(
                          child: AppButton(
                            text: leftButtonText!,
                            buttonColor: backgroundColor,
                            color: enableRightButton
                                ? leftButtonTextColor
                                : Colors.white,
                            onTap: () async {
                              if (enableLeftButton) {
                                if (onTapLeftButton != null) {
                                  onTapLeftButton!();
                                } else {
                                  Navigator.of(context).pop();
                                }
                              }
                            },
                          ),
                        )
                      : const SizedBox.shrink(),
                  leftButtonText != null && rightButtonText != null
                      ? Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 12,
                          ),
                          height: 18,
                          width: 1,
                          color: Colors.black,
                        )
                      : const SizedBox.shrink(),
                  rightButtonText != null
                      ? Expanded(
                          child: AppButton(
                            text: rightButtonText!,
                            buttonColor: backgroundColor,
                            color: enableRightButton
                                ? rightButtonTextColor
                                : Colors.black,
                            onTap: () async {
                              if (enableRightButton) {
                                if (onTapRightButton != null) {
                                  onTapRightButton!();
                                } else {
                                  Navigator.of(context).pop();
                                }
                              }
                            },
                          ),
                        )
                      : const SizedBox.shrink()
                ],
              ),
            ),
          );
  }
}

// Custom Dialog
/* class AppDialogCustomWidget extends StatelessWidget {
  final String? image;
  final String title;
  final String subtitle;
  final String? textButton;
  final String? textSecondButton;
  final ImgProvider imgProvider;
  final IconData? icon;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;
  final Color? titleColor;
  final Color? subtitleColor;
  final Axis? directionButton;
  final bool showItemBotom;
  final List<Widget>? itemBottom;
  final Widget? moreitem;
  final bool isFromAppAssets;
  final void Function()? onTapButton;
  final void Function()? onTapSecondButton;

  const AppDialogCustomWidget({
    super.key,
    required this.title,
    required this.subtitle,
    this.backgroundColor,
    this.borderRadius,
    this.directionButton,
    this.icon,
    this.image,
    this.imgProvider = ImgProvider.assetImage,
    this.margin,
    this.padding,
    this.subtitleColor,
    this.titleColor,
    this.showItemBotom = true,
    this.itemBottom,
    this.textButton,
    this.textSecondButton,
    this.moreitem,
    this.isFromAppAssets = true,
    this.onTapButton,
    this.onTapSecondButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.white,
        borderRadius: borderRadius ?? BorderRadius.circular(AppSizes.padding),
      ),
      child: Padding(
        padding: padding ?? EdgeInsets.all(AppSizes.padding * 1.2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image != null
                ? Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: AppSizes.padding * 1.5),
                    child: AppImage(
                      image: image!,
                      imgProvider: imgProvider,
                      width: 150,
                      isFromAppAssets: isFromAppAssets,
                    ),
                  )
                : const SizedBox.shrink(),
            Text(
              title,
              textAlign: TextAlign.center,
              style:  TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.white)
            ),
            SizedBox(height: AppSizes.padding * 1.5),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.amber)
            ),
            showItemBotom
                ? Padding(
                    padding: EdgeInsets.only(top: AppSizes.padding * 1.5),
                    child: Flex(
                      direction: directionButton ?? Axis.vertical,
                      children: itemBottom ??
                          [
                            AppButton(
                              onTap: onTapButton ?? () {},
                              text: textButton ?? 'button',
                              rounded: true,
                            ),
                            SizedBox(height: AppSizes.padding / 2),
                            AppButton(
                              onTap: onTapSecondButton ?? () {},
                              text: textSecondButton ?? 'Button',
                              textColor: AppColors.primaryColor,
                              buttonColor: AppColors.blueLv5,
                              rounded: true,
                            ),
                            moreitem ?? const SizedBox.shrink(),
                          ],
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  } 
} */


/* import 'package:complainz/config/app_colors.dart';
import 'package:complainz/config/app_sizes.dart';
import 'package:complainz/widgets/app_progres_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppDialog {
  static Future<void> showErrorDialog(
    NavigatorState navigator, {
    String? title,
    String? message,
    String? error,
    Function()? onTapClose,
  }) async {
    showDialog(
      context: navigator.context,
      barrierDismissible: false,
      builder: (context) {
        return AppDialogWidget(
          title: title ?? 'Oops!',
          onTapRightButton: onTapClose ??
              () {
                navigator.pop();
                navigator.pop();
              },
          child: Column(
            children: [
              Text(
                message ??
                    'Something went wrong, please contact your system administrator or try restart the app',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              if (error != null)
                Padding(
                  padding: const EdgeInsets.only(top: AppSizes.padding),
                  child: Text(
                    error.toString().length > 35
                        ? error.toString().substring(0, 35)
                        : error.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  static Future<void> showDialogProgress(
    NavigatorState navigator, {
    bool dismissible = false,
  }) async {
    showDialog(
      context: navigator.context,
      builder: (context) {
        return AppDialogWidget(
          dismissible: kDebugMode ? true : dismissible,
          backgroundColor: Colors.transparent,
          elevation: 0,
          showButtons: false,
          child: const AppProgresIndicator(
            color: AppColors.primaryColor,
            textColor: Colors.white,
          ),
        );
      },
    );
  }
}

class AppDialogWidget extends StatelessWidget {
  final String? title;
  final String? text;
  final bool dismissible;
  final Color backgroundColor;
  final double? elevation;
  final bool showButtons;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final Function()? onTapRightButton;
  const AppDialogWidget(
      {super.key,
      this.title,
      this.text,
      this.dismissible = true,
      this.backgroundColor = Colors.white,
      this.elevation,
      this.showButtons = true,
      this.onTapRightButton,
      this.padding,
      this.child});

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () => Future.value(dismissible),
      child: Dialog(
        elevation: 20,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 512),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: <Widget>[
                dialogTitle(),
                dialogBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dialogTitle() {
    return title != null
        ? Container(
            padding: const EdgeInsets.all(24),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                //
                //
                //
                //

                ),
            child: Text(
              title!,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          )
        : const SizedBox.shrink();
  }

  Widget dialogBody() {
    return Container(
        padding: padding ??
            const EdgeInsets.symmetric(
              horizontal: 22,
              vertical: 10,
            ),
        alignment: Alignment.center,
        child: text != null
            ? Text(
                text!,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              )
            : child ?? const SizedBox.shrink());
  }
}
 */