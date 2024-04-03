import 'package:path/path.dart' as path;
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:songs/models/audio.dart';
import 'package:songs/models/song.dart';
import 'package:songs/resources/app_colors.dart';
import 'package:songs/resources/resources.dart';
import 'package:songs/ui/companents/form_textfield_widget.dart';
import 'package:songs/ui/companents/two_buttons_widget.dart';
import 'package:songs/ui/pages/recordings_page/recording_form_page/recording_form_page_controller.dart';
import 'package:songs/ui/pages/recordings_page/recording_page/recording_page_controller.dart';
import 'package:songs/ui/pages/recordings_page/records_page.dart';
import 'package:songs/ui/pages/recordings_page/records_page_controller.dart';

class RecordingFormPage extends StatelessWidget {
  const RecordingFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    final RecordingFormPageController c =
        Get.put(RecordingFormPageController());

    final recordingC = Get.find<RecordingPageController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Звукозапись"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Stack(
          children: [
            GetBuilder<RecordingPageController>(
              builder: (controller) => ListView(
                children: [
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(formatTime(const Duration(seconds: 10))),
                      const Spacer(),
                      Image.asset(
                        AppImages.soundRecordingTwo,
                      ),
                      const Spacer(),
                      GetBuilder<RecordingFormPageController>(
                        builder: (controller) => IconButton(
                          onPressed: () {},
                          icon: Image.asset(AppImages.stopTwo),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "Назовите звукозапись",
                    style: GoogleFonts.manrope(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  FormTextFieldWidget(
                    title: "Название звукозаписи*",
                    hintText: "Название",
                    controller: c.nameController,
                  ),
                  const SizedBox(height: 12),
                  _SelectSongWidget(c: c),
                  const SizedBox(height: 24),
                  TwoButtonsWidget(
                    onTapOne: () {
                      Get.back();
                    },
                    onTapTwo: () async {
                      final recordingC = Get.find<RecordingPageController>();
                      if (c.nameController.text.isNotEmpty) {
                        final audio = Audio(
                            duration: Duration.zero,
                            position: Duration.zero,
                            isPlay: false,
                            seconds: 10,
                            name: c.nameController.text,
                            audioPath: path.basename(""),
                            song: c.song);

                        Get.find<RecordsPageController>().addAudio(audio);
                        Get.back();
                        Get.back();
                      }
                    },
                  ),
                ],
              ),
            ),
            Positioned.fill(
              child: SafeArea(
                child: Column(
                  children: [
                    const Spacer(),
                    Text(
                      "Вы можете перезаписать звукозапись",
                      style: GoogleFonts.manrope(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: AppColors.yellow),
                    ),
                    IconButton(
                      color: AppColors.yellow,
                      onPressed: () {
                        Get.back();
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
                    ),
                    const SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _SelectSongWidget extends StatelessWidget {
  const _SelectSongWidget({
    super.key,
    required this.c,
  });

  final RecordingFormPageController c;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Song>(
      icon: Row(
        children: [
          const Text("Выбрать песню (необязательно)"),
          const SizedBox(width: 8),
          Image.asset(AppImages.chevroneBottom)
        ],
      ),
      color: const Color.fromRGBO(50, 49, 58, 1),
      onSelected: (Song item) {
        c.song = item;
      },
      itemBuilder: (BuildContext context) => c.songs.map(
        (e) {
          return PopupMenuItem<Song>(
            value: e,
            child: SizedBox(
              width: 110,
              child: Text(
                e.name,
                style: GoogleFonts.manrope(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
