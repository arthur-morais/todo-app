import 'package:flutter/material.dart';

import '../colors.dart';
import '../text_styles.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    this.fieldLabel,
    this.validator,
    this.suffixIcon,
    this.keyboardType,
    required this.obscureText,
  });

  final TextEditingController? controller;
  final String? fieldLabel;
  final FormFieldValidator<String>? validator;
  final IconButton? suffixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final defaultBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(color: AppColors.grey),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      keyboardType: widget.keyboardType,
      obscureText: !widget.obscureText,
      validator: widget.validator,
      style: AppTextStyles.small14w400.apply(color: AppColors.black70),
      controller: widget.controller,
      decoration: InputDecoration(
        suffixIcon: widget.suffixIcon,
        filled: true,
        fillColor: AppColors.white,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        hintText: widget.fieldLabel,
        hintStyle: AppTextStyles.small14w400.apply(color: AppColors.black60),
        border: defaultBorder,
        errorBorder: defaultBorder.copyWith(
            borderSide: const BorderSide(color: AppColors.redError)),
        errorStyle: AppTextStyles.small14w400,
      ),
    );
  }
}
