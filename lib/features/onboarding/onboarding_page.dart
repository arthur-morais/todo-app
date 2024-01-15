import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          RichText(
            text: const TextSpan(
              text: 'todo ',
              style: TextStyle(
                fontSize: 34,
                fontFamily: 'JejuGothic',
                color: AppColors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'gives you focus, from work to play.',
                  style: TextStyle(color: AppColors.lightBlue, fontSize: 34),
                )
              ],
            ),
          ),
          Image.asset('assets/images/onboarding_image.png'),
          TextButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(AppColors.lightBlue),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: screenWidth * 0.5,
                  height: screenHeight * 0.07,
                  child: const Text(
                    'register',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 24,
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
              ],
            ),
          ),
          RichText(
            text: const TextSpan(
              text: 'already have an account?',
              children: <TextSpan>[
                TextSpan(text: 'login'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
