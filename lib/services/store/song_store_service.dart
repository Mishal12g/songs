import 'package:hive/hive.dart';
import 'package:songs/models/song.dart';

class SongStoreService {
  //Privates properties
  late Box<List> _box;
  List<Song> _songs = [];

  //Getters
  List<Song> get songs => _songs;

  SongStoreService() {
    loadData();
  }

//Public methods
  loadData() async {
    _box = Hive.box<List>("Song");
    _songs = _box.get("songs")?.map((e) => e as Song).toList() ?? [];
  }

  add(Song song) {
    _songs.add(song);
    _putAccessories();
  }

  edit(Song song, String id) {
    final index = _songs.indexWhere((element) => element.id == id);
    _songs[index] = song;
    _putAccessories();
  }

//Privates methods
  _putAccessories() {
    _box.put("songs", _songs);
  }
}
