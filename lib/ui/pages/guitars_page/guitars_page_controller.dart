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

  deleteGuitar(String id) {
    _service.delete(id);
    update();
  }

  editGuitar(Guitar guitar, String id) {
    _service.edit(guitar, id);

    update();
  }
}
