import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:songs/resources/app_colors.dart';
import 'package:songs/resources/resources.dart';
import 'package:songs/ui/pages/recordings_page/recording_form_page/recording_form_page_controller.dart';
import 'package:songs/ui/pages/recordings_page/recording_page/recording_page_controller.dart';
import 'package:songs/ui/pages/recordings_page/records_page.dart';

class RecordingPage extends StatefulWidget {
  const RecordingPage({super.key});

  @override
  State<RecordingPage> createState() => _RecordingPageState();
}

class _RecordingPageState extends State<RecordingPage> {
  final RecordingPageController c = Get.find<RecordingPageController>();

  @override
  void dispose() {
    c.stopRecord();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              child: !c.isRecording
                  ? const _StopStateWidget()
                  : const _PlayStateWidget(),
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}

class _PlayStateWidget extends StatelessWidget {
  const _PlayStateWidget();

  @override
  Widget build(BuildContext context) {
    final RecordingFormPageController formC =
        Get.put(RecordingFormPageController());
    final RecordingPageController c = Get.find<RecordingPageController>();
    return GetBuilder<RecordingPageController>(
      builder: (controller) => Column(
        children: [
          Image.asset(
            AppImages.soundRecording,
            width: double.infinity,
            fit: BoxFit.contain,
          ),
          Text(
            formatTime(c.duration),
            style: GoogleFonts.manrope(
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: AppColors.yellow,
            ),
          ),
          IconButton(
            color: AppColors.yellow,
            onPressed: () {
              c.stopRecord().then((value) {
                formC.loadData();
                Get.toNamed("/RecordingFormPage");
              });
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
      ),
    );
  }
}

class _StopStateWidget extends StatelessWidget {
  const _StopStateWidget();

  @override
  Widget build(BuildContext context) {
    final RecordingPageController c = Get.find<RecordingPageController>();

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
          onPressed: () {
            c.startRecord();
          },
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
