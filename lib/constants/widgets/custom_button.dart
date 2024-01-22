import 'package:flutter/material.dart';
import 'package:todo_app/constants/text_styles.dart';

import '../colors.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    this.buttonText,
    required this.buttonWidth,
    required this.buttonHeight,
    this.textStyle,
    this.buttonColor,
    this.buttonBorderColor,
    this.buttonTextColor,
    this.buttonImage,
    required this.isText,
  });

  final void Function()? onPressed;
  final String? buttonText;
  final double buttonWidth;
  final double buttonHeight;
  final TextStyle? textStyle;
  final String? buttonImage;
  final Color? buttonColor;
  final Color? buttonBorderColor;
  final Color? buttonTextColor;
  final bool isText;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  final BorderRadius _buttonBorderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: _buttonBorderRadius,
      child: Ink(
        width: widget.buttonWidth,
        height: widget.buttonHeight,
        decoration: BoxDecoration(
            color: widget.buttonColor ?? AppColors.lightBlue,
            borderRadius: _buttonBorderRadius,
            border: Border.all(
                color: widget.buttonBorderColor ?? AppColors.darkBlue)),
        child: InkWell(
          borderRadius: _buttonBorderRadius,
          onTap: widget.onPressed,
          child: Align(
              child: widget.isText
                  ? Text(
                      widget.buttonText ?? 'texto',
                      textAlign: TextAlign.center,
                      style: widget.textStyle ??
                          AppTextStyles.medium20w400.apply(
                            color: widget.buttonTextColor ?? AppColors.white,
                          ),
                    )
                  : Image.asset(
                      widget.buttonImage ?? '',
                    )),
        ),
      ),
    );
  }
}
