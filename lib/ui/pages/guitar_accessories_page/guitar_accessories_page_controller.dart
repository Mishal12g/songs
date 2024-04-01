import 'package:get/get.dart';
import 'package:songs/models/accessories.dart';

class GuitarsAccessoriesPageController extends GetxController {
  List<Accessory> _accessories = [];
  List<Accessory> get accessories => _accessories;

  addAccessories(Accessory accessory) {
    _accessories.add(accessory);
    update();
  }

  editAccessory(Accessory accessory) {
    _accessories.add(accessory);
    update();
  }
}
