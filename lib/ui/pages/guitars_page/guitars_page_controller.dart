import 'package:get/get.dart';
import 'package:songs/models/guitar.dart';
import 'package:songs/services/store/guitar_store_service.dart';

class GuitarsPageController extends GetxController {
  final GuitarStoreService _service = GuitarStoreService();
  List<Guitar> get guitars => _service.guitars;

  addGuitar(Guitar guitar) {
    _service.add(guitar);
    update();
  }

  editGuitar(Guitar guitar) {
// _guitars[index]

    update();
  }
}
