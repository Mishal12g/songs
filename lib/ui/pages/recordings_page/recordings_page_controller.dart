import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:songs/models/audio.dart';

class RecordingsPageController extends GetxController {
  List<Audio> audioList = [
    Audio(name: "name", audio: Uint8List(10), song: null)
  ];
}
