import 'package:flutter/material.dart';
import 'package:todo_app/constants/routes.dart';
import 'package:todo_app/constants/text_styles.dart';
import 'package:todo_app/constants/validator.dart';
import 'package:todo_app/constants/widgets/custom_button.dart';
import 'package:todo_app/constants/widgets/custom_text_form_field.dart';

import '../../constants/colors.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _passwordVisibility = false;

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final leftPadding = EdgeInsets.only(right: screenWidth * 0.4);

    return Scaffold(
      appBar: AppBar(
        leading: Text(
          'todo',
          style: AppTextStyles.big34w600.apply(color: AppColors.black),
        ),
        leadingWidth: double.maxFinite,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset('assets/images/blue_vector_background.png')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Image.asset('assets/images/register_image.png')],
            ),
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.025),
              child: Column(
                children: [
                  Padding(
                    padding: leftPadding,
                    child: const Text(
                      'create a new account',
                      style: AppTextStyles.medium26w700,
                    ),
                  ),
                  Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: leftPadding,
                            child: CustomTextFormField(
                              controller: _emailController,
                              validator: Validator.validateEmail,
                              fieldLabel: 'email',
                              obscureText: true,
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.025,
                          ),
                          Padding(
                            padding: leftPadding,
                            child: CustomTextFormField(
                              controller: _passwordController,
                              validator: Validator.validatePassword,
                              fieldLabel: 'password',
                              obscureText: _passwordVisibility,
                              suffixIcon: IconButton(
                                icon: _passwordVisibility
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisibility = !_passwordVisibility;
                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.04,
                          ),
                          Padding(
                            padding: leftPadding,
                            child: CustomButton(
                              isText: true,
                              buttonText: 'register',
                              buttonWidth: screenWidth * 0.6,
                              buttonHeight: screenHeight * 0.06,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.pushReplacementNamed(
                                    context,
                                    NamedRoute.onboarding,
                                  );
                                } else {
                                  print('erro ao logar');
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.015,
                          ),
                          Padding(
                            padding: leftPadding,
                            child: CustomButton(
                              isText: false,
                              buttonImage: 'assets/images/google_logo.png',
                              buttonWidth: screenWidth * 0.6,
                              buttonHeight: screenHeight * 0.06,
                              buttonColor: AppColors.white,
                              buttonBorderColor: AppColors.greyTwo,
                            ),
                          )
                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
