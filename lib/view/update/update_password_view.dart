import 'package:complainz/config/app_colors.dart';
import 'package:complainz/config/app_sizes.dart';
import 'package:complainz/widgets/app_appbar.dart';
import 'package:complainz/widgets/app_button.dart';
import 'package:complainz/widgets/app_textfield.dart';
import 'package:flutter/material.dart';

class UpdatePasswordView extends StatefulWidget {
  const UpdatePasswordView({super.key});

  @override
  State<UpdatePasswordView> createState() => _UpdatePasswordViewState();
}

class _UpdatePasswordViewState extends State<UpdatePasswordView> {
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
      appBar: const AppAppbar(
        title: 'Ganti Password',
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: AppSizes.padding, horizontal: AppSizes.padding),
          child: Column(
            children: [
              //const AppBackButton(text: 'Ganti Password'),
              const SizedBox(height: AppSizes.padding),
              form(),
              const Spacer(),
              updateButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget form() {
    return Column(
      children: [
        AppTextField(
          hintText: 'Password',
          obscureText: _passwordVisible,
          rounded: false,
          borderRadius: AppSizes.radius * 1.5,
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
        AppTextField(
          hintText: 'Ulangi Password',
          obscureText: _passwordVisible,
          rounded: false,
          borderRadius: AppSizes.radius * 1.5,
          onPressed: () {},
        ),
      ],
    );
  }

  Widget updateButton() {
    return AppButton(
      onTap: () {},
      text: 'Simpan',
      titleStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: AppColors.secondaryTextColor,
      ),
      height: 45,
    );
  }
}
