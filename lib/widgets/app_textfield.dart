import 'package:complainz/config/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final double borderRadius;
  final bool rounded;
  final bool enable;
  final String hinText;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextEditingController? controller;
  const AppTextField({
    super.key,
    this.borderRadius = 4,
    this.rounded = true,
    this.enable = true,
    required this.hinText,
    this.fontSize,
    this.fontWeight,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(rounded ? 4 : borderRadius),
        shape: BoxShape.rectangle,
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: Center(
        child: TextFormField(
          controller: controller,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppColors.primaryColor,
          ),
          decoration: InputDecoration.collapsed(
            hintText: hinText,
            hintStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}


/* Container(
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
                  hintText: 'Username/Email',
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
          AppTextPassword(
            hinText: 'Password',
            obscureText: _passwordVisible,
            icon: Icon(
              _passwordVisible ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          ), */



/* Container(
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
                  hintText: 'Username/Email',
                  hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
          ), */


/* Container(
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
          ), */