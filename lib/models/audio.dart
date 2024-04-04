import 'package:hive/hive.dart';
import 'package:songs/models/song.dart';
import 'package:uuid/uuid.dart';
part 'audio.g.dart';

@HiveType(typeId: 4)
class Audio {
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String audioPath;
  @HiveField(3)
  final Song? song;
  @HiveField(4)
  int duration;
  @HiveField(5)
  int position;
  @HiveField(6)
  bool isPlay;
  @HiveField(7)
  final String id = const Uuid().v4();

  Audio({
    required this.duration,
    required this.position,
    required this.name,
    required this.audioPath,
    required this.song,
    required this.isPlay,
  });
}
