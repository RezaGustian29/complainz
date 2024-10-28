import 'package:complainz/config/app_colors.dart';
import 'package:complainz/config/app_sizes.dart';
import 'package:complainz/view_model/register_form_view_model.dart';
import 'package:project/widgets/app_button.dart';
import 'package:project/widgets/app_textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSizes.padding),
          child: Column(
            children: [
              registerText(),
              form(),
              const SizedBox(height: AppSizes.padding),
              registerButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget registerText() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: AppSizes.padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mulai Laporkan Keadaan Terkini Bersama Complainz',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryColor,
            ),
          ),
          SizedBox(height: AppSizes.padding / 2.5),
          Text(
            'Bergabung, dengan Complainz untuk kemudahan menyampaikan pengaduan!',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryColor,
            ),
            //textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget form() {
    return Consumer<RegisterFormViewModel>(builder: (context, model, _) {
      return Column(
        children: [
          AppTextField(
            borderRadius: AppSizes.radius * 1.5,
            rounded: false,
            controller: model.usernameController,
            hintText: 'Username',
          ),
          const SizedBox(
            height: AppSizes.padding / 1.5,
          ),
          AppTextField(
            borderRadius: AppSizes.radius * 1.5,
            rounded: false,
            controller: model.emailController,
            hintText: 'Email',
          ),
          const SizedBox(
            height: AppSizes.padding / 1.5,
          ),
          AppTextField(
            borderRadius: AppSizes.radius * 1.5,
            rounded: false,
            controller: model.phoneController,
            hintText: 'No Handphone',
          ),
          const SizedBox(
            height: AppSizes.padding / 1.5,
          ),
          AppTextField(
            borderRadius: AppSizes.radius * 1.5,
            rounded: false,
            suffixIcon: true,
            controller: model.passwordController,
            obscureText: true,
            hintText: 'Password',
          ),
          const SizedBox(
            height: AppSizes.padding / 1.5,
          ),
          AppTextField(
            borderRadius: AppSizes.radius * 1.5,
            rounded: false,
            suffixIcon: true,
            controller: model.confirmPasswordController,
            obscureText: true,
            hintText: 'Ulangi Password',
          ),
        ],
      );
    });
  }

  Widget registerButton() {
    return Consumer<RegisterFormViewModel>(builder: (context, model, _) {
      return Column(
        children: [
          AppButton(
            text: 'Daftar',
            height: 50,
            fontSize: 14,
            fontWeight: FontWeight.w700,
            onTap: () async {
              FocusScope.of(context).unfocus();

              final navigator = Navigator.of(context);
              await model.onRegister(navigator);
            },
          ),
          const SizedBox(height: AppSizes.padding),
          RichText(
            text: TextSpan(
              children: [
                const TextSpan(
                  text: 'Belum Punya Akun? ',
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
    });
  }
}
