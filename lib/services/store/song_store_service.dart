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
    _putSongs();
  }

  delete(String id) {
    final index = _songs.indexWhere((element) => element.id == id);
    _songs.removeAt(index);
    _putSongs();
  }

  edit(Song song, String id) {
    final index = _songs.indexWhere((element) => element.id == id);
    _songs[index] = song;
    _putSongs();
  }

//Privates methods
  _putSongs() {
    _box.put("songs", _songs);
  }
}
