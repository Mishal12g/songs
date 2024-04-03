import 'package:audioplayers/audioplayers.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:path_provider/path_provider.dart';
import 'package:songs/models/audio.dart';
import 'package:path/path.dart' as path;

class RecordsPageController extends GetxController {
  late AudioPlayer _player;
  late int playIndex;

  List<Audio> _audioList = [];
  bool _isPlay = false;

  List<Audio> get audioList => _audioList;
  bool get isPlay => _isPlay;
  AudioPlayer get player => _player;

  RecordsPageController() {
    _player = AudioPlayer();

    _player.onDurationChanged.listen((event) {
      _audioList[playIndex].duration = event;
      update();
    });

    _player.onPositionChanged.listen((event) {
      _audioList[playIndex].position = event;
      update();
    });

    _player.onPlayerStateChanged.listen(
      (event) {
        if (event == PlayerState.completed) {
          setIsPlay(playIndex, false);
        }
      },
    );
  }

  addAudio(Audio audio) {
    _audioList.add(audio);
    update();
  }

  playAudio(int index) async {
    this.playIndex = index;
    final dir = await getApplicationDocumentsDirectory();
    final tmpDir = dir.path.replaceAll("Documents", "tmp/");
    final path = "$tmpDir${audioList[index].audioPath}";
    await _player.play(DeviceFileSource(
        "/Users/mihail/Music/Music/Media.localized/Music/Михаил Озеров/Лава/Лава.mp3"));
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

  setIsPlay(int index, bool isPlay) {
    audioList[index].isPlay = isPlay;
  }
}
