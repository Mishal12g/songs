import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:record/record.dart';

class RecordingPageController extends GetxController {
  late Record audioRecord;
  late AudioPlayer audioPlayer;

  bool _isRecording = false;
  bool get isRecording => _isRecording;

  String audioPath = "";

  RecordingPageController() {
    audioPlayer = AudioPlayer();
    audioRecord = Record();

    audioPlayer.onPlayerComplete.listen((event) {
      update();
    });
  }

  startRecording() async {
    try {
      if (await audioRecord.hasPermission()) {
        await audioRecord.start();

        _isRecording = true;
        update();
      }
    } catch (e) {
      print("ОШИБКА СТАРТА $e");
    }
  }

  stopRecording() async {
    try {
      String? path = await audioRecord.stop();
      _isRecording = false;
      audioPath = path!;
      update();
    } catch (e) {
      print("ОШИБКА СТОПА $e");
    }
  }

  stopAudio() async {
    try {
      if (await audioRecord.hasPermission()) {
        await audioPlayer.stop();

        update();
      }
    } catch (e) {
      print("ОШИБКА СТАРТА $e");
    }
  }

  pauseAudio() async {
    try {
      if (await audioRecord.hasPermission()) {
        await audioPlayer.pause();

        update();
      }
    } catch (e) {
      print("ОШИБКА СТАРТА $e");
    }
  }

  resumeAudio() async {
    try {
      if (await audioRecord.hasPermission()) {
        await audioPlayer.resume();

        update();
      }
    } catch (e) {
      print("ОШИБКА СТАРТА $e");
    }
  }

  playRecording() async {
    try {
      Source urlSource = UrlSource(audioPath);
      await audioPlayer.play(urlSource);
      update();
    } catch (e) {
      print("Ошибка запуска $e");
    }
  }

  PlayerState isPlay() {
    return audioPlayer.state;
  }
}
