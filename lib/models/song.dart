import 'package:songs/models/accessories.dart';
import 'package:songs/models/guitar.dart';

class Song {
  final String name;
  final String text;
  final String executor;
  final String? comment;
  final Guitar? guitar;
  final Accessory? accessory;

  Song({
    required this.name,
    required this.text,
    required this.comment,
    required this.executor,
    this.guitar,
    this.accessory,
  });
}
