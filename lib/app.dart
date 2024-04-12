import 'package:flutter/material.dart';
import 'package:todo_app2/pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {'/': (context) => TodoPage()},
      theme: ThemeData(useMaterial3: false, primarySwatch: Colors.blueGrey),
    );
  }
}
