import 'package:hive/hive.dart';
import 'package:songs/models/accessories.dart';
import 'package:songs/models/guitar.dart';
import 'package:uuid/uuid.dart';
part 'song.g.dart';

@HiveType(typeId: 3)
class Song {
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String text;
  @HiveField(3)
  final String executor;
  @HiveField(4)
  final String? comment;
  @HiveField(5)
  final Guitar? guitar;
  @HiveField(6)
  final Accessory? accessory;
  @HiveField(7)
  final String id = const Uuid().v4();

  Song({
    required this.name,
    required this.text,
    required this.comment,
    required this.executor,
    this.guitar,
    this.accessory,
  });
}
