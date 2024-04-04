import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:songs/models/accessories.dart';
import 'package:songs/models/audio.dart';
import 'package:songs/models/guitar.dart';
import 'package:songs/models/song.dart';
import 'package:songs/resources/app_colors.dart';
import 'package:songs/resources/resources.dart';
import 'package:songs/services/store/onboarding_store_service.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    setHive().then((value) => _homePage());
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

  void _homePage() {
    if (OnboardingStoreService.isHiddenOnboarding()) {
      Navigator.of(context).pushReplacementNamed("/tabbarPage");
    } else {
      Navigator.of(context).pushReplacementNamed("/onboardingPage");
    }
  }

  Future<void> setHive() async {
    await Hive.initFlutter((await getApplicationDocumentsDirectory()).path);

    Hive
      ..registerAdapter(AccessoryAdapter())
      ..registerAdapter(AudioAdapter())
      ..registerAdapter(SongAdapter())
      ..registerAdapter(GuitarAdapter());

    await Hive.openBox<List>("Accessory");
    await Hive.openBox<List>("Audio");
    await Hive.openBox<List>("Song");
    await Hive.openBox<List>("Guitar");
    await Hive.openBox<bool>("Onboarding");
  }
}
