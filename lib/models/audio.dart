import 'package:songs/models/song.dart';

class Audio {
  final String name;
  final String audioPath;
  final Song? song;
  int duration;
  int position;
  bool isPlay;

  Audio({
    required this.duration,
    required this.position,
    required this.name,
    required this.audioPath,
    required this.song,
    required this.isPlay,
  });
}
