import 'package:flutter/material.dart';
import 'package:todo_app/constants/routes.dart';
import 'package:todo_app/features/onboarding/onboarding_page.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: NamedRoute.onboarding, 
      routes: {
        NamedRoute.onboarding:(context) => const OnboardingPage(),
      },
    );
  }
}
