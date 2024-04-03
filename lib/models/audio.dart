import 'package:songs/models/song.dart';

class Audio {
  final String name;
  final String audioPath;
  final Song? song;

  Audio({
    required this.name,
    required this.audioPath,
    required this.song,
  });
}
