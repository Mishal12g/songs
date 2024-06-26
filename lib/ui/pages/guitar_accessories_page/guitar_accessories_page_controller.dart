import 'package:get/get.dart';
import 'package:songs/models/accessories.dart';
import 'package:songs/services/accessory_store_service.dart';

class GuitarsAccessoriesPageController extends GetxController {
  final AccessoryStoreService _store = AccessoryStoreService();
  List<Accessory> get accessories => _store.accessories;

  addAccessories(Accessory accessory) {
    _store.add(accessory);
    update();
  }

  deleteAccessories(String id) {
    _store.delete(id);
    update();
  }

  editAccessory(Accessory accessory, String id) {
    _store.edit(accessory, id);
    update();
  }
}
