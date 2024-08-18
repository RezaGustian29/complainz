import 'package:complainz/config/app_colors.dart';
import 'package:complainz/config/app_sizes.dart';
import 'package:complainz/view_model/update_password_view_model.dart';
import 'package:project/widgets/app_appbar.dart';
import 'package:project/widgets/app_button.dart';
import 'package:project/widgets/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdatePasswordView extends StatefulWidget {
  const UpdatePasswordView({super.key});

  @override
  State<UpdatePasswordView> createState() => _UpdatePasswordViewState();
}

class _UpdatePasswordViewState extends State<UpdatePasswordView> {
  bool buttonActive = false;

  @override
  void initState() {
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
              updateButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget form() {
    return Consumer<UpdatePasswordViewModel>(
      builder: (context, model, _) {
        return Column(
          children: [
            AppTextField(
              controller: model.oldController,
              hintText: 'Old Password',
              suffixIcon: true,
              borderRadius: AppSizes.radius * 1.5,
              rounded: false,
              obscureText: true,
            ),
            const SizedBox(height: AppSizes.padding / 2),
            AppTextField(
              controller: model.newController,
              hintText: 'New Password',
              suffixIcon: true,
              borderRadius: AppSizes.radius * 1.5,
              rounded: false,
              obscureText: true,
            ),
          ],
        );
      },
    );
  }

  Widget updateButton() {
    return Consumer<UpdatePasswordViewModel>(
      builder: (context, model, _) {
        return AppButton(
          onTap: () async {
            FocusScope.of(context).unfocus();
            final navigator = Navigator.of(context);

            model.updateUserPass(navigator, context);
          },
          text: 'Simpan',
          titleStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: AppColors.secondaryTextColor,
          ),
          height: 45,
        );
      },
    );
  }
}
