import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
part 'accessories.g.dart';

@HiveType(typeId: 1)
class Accessory {
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final String comment;
  @HiveField(4)
  final String id = const Uuid().v4();

  Accessory({
    required this.name,
    required this.description,
    required this.comment,
  });
}
