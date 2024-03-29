import 'package:get/get.dart';
import 'package:songs/models/accessories.dart';

class GuitarsAccessoriesPageController extends GetxController {
  List<Accessories> _accessories = [];
  List<Accessories> get accessories => _accessories;

  addAccessories(Accessories accessory) {
    _accessories.add(accessory);
    update();
  }

  editAccessory(Accessories accessory) {
    _accessories.add(accessory);
    update();
  }
}
