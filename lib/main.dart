import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:songs/resources/app_colors.dart';
import 'package:songs/ui/pages/guitars_page/guitar_form_page/guitar_edit_form_page.dart';
import 'package:songs/ui/pages/guitars_page/guitar_form_page/guitar_form_page.dart';
import 'package:songs/ui/pages/onboarding_page/onboarding_page.dart';
import 'package:songs/ui/pages/splash_page/splash_page.dart';
import 'package:songs/ui/pages/tabbar_page/tabbar_page.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: AppBarTheme(
            iconTheme: const IconThemeData(color: Colors.white),
            color: AppColors.background,
            titleTextStyle: GoogleFonts.manrope(
                fontSize: 19,
                fontWeight: FontWeight.w700,
                color: Colors.white)),
        textTheme: TextTheme(
          titleLarge: GoogleFonts.manrope(
            color: Colors.white,
            fontSize: 19,
            fontWeight: FontWeight.w700,
          ),
          bodyMedium: GoogleFonts.manrope(
            color: const Color.fromRGBO(247, 247, 251, 1),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const SplashPage(),
        "/onboardingPage": (context) => const OnboardingPage(),
        "/tabbarPage": (context) => const TabbarPage(),
        "/GuitarFormPage": (context) => const GuitarFormPage(),
        "/GuitarEditFormPage": (context) => const GuitarEditFormPage(),
      },
    );
  }
}
