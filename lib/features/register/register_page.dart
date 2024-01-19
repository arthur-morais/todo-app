import 'package:flutter/material.dart';
import 'package:todo_app/constants/text_styles.dart';
import 'package:todo_app/constants/validator.dart';
import 'package:todo_app/constants/widgets/custom_button.dart';
import 'package:todo_app/constants/widgets/custom_text_form_field.dart';

import '../../constants/colors.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  bool passwordVisibility = true;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

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
              const Text(
                'create a new account',
                style: AppTextStyles.medium26w700,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: screenWidth * 0.4),
                        child: CustomTextFormField(
                          controller: widget.emailController,
                          validator: Validator.validateEmail,
                          fieldLabel: 'email',
                          obscureText: false,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: screenWidth * 0.4),
                        child: CustomTextFormField(
                          controller: widget.passwordController,
                          validator: Validator.validatePassword,
                          fieldLabel: 'password',
                          obscureText: passwordVisibility,
                          suffixIcon: IconButton(
                            icon: passwordVisibility
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                passwordVisibility = !passwordVisibility;
                              });
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: screenWidth * 0.4),
                        child: CustomButton(
                          buttonText: 'register',
                          buttonWidth: screenWidth * 0.6,
                          buttonHeight: screenHeight * 0.05,
                          onPressed: () {},
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
