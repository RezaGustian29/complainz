import 'package:complainz/config/app_colors.dart';
import 'package:complainz/config/app_sizes.dart';
import 'package:complainz/view_model/update_profile_view_model.dart';
import 'package:project/widgets/app_appbar.dart';
import 'package:project/widgets/app_button.dart';
import 'package:project/widgets/app_textfield.dart';
import 'package:date_format_field/date_format_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateProfileView extends StatefulWidget {
  const UpdateProfileView({super.key});

  @override
  State<UpdateProfileView> createState() => _UpdateProfileViewState();
}

class _UpdateProfileViewState extends State<UpdateProfileView> {
  bool _passwordVisible = false;
  bool buttonActive = false;

  DateTime? _date;

  String display() {
    if (_date == null) {
      return 'NONE';
    } else {
      return 'year:${_date!.year}\nmonth:${_date!.month}\nday:${_date!.day}';
    }
  }

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppbar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: AppSizes.padding / 2, horizontal: AppSizes.padding),
          child: Column(
            children: [
              const SizedBox(height: AppSizes.padding),
              pictureProfile(),
              const SizedBox(height: AppSizes.padding),
              form(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(child: updateButton()),
    );
  }

  Widget pictureProfile() {
    return Center(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 145,
                height: 145,
                decoration: const ShapeDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/images_ormawa.png"),
                    fit: BoxFit.fill,
                  ),
                  shape: OvalBorder(
                    side: BorderSide(
                      width: 5,
                      strokeAlign: BorderSide.strokeAlignOutside,
                      color: Color(0xFF636D89),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 100,
                top: 107,
                child: Container(
                  padding: const EdgeInsets.all(AppSizes.padding / 2.6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: AppColors.primaryColor,
                  ),
                  child: const Icon(
                    Icons.edit,
                    color: AppColors.secondaryTextColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.padding / 2),
          const Text(
            'John Doe',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget form() {
    return Consumer<UpdateProfileViewModel>(
      builder: (context, model, _) {
        return Column(
          children: [
            AppTextField(
              controller: model.usernameController,
              hintText: 'Name',
              rounded: false,
              borderRadius: AppSizes.radius * 1.5,
            ),
            const SizedBox(
              height: AppSizes.padding / 2,
            ),
            AppTextField(
              controller: model.phoneController,
              hintText: 'No WhatSapp',
              obscureText: _passwordVisible,
              rounded: false,
              borderRadius: AppSizes.radius * 1.5,
              onPressed: () {},
            ),
            const SizedBox(
              height: AppSizes.padding / 2,
            ),
            DateFormatField(
              controller: model.dateBirthController,
              initialDate: DateTime.now(),
              addCalendar: true,
              type: DateFormatType.type4,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    AppSizes.radius * 1.5,
                  ),
                ),
                hintStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.primaryColor,
                ),
                // border: InputBorder.none
                hintText: 'Tanggal Lahir',
              ),
              onComplete: (date) {
                setState(() {
                  _date = date;
                });
              },
            )
          ],
        );
      },
    );
  }

  Widget updateButton() {
    return Consumer<UpdateProfileViewModel>(
      builder: (context, model, _) {
        return Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.padding, vertical: AppSizes.padding),
          child: AppButton(
            onTap: () async {
              FocusScope.of(context).unfocus();
              final navigator = Navigator.of(context);

              model.updateUser(navigator, context);
            },
            text: 'Simpan',
            height: 45,
          ),
        );
      },
    );
  }
}
