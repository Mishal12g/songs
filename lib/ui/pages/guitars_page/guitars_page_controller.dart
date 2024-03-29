import 'package:get/get.dart';
import 'package:songs/models/guitar.dart';

class GuitarsPageController extends GetxController {
  List<Guitar> _guitars = [
    Guitar(
        typeGuitar: "typeGuitar",
        markGuitar: "markGuitar",
        modelGuitar: "modelGuitar",
        comment: "comment")
  ];
  List<Guitar> get guitars => _guitars;

  addGuitar(Guitar guitar) {
    _guitars.add(guitar);
    update();
  }
}
