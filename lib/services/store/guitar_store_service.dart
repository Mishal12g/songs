import 'package:hive/hive.dart';
import 'package:songs/models/guitar.dart';

class GuitarStoreService {
  //Privates properties
  late Box<List> _box;
  List<Guitar> _guitars = [];

  //Getters
  List<Guitar> get guitars => _guitars;

  GuitarStoreService() {
    loadData();
  }

//Public methods
  loadData() async {
    _box = Hive.box<List>("Guitar");
    _guitars = _box.get("guitars")?.map((e) => e as Guitar).toList() ?? [];
  }

  add(Guitar guitars) {
    _guitars.add(guitars);
    _putGuitars();
  }

  delete(String id) {
    final index = _guitars.indexWhere((element) => element.id == id);
    _guitars.removeAt(index);
    _putGuitars();
  }

  edit(Guitar guitars, String id) {
    final index = _guitars.indexWhere((element) => element.id == id);
    _guitars[index] = guitars;
    _putGuitars();
  }

//Privates methods
  _putGuitars() {
    _box.put("guitars", _guitars);
  }
}
