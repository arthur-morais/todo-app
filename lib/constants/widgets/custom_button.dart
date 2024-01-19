import 'package:flutter/material.dart';
import 'package:todo_app/constants/text_styles.dart';

import '../colors.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    required this.buttonText,
    required this.buttonWidth,
    required this.buttonHeight,
    this.textStyle,
  });

  final void Function()? onPressed;
  final String buttonText;
  final double buttonWidth;
  final double buttonHeight;
  final TextStyle? textStyle;

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
          color: AppColors.lightBlue,
          borderRadius: _buttonBorderRadius,
        ),
        child: InkWell(
          borderRadius: _buttonBorderRadius,
          onTap: widget.onPressed,
          child: Align(
            child: Text(
              widget.buttonText,
              textAlign: TextAlign.center,
              style: widget.textStyle ??
                  AppTextStyles.medium20w400.apply(color: AppColors.white),
            ),
          ),
        ),
      ),
    );

    // return TextButton(
    //   onPressed: () {},
    //   style: ButtonStyle(
    //     backgroundColor: MaterialStateProperty.all<Color>(AppColors.lightBlue),
    //   ),
    //   child: Container(
    //     alignment: Alignment.center,
    //     decoration: BoxDecoration(
    //       borderRadius:,
    //     ),
    //     child: Text(
    //       widget.buttonText,
    //       style: const TextStyle(
    //         color: AppColors.white,
    //         fontSize: 24,
    //         fontFamily: 'Inter',
    //       ),
    //     ),
    //   ),
    // );
  }
}
