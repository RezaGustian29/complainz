import 'package:complainz/config/app_colors.dart';
import 'package:complainz/config/app_sizes.dart';
import 'package:complainz/widgets/app_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }

  Widget body() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding / 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/images_logo_start.png'),
            const SizedBox(
              height: AppSizes.padding,
            ),
            AppButton(
              text: 'Buat Akun Baru',
              onTap: () {
                Navigator.pushReplacementNamed(context, '/register');
              },
            ),
            const SizedBox(
              height: AppSizes.padding / 1.5,
            ),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Sudah Punya Akun, ',
                    style: TextStyle(
                      color: AppColors.font,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(
                    text: 'Masuk',
                    style: const TextStyle(
                      color: AppColors.font,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
