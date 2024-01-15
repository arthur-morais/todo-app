import 'package:flutter/material.dart';
import 'package:todo_app/constants/text_styles.dart';
import 'package:todo_app/constants/widgets/custom_text_form_field.dart';

import '../../constants/colors.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text(
          'todo',
          style: AppTextStyles.big34w600.apply(color: AppColors.black),
        ),
        leadingWidth: double.maxFinite,
      ),
      body: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Image.asset('assets/images/blue_vector_background.png')],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Image.asset('assets/images/register_image.png')],
          ),
          Column(
            children: [
              Text(
                'create a new account',
                style: AppTextStyles.medium26w700,
              ),
              Form(
                  child: Column(
                children: [
                  CustomTextFormField(),
                  CustomTextFormField(),
                ],
              )),
            ],
          ),
        ],
      ),
    );
  }
}
