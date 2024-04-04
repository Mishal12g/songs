import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:songs/models/song.dart';
import 'package:songs/ui/pages/recordings_page/recording_page/recording_page_controller.dart';

class RecordingFormPageController extends GetxController {
  List<Song> songs = [
    Song(name: "name", text: "text", comment: "comment", executor: "executor")
  ];

  final TextEditingController nameController = TextEditingController();

  late AudioPlayer _player;
  AudioPlayer get player => _player;
  late String nameAudioFromPath;
  late Duration savedDuration;

  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  bool _isPlay = false;
  bool get isPlay => _isPlay;

  Song? song;

  RecordingFormPageController() {
    _player = AudioPlayer();

    _player.onDurationChanged.listen((event) {
      duration = event;
      update();
    });

    _player.onPositionChanged.listen((event) {
      position = event;
      update();
    });

    _player.onPlayerStateChanged.listen(
      (event) {
        if (event == PlayerState.completed) {
          setIsPlay(false);
        }
      },
    );
  }

  loadData() {
    final c = Get.find<RecordingPageController>();
    nameAudioFromPath = c.nameAudioFromPath;
    savedDuration = c.resDuraction;

    update();
  }

  clearTextField() {
    nameController.clear();
  }

  playAudio() async {
    final dir = await getApplicationDocumentsDirectory();
    final tmpDir = dir.path.replaceAll("Documents", "tmp/");
    final path = "$tmpDir$nameAudioFromPath";

    print(path);
    await _player.play(DeviceFileSource(path));
    _isPlay = true;
    update();
  }

  seekAudio(Duration duration) async {
    await _player.seek(duration);
  }

  stopAudio() async {
    await _player.stop();
    _isPlay = false;
    update();
  }

  pauseAudio() async {
    await _player.pause();
  }

  resumeAudio() async {
    await _player.resume();
  }

  setIsPlay(bool isPlay) {
    _isPlay = isPlay;
  }
}
