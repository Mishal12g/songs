import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:songs/ui/pages/onboarding_page/onboarding_page.dart';
import 'package:songs/ui/pages/splash_page/splash_page.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => const SplashPage(),
        "/onboardingPage": (context) => const OnboardingPage(),
      },
    );
  }
}
