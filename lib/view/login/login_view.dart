import 'package:complainz/config/app_colors.dart';
import 'package:complainz/config/app_sizes.dart';
import 'package:complainz/widgets/app_button.dart';
import 'package:complainz/widgets/app_textfield.dart';
import 'package:complainz/widgets/app_textpassword.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _passwordVisible = true;
  bool buttonActive = false;

  @override
  void initState() {
    _passwordVisible = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            text(),
            const SizedBox(height: AppSizes.padding * 2),
            form(),
            const SizedBox(height: AppSizes.padding),
            loginButton(),
          ],
        ),
      ),
    );
  }

  Widget text() {
    return const Text(
      'Complainz sudah menantikan kamu, ayo mulai laporkan keadaan terkini.',
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppColors.primaryColor,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget form() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding),
      child: Column(
        children: [
          const AppTextField(
            hinText: 'Username/Email',
            borderRadius: AppSizes.radius * 1.5,
            rounded: false,
          ),
          const SizedBox(
            height: AppSizes.padding / 2,
          ),
          AppTextPassword(
            hinText: 'Password',
            obscureText: _passwordVisible,
            borderRadius: AppSizes.radius * 1.5,
            rounded: false,
            icon: Icon(
              _passwordVisible ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          ),
          const SizedBox(
            height: AppSizes.padding / 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Lupa Password',
                      style: TextStyle(
                        color: AppColors.font,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget loginButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding / 2),
      child: Column(
        children: [
          AppButton(
            onTap: () {
              Navigator.pushReplacementNamed(context, '/bottom-avbar');
            },
            text: 'Masuk',
            height: 45,
            fontWeight: FontWeight.w700,
          ),
          const SizedBox(height: AppSizes.padding),
          RichText(
            text: TextSpan(
              children: [
                const TextSpan(
                  text: 'Belum Punya Akun, ',
                  style: TextStyle(
                    color: AppColors.font,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(
                  text: 'Daftar Sekarang',
                  style: const TextStyle(
                    color: AppColors.font,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushReplacementNamed(context, '/register');
                    },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
