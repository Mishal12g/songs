import 'dart:typed_data';
import 'package:songs/models/song.dart';

class Audio {
  final String name;
  final Uint8List audio;
  final Song? song;

  Audio({
    required this.name,
    required this.audio,
    required this.song,
  });
}
