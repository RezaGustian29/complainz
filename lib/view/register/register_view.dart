import 'package:complainz/config/app_colors.dart';
import 'package:complainz/config/app_sizes.dart';
import 'package:complainz/widgets/app_button.dart';
import 'package:complainz/widgets/app_textfield.dart';
import 'package:complainz/widgets/app_textpassword.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool _passwordVisible = false;
  bool buttonActive = false;

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            registerText(),
            const SizedBox(height: AppSizes.padding),
            form(),
            const SizedBox(height: AppSizes.padding),
            registerButton(),
          ],
        ),
      ),
    );
  }

  Widget registerText() {
    return const Text(
      'Selamat bergabung, buat sebuah akun agar dapat komplain lebih mudah',
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
            hinText: 'Username',
          ),
          const SizedBox(
            height: AppSizes.padding / 2,
          ),
          const AppTextField(
            hinText: 'Email',
          ),
          const SizedBox(
            height: AppSizes.padding / 2,
          ),
          const AppTextField(
            hinText: 'No Handphone',
          ),
          const SizedBox(
            height: AppSizes.padding / 2,
          ),
          AppTextPassword(
            obscureText: _passwordVisible,
            hinText: 'Password',
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
          AppTextPassword(
            obscureText: _passwordVisible,
            hinText: 'Ulangi Password',
            onPressed: () {},
          ),
          /* Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              shape: BoxShape.rectangle,
              border: Border.all(
                color: Colors.black,
              ),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  height: 56,
                  child: Center(
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.primaryColor,
                            ),
                            decoration: const InputDecoration.collapsed(
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            obscureText: _passwordVisible,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: AppSizes.padding / 2,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              shape: BoxShape.rectangle,
              border: Border.all(
                color: Colors.black,
              ),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  height: 56,
                  child: Center(
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.primaryColor,
                            ),
                            decoration: const InputDecoration.collapsed(
                              hintText: 'Ulangi Password',
                              hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            obscureText: _passwordVisible,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ), */
        ],
      ),
    );
  }

  Widget registerButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding / 2),
      child: Column(
        children: [
          AppButton(
            onTap: () {},
            text: 'Daftar',
            height: 45,
            fontSize: 14,
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
          ),
        ],
      ),
    );
  }
}
