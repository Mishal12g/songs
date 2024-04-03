import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:songs/models/audio.dart';

class RecordsPageController extends GetxController {
  late AudioPlayer audioPlayer;

  List<Audio> audioList = [];

  RecordsPageController() {
    audioPlayer = AudioPlayer();
  }

  addAudio(Audio audio) {
    audioList.add(audio);
    update();
  }

  stopAudio() async {
    try {
      await audioPlayer.stop();

      update();
    } catch (e) {
      print("ОШИБКА СТАРТА $e");
    }
  }

  pauseAudio() async {
    try {
      await audioPlayer.pause();

      update();
    } catch (e) {
      print("ОШИБКА СТАРТА $e");
    }
  }

  resumeAudio() async {
    try {
      await audioPlayer.resume();

      update();
    } catch (e) {
      print("ОШИБКА СТАРТА $e");
    }
  }

  playRecording(int index) async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final path = dir.path.replaceAll("Documents", "tmp/");

      await audioPlayer
          .play(DeviceFileSource("$path${audioList[index].audioPath}"));
      update();
    } catch (e) {
      print("Ошибка запуска $e");
    }
  }

  PlayerState isPlay() {
    return audioPlayer.state;
  }
}
