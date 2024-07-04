import 'package:flutter/material.dart';
import 'package:complainz/config/app_colors.dart';

class AppTextField extends StatefulWidget {
  final double borderRadius;
  final bool rounded;
  final bool enable;
  final String hintText;
  final double? fontSize;
  final FontWeight? fontWeight;
  final bool obscureText;
  final Widget? icon;
  final Function()? onPressed;
  final bool suffixIcon;
  final TextEditingController? controller;

  const AppTextField({
    super.key,
    this.borderRadius = 4,
    this.rounded = true,
    this.enable = true,
    required this.hintText,
    this.fontSize,
    this.fontWeight,
    this.obscureText = false,
    this.icon,
    this.onPressed,
    this.controller,
    this.suffixIcon = false,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.obscureText && !_passwordVisible,
      controller: widget.controller,
      style: TextStyle(
        fontSize: widget.fontSize ?? 16,
        fontWeight: widget.fontWeight ?? FontWeight.w400,
        color: AppColors.primaryColor,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.secondaryTextColor,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontSize: widget.fontSize ?? 14,
          fontWeight: widget.fontWeight ?? FontWeight.w400,
          color: AppColors.primaryColor,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(widget.rounded ? 4 : widget.borderRadius),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.black,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(widget.rounded ? 4 : widget.borderRadius),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.red,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(widget.rounded ? 4 : widget.borderRadius),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.red,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(widget.rounded ? 4 : widget.borderRadius),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(widget.rounded ? 4 : widget.borderRadius),
        ),
        suffixIcon: widget.suffixIcon ? _buildSuffixIcon() : null,
      ),
    );
  }

  Widget _buildSuffixIcon() {
    return IconButton(
      icon: Icon(
        _passwordVisible ? Icons.visibility : Icons.visibility_off,
      ),
      onPressed: () {
        setState(() {
          _passwordVisible = !_passwordVisible;
        });
      },
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