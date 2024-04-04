import 'dart:async';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:record/record.dart';
import 'package:path/path.dart' as path;

class RecordingPageController extends GetxController {
  bool _isRecording = false;
  bool get isRecording => _isRecording;

  late Record _record;
  late Timer _timer;

  Duration duration = Duration.zero;

  String nameAudioFromPath = "";
  Duration resDuraction = Duration.zero;

  RecordingPageController() {
    _record = Record();

    _record.onStateChanged().listen(
      (event) {
        if (event == RecordState.record) {
          _timer = Timer.periodic(
            const Duration(seconds: 1),
            (timer) {
              durationAction(timer.tick);
            },
          );
        } else {
          resDuraction = duration;
          duration = Duration.zero;
          _timer.cancel();
        }
      },
    );
  }

  durationAction(int tick) {
    duration = Duration(seconds: tick);
    update();
  }

  startRecord() async {
    if (isRecording) return;
    if (await _record.hasPermission()) {
      try {
        await _record.start();
        _isRecording = true;
        update();
      } catch (e) {
        print("error $e");
      }
    }
  }

  Future<void> stopRecord() async {
    if (!isRecording) return;

    try {
      final pathRecord = await _record.stop();

      if (pathRecord == null) return;

      nameAudioFromPath = path.basename(pathRecord);
      _isRecording = false;
      update();
    } catch (e) {
      print("error $e");
    }
  }
}
