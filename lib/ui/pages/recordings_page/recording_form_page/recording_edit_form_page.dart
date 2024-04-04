import 'package:audioplayers/audioplayers.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;
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

class RecordingEditFormPage extends StatelessWidget {
  const RecordingEditFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<RecordingFormPageController>();

    final audio = Get.arguments as Audio;
    c
      ..savedDuration = Duration(seconds: audio.duration)
      ..nameController.text = audio.name
      ..nameAudioFromPath = audio.audioPath;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Звукозапись"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Stack(
          children: [
            GetBuilder<RecordingFormPageController>(
              builder: (controller) => ListView(
                children: [
                  const SizedBox(height: 16),
                  _RowAudioWidget(
                    c: c,
                    onTap: () {
                      if (c.player.state == PlayerState.playing) {
                        c.pauseAudio();
                      } else if (c.player.state == PlayerState.paused) {
                        c.resumeAudio();
                      } else if (c.player.state == PlayerState.completed ||
                          c.player.state == PlayerState.stopped) {
                        c.playAudio();
                      }
                    },
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
                      if (c.nameController.text.isNotEmpty) {
                        final newAudio = Audio(
                            duration: c.savedDuration.inSeconds,
                            position: 0,
                            isPlay: false,
                            name: c.nameController.text,
                            audioPath: path.basename(c.nameAudioFromPath),
                            song: c.song);

                        Get.find<RecordsPageController>()
                            .editAudio(newAudio, audio.id);
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
                        Get.find<RecordingPageController>().startRecord();

                        Get.toNamed("/RecordingEditPage");
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

class _RowAudioWidget extends StatelessWidget {
  final Function onTap;
  final RecordingFormPageController c;

  const _RowAudioWidget({
    required this.c,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 40,
          child: Text(
            formatTime(
              c.isPlay ? c.duration - c.position : c.savedDuration,
            ),
          ),
        ),
        Expanded(
          child: Slider(
            min: 0,
            max: c.duration.inSeconds.toDouble(),
            value: c.position.inSeconds.toDouble(),
            onChanged: c.isPlay
                ? (value) {
                    final position = Duration(seconds: value.toInt());
                    c.seekAudio(position);
                  }
                : (value) {},
          ),
        ),
        IconButton(
          onPressed: () => onTap(),
          icon: Image.asset(
            c.isPlay ? AppImages.stopTwo : AppImages.play,
          ),
        ),
      ],
    );
  }
}

class _SelectSongWidget extends StatefulWidget {
  const _SelectSongWidget({
    required this.c,
  });

  final RecordingFormPageController c;

  @override
  State<_SelectSongWidget> createState() => _SelectSongWidgetState();
}

class _SelectSongWidgetState extends State<_SelectSongWidget> {
  @override
  void dispose() {
    widget.c.nameController.clear();
    widget.c.stopAudio();
    super.dispose();
  }

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
        widget.c.song = item;
      },
      itemBuilder: (BuildContext context) => widget.c.songs.map(
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
