import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:songs/resources/app_colors.dart';
import 'package:songs/resources/resources.dart';
import 'package:songs/ui/companents/button_widget.dart';
import 'package:songs/ui/companents/pop_up_delete_or_edit_widget.dart';
import 'package:songs/ui/pages/recordings_page/records_page_controller.dart';

class RecordingsPage extends StatelessWidget {
  const RecordingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final RecordsPageController c = Get.put(RecordsPageController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Звукозаписи"),
      ),
      body: GetBuilder<RecordsPageController>(
        builder: (controller) => Stack(
          children: [
            c.audioList.isEmpty
                ? const _EmptyStateWidget()
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ListView.builder(
                      itemCount: c.audioList.length,
                      itemBuilder: (context, index) {
                        final record = c.audioList[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: _AudioTileWidget(
                            index: index,
                            name: record.name,
                            onTap: () {
                              if (c.player.state == PlayerState.playing) {
                                if (index != c.playIndex && c.isPlay) {
                                  c.setIsPlay(c.playIndex, false);
                                  c.stopAudio();
                                } else {
                                  c.setIsPlay(index, false);
                                  c.pauseAudio();
                                }
                              } else if (c.player.state == PlayerState.paused) {
                                if (index != c.playIndex && c.isPlay) {
                                  c.setIsPlay(c.playIndex, false);
                                  c.stopAudio();
                                } else {
                                  c.setIsPlay(index, true);
                                  c.resumeAudio();
                                }
                              } else if (c.player.state ==
                                      PlayerState.completed ||
                                  c.player.state == PlayerState.stopped) {
                                c.playIndex = index;
                                c.setIsPlay(index, true);
                                c.playAudio(index);
                              }
                            },
                          ),
                        );
                      },
                    ),
                  ),
            Positioned(
              bottom: 12,
              right: 17,
              left: 17,
              child: Center(
                child: ButtonWidget(
                  height: 48,
                  width: double.infinity,
                  color: AppColors.yellow,
                  radius: 24,
                  colorText: Colors.black,
                  text: "Записать",
                  onTap: () {
                    Get.toNamed("/RecordingPage");
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AudioTileWidget extends StatefulWidget {
  final String name;
  final int index;
  final Function onTap;

  const _AudioTileWidget({
    required this.name,
    required this.onTap,
    required this.index,
  });

  @override
  State<_AudioTileWidget> createState() => _AudioTileWidgetState();
}

class _AudioTileWidgetState extends State<_AudioTileWidget> {
  bool isPlay = false;

  @override
  Widget build(BuildContext context) {
    RecordsPageController c = Get.find<RecordsPageController>();
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            color: AppColors.action,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.name,
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 12),
              _RowAudioWidget(c: c, widget: widget),
            ],
          ),
        ),
        Positioned(
          right: -10,
          top: -5,
          child: PopUpDeleteOrEditWidget(
            edit: () {},
            delete: () {},
          ),
        )
      ],
    );
  }
}

class _RowAudioWidget extends StatelessWidget {
  const _RowAudioWidget({
    required this.c,
    required this.widget,
  });

  final RecordsPageController c;
  final _AudioTileWidget widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 40,
          child: Text(
            formatTime(
              Duration(seconds: c.audioList[widget.index].duration) -
                  Duration(seconds: c.audioList[widget.index].position),
            ),
          ),
        ),
        Expanded(
          child: Slider(
            min: 0,
            max: Duration(seconds: c.audioList[widget.index].duration)
                .inSeconds
                .toDouble(),
            value: Duration(seconds: c.audioList[widget.index].position)
                .inSeconds
                .toDouble(),
            onChanged: c.audioList[widget.index].isPlay
                ? (value) {
                    final position = Duration(seconds: value.toInt());
                    c.seekAudio(position);
                  }
                : (value) {},
          ),
        ),
        IconButton(
          onPressed: () => widget.onTap(),
          icon: Image.asset(
            c.audioList[widget.index].isPlay
                ? AppImages.stopTwo
                : AppImages.play,
          ),
        ),
      ],
    );
  }
}

class _EmptyStateWidget extends StatelessWidget {
  const _EmptyStateWidget();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppImages.recordOne,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fitWidth,
        ),
        Positioned.fill(
          child: Column(
            children: [
              const SizedBox(height: 12),
              Text(
                "Здесь пока ещё нет звукозаписей",
                textAlign: TextAlign.center,
                style: GoogleFonts.manrope(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 71)
            ],
          ),
        ),
      ],
    );
  }
}

String formatTime(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  final hours = twoDigits(duration.inHours);
  final minutes = twoDigits(duration.inMinutes.remainder(60));
  final seconds = twoDigits(duration.inSeconds.remainder(60));

  return [
    if (duration.inHours > 0) hours,
    minutes,
    seconds,
  ].join(":");
}
