import 'package:flutter/material.dart';
import 'package:songs/resources/app_colors.dart';
import 'package:songs/resources/resources.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _homePage();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Image(image: AssetImage(AppImages.nota)),
      ),
    );
  }

  void _homePage() async {
    await Future.delayed(
      const Duration(milliseconds: 1500),
      () {
        Navigator.of(context).pushReplacementNamed("/onboardingPage");
      },
    );
  }
}
