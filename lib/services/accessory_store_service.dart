import 'package:hive/hive.dart';
import 'package:songs/models/accessories.dart';

class AccessoryStoreService {
  //Privates properties
  late Box<List> _box;
  List<Accessory> _accessories = [];

  //Getters
  List<Accessory> get accessories => _accessories;

  AccessoryStoreService() {
    loadData();
  }

//Public methods
  loadData() async {
    _box = Hive.box<List>("Accessory");
    _accessories =
        _box.get("accessories")?.map((e) => e as Accessory).toList() ?? [];
  }

  add(Accessory accessory) {
    _accessories.add(accessory);
    _putAccessories();
  }

  delete(String id) {
    final index = _accessories.indexWhere((element) => element.id == id);
    _accessories.removeAt(index);
    _putAccessories();
  }

  edit(Accessory accessory, String id) {
    final index = _accessories.indexWhere((element) => element.id == id);
    _accessories[index] = accessory;
    _putAccessories();
  }

//Privates methods
  _putAccessories() {
    _box.put("accessories", _accessories);
  }
}
