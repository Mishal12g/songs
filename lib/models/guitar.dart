import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
part 'guitar.g.dart';

@HiveType(typeId: 2)
class Guitar {
  @HiveField(1)
  final String typeGuitar;
  @HiveField(2)
  final String markGuitar;
  @HiveField(3)
  final String modelGuitar;
  @HiveField(4)
  final String comment;
  @HiveField(5)
  final String id = const Uuid().v4();

  Guitar(
      {required this.typeGuitar,
      required this.markGuitar,
      required this.modelGuitar,
      required this.comment});
}
