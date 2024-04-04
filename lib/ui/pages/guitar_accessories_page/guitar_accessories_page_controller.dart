import 'package:get/get.dart';
import 'package:songs/models/accessories.dart';
import 'package:songs/services/accessory_store.dart';

class GuitarsAccessoriesPageController extends GetxController {
  final AccessoryStore _store = AccessoryStore();
  List<Accessory> get accessories => _store.accessories;

  addAccessories(Accessory accessory) {
    _store.add(accessory);
    update();
  }

  editAccessory(Accessory accessory) {
    _store.add(accessory);
    update();
  }
}
