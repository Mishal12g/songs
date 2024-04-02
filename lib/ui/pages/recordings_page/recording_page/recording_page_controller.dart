import 'package:get/get.dart';

class RecordingPageController extends GetxController {
  bool _isPlay = false;
  bool get isPlay => _isPlay;

  playRecording() {
    _isPlay = true;
    update();
  }

  stopRecording() {
    _isPlay = false;
    update();
  }
}
