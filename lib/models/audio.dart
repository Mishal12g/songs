import 'package:songs/models/song.dart';

class Audio {
  final String name;
  final String audioPath;
  final Song? song;
  final int seconds;
  Duration duration;
  Duration position;
  bool isPlay;

  Audio({
    required this.duration,
    required this.position,
    required this.name,
    required this.audioPath,
    required this.song,
    required this.seconds,
    required this.isPlay,
  });
}
