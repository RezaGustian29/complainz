import 'package:complainz/config/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextPassword extends StatelessWidget {
  final double borderRadius;
  final bool rounded;
  final bool enable;
  final String hinText;
  final double? fontSize;
  final FontWeight? fontWeight;
  final bool obscureText;
  final Widget icon;
  final Function() onPressed;
  final TextEditingController? controller;
  const AppTextPassword({
    super.key,
    this.borderRadius = 4,
    this.rounded = true,
    this.enable = true,
    required this.hinText,
    this.fontSize,
    this.fontWeight,
    this.obscureText = true,
    required this.icon,
    required this.onPressed,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(rounded ? 4 : borderRadius),
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
                      obscureText: obscureText,
                    ),
                  ),
                  IconButton(icon: icon, onPressed: onPressed),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
                                ? Icons.visibility_off
                                : Icons.visibility,
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
 */