import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:songs/resources/app_colors.dart';
import 'package:songs/resources/resources.dart';
import 'package:songs/ui/pages/recordings_page/recording_page/recording_page_controller.dart';
import 'package:songs/ui/pages/recordings_page/records_page.dart';

class RecordingPage extends StatelessWidget {
  const RecordingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final RecordingPageController c = Get.put(RecordingPageController());
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [Text("Звукозапись")],
        ),
      ),
      body: GetBuilder<RecordingPageController>(
        builder: (RecordingPageController controller) => Column(
          children: [
            const SizedBox(height: 80),
            const _BackgroundWidget(),
            const Spacer(),
            SafeArea(
              child: !true ? _StopStateWidget(c: c) : _PlayStateWidget(c: c),
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}

class _PlayStateWidget extends StatelessWidget {
  final RecordingPageController c;

  const _PlayStateWidget({
    required this.c,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AppImages.soundRecording,
          width: double.infinity,
          fit: BoxFit.contain,
        ),
        Text(
          formatTime(const Duration(seconds: 10)),
          style: GoogleFonts.manrope(
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: AppColors.yellow),
        ),
        IconButton(
          color: AppColors.yellow,
          onPressed: () {
            Get.toNamed("/RecordingFormPage");
          },
          icon: Container(
              width: 64,
              height: 43,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.yellow,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Image.asset(AppImages.stop)),
        )
      ],
    );
  }
}

class _StopStateWidget extends StatelessWidget {
  final RecordingPageController c;

  const _StopStateWidget({
    required this.c,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Начните запись",
          style: GoogleFonts.manrope(
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: AppColors.yellow),
        ),
        IconButton(
          color: AppColors.yellow,
          onPressed: () {},
          icon: Container(
              width: 64,
              height: 43,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.action,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Image.asset(AppImages.microphone)),
        )
      ],
    );
  }
}

class _BackgroundWidget extends StatelessWidget {
  const _BackgroundWidget();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.recordTwo,
      width: double.infinity,
      fit: BoxFit.fitWidth,
    );
  }
}
