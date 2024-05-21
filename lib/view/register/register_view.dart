import 'package:complainz/config/app_colors.dart';
import 'package:complainz/config/app_sizes.dart';
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
          Container(
            height: 56,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              shape: BoxShape.rectangle,
              border: Border.all(
                color: Colors.black,
              ),
            ),
            child: Center(
              child: TextFormField(
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.primaryColor,
                ),
                decoration: const InputDecoration.collapsed(
                  hintText: 'Username',
                  hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: AppSizes.padding / 2,
          ),
          Container(
            height: 56,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              shape: BoxShape.rectangle,
              border: Border.all(
                color: Colors.black,
              ),
            ),
            child: Center(
              child: TextFormField(
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.primaryColor,
                ),
                decoration: const InputDecoration.collapsed(
                  hintText: 'Email',
                  hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: AppSizes.padding / 2,
          ),
          Container(
            height: 56,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              shape: BoxShape.rectangle,
              border: Border.all(
                color: Colors.black,
              ),
            ),
            child: Center(
              child: TextFormField(
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.primaryColor,
                ),
                decoration: const InputDecoration.collapsed(
                  hintText: 'No Handphone',
                  hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
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
          ),
        ],
      ),
    );
  }

  Widget registerButton() {
    return Column(
      children: [
        SizedBox(
          width: 350,
          height: 45,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: AppColors.primaryColor,
            ),
            onPressed: () {},
            child: const Text(
              'Daftar',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
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
    );
  }
}
