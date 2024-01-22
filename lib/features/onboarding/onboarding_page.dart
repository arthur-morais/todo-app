import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/constants/routes.dart';
import 'package:todo_app/constants/text_styles.dart';

import '../../constants/widgets/custom_button.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset('assets/images/green_vector_background.png'),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                  vertical: screenHeight * 0.05,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'todo ',
                        style: AppTextStyles.big34w600
                            .apply(color: AppColors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'gives you focus, from work to play.',
                            style: AppTextStyles.big34w600
                                .apply(color: AppColors.lightBlue),
                          ),
                        ],
                      ),
                    ),
                    Image.asset('assets/images/onboarding_image.png'),
                    Column(
                      children: [
                        CustomButton(
                          buttonText: 'register',
                          isText: true,
                          buttonWidth: screenWidth * 0.65,
                          buttonHeight: screenHeight * 0.07,
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                              context,
                              NamedRoute.register,
                            );
                          },
                        ),
                        SizedBox(
                          height: screenHeight * 0.01,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'already have an account? ',
                            style: AppTextStyles.small14w400
                                .apply(color: AppColors.black70),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'login',
                                style: AppTextStyles.small14w600
                                    .apply(color: AppColors.black70),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
