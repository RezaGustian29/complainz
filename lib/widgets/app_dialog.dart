import 'package:complainz/config/app_colors.dart';
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
