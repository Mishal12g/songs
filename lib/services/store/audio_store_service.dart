import 'package:hive/hive.dart';
import 'package:songs/models/audio.dart';

class AudioStoreService {
  //Privates properties
  late Box<List> _box;
  List<Audio> _audioList = [];

  //Getters
  List<Audio> get audioList => _audioList;

  AudioStoreService() {
    loadData();
  }

//Public methods
  loadData() async {
    _box = Hive.box<List>("Audio");
    _audioList = _box.get("audioList")?.map((e) => e as Audio).toList() ?? [];
  }

  add(Audio audio) {
    _audioList.add(audio);
    _putAccessories();
  }

  edit(Audio audio, String id) {
    final index = _audioList.indexWhere((element) => element.id == id);
    _audioList[index] = audio;
    _putAccessories();
  }

//Privates methods
  _putAccessories() {
    _box.put("audioList", _audioList);
  }
}
