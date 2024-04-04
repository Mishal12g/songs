import 'package:hive/hive.dart';
import 'package:songs/models/accessories.dart';

class AccessoryStore {
  late Box<List> box;
  List<Accessory> _accessories = [];
  List<Accessory> get accessories => _accessories;

  AccessoryStore() {
    loadData();
  }

  loadData() async {
    box = Hive.box<List>("Accessory");
    _accessories =
        box.get("accessories")?.map((e) => e as Accessory).toList() ?? [];
  }

  add(Accessory accessory) {
    _accessories.add(accessory);
    _putAccessories();
  }

  edit(Accessory accessory, String id) {
    final index = _accessories.indexWhere((element) => element.id == id);
    _accessories[index] = accessory;
    _putAccessories();
  }

  // get(Accessory accessory, String id) {
  //   final index = _accessories.indexWhere((element) => element.id == id);
  //   _accessories[index] = accessory;
  // }

  _putAccessories() {
    box.put("accessories", _accessories);
  }
}
