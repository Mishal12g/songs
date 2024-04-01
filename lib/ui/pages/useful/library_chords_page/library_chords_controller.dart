import 'package:get/get.dart';
import 'package:songs/resources/resources.dart';

class LibraryChordsController extends GetxController {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  Chords chords = Chords.c;
  String name = "Аккорды С (До)";

  final chordsC = [
    AppImages.c7,
    AppImages.c1,
    AppImages.c2,
    AppImages.c3,
    AppImages.c4,
    AppImages.c5,
    AppImages.c6,
    AppImages.c8
  ];
  final titleChordC = [
    "C",
    "Cm",
    "C7",
    "Cm7",
    "C+",
    "Cdim",
    "Cdim7",
    "Csus2",
    "Csus4",
  ];
  final nameChordC = [
    "До мажор",
    "До минор",
    "Доминантсептаккорд (мажорный септаккорд) от ноты До",
    "Минорный септаккорд от ноты До",
    "До мажор увеличенный",
    "Уменьшенный аккорд от ноты До",
    "Уменьшенный септаккорд от ноты До",
    "До мажор с большой секундой вместо терции",
    "До мажор с квартой вместо терции",
  ];

  final chordsCD = [
    AppImages.cd8,
    AppImages.cd1,
    AppImages.cd2,
    AppImages.cd3,
    AppImages.cd4,
    AppImages.cd5,
    AppImages.cd6,
    AppImages.cd7,
  ];

  final titleChordsCD = [
    "C#",
    "C#m",
    "C#7",
    "C#m7",
    "C#+",
    "C#dim",
    "C#dim7",
    "C#sus2",
    "C#sus4",
  ];
  final nameChordsCD = [
    "До-диез мажор",
    "До-диез минор",
    "Доминантсептаккорд (мажорный септаккорд) от ноты До-диез",
    "Минорный септаккорд от ноты До-диез",
    "До-диез мажор увеличенный",
    "Уменьшенный аккорд от ноты До-диез",
    "Уменьшенный септаккорд от ноты До-диез",
    "До-диез мажор с большой секундой вместо терции",
    "До-диез мажор с квартой вместо терции",
  ];

  final chordsD = [
    AppImages.d8,
    AppImages.d1,
    AppImages.d2,
    AppImages.d3,
    AppImages.d4,
    AppImages.d5,
    AppImages.d6,
    AppImages.d7,
  ];

  final titleChordsD = [
    "D",
    "Dm",
    "D7",
    "Dm7",
    "D+",
    "Ddim",
    "Ddim7",
    "Dsus2",
    "Dsus4",
  ];
  final nameChordsD = [
    "Ре мажор",
    "Ре минор",
    "Доминантсептаккорд (мажорный септаккорд) от ноты Ре",
    "Минорный септаккорд от ноты Ре",
    "Ре мажор увеличенный",
    "Уменьшенный аккорд от ноты Ре",
    "Уменьшенный септаккорд от ноты Ре",
    "Ре мажор с большой секундой вместо терции",
    "Ре мажор с квартой вместо терции",
  ];

  final chordsDD = [
    AppImages.dd8,
    AppImages.dd1,
    AppImages.dd2,
    AppImages.dd3,
    AppImages.dd4,
    AppImages.dd5,
    AppImages.dd6,
    AppImages.dd7,
  ];

  final titleChordsDD = [
    "D#",
    "D#m",
    "D#7",
    "D#m7",
    "D#+",
    "D#dim",
    "D#dim7",
    "D#sus2",
  ];
  final nameChordsDD = [
    "Ре-диез мажор",
    "Ре-диез минор",
    "Доминантсептаккорд (мажорный септаккорд) от ноты Ре-диез",
    "Минорный септаккорд от ноты Ре-диез",
    "Ре-диез мажор увеличенный",
    "Уменьшенный аккорд от ноты Ре-диез",
    "Уменьшенный септаккорд от ноты Ре-диез",
    "Ре-диез мажор с большой секундой вместо терции",
  ];

  final chordsE = [
    AppImages.e8,
    AppImages.e1,
    AppImages.e2,
    AppImages.e3,
    AppImages.e4,
    AppImages.e5,
    AppImages.e6,
    AppImages.e7,
  ];

  final titleChordsE = [
    "E",
    "Em",
    "E7",
    "Em7",
    "E+",
    "Edim",
    "Edim7",
    "Esus2",
  ];
  final nameChordsE = [
    "Ми мажор",
    "Ми минор",
    "Доминантсептаккорд (мажорный септаккорд) от ноты Ми",
    "Минорный септаккорд от ноты Ми",
    "Ми мажор увеличенный",
    "Уменьшенный аккорд от ноты Ми",
    "Уменьшенный септаккорд от ноты Ми",
    "Ми мажор с большой секундой вместо терции",
  ];

  final chordsF = [
    AppImages.f8,
    AppImages.f1,
    AppImages.f2,
    AppImages.f3,
    AppImages.f4,
    AppImages.f5,
    AppImages.f6,
    AppImages.f7,
  ];

  final titleChordsF = [
    "F",
    "Fm",
    "F7",
    "Fm7",
    "F+",
    "Fdim",
    "Fdim7",
    "Fsus2",
  ];
  final nameChordsF = [
    "Фа мажор",
    "Фа минор",
    "Доминантсептаккорд (мажорный септаккорд) от ноты Фа",
    "Минорный септаккорд от ноты Фа",
    "Фа мажор увеличенный",
    "Уменьшенный аккорд от ноты Фа",
    "Уменьшенный септаккорд от ноты Фа",
    "Фа мажор с большой секундой вместо терции",
  ];

  final chordsFD = [
    AppImages.fd8,
    AppImages.fd1,
    AppImages.fd2,
    AppImages.fd3,
    AppImages.fd4,
    AppImages.fd5,
    AppImages.fd6,
    AppImages.fd7,
  ];

  final titleChordsFD = [
    "F#",
    "F#m",
    "F#7",
    "F#m7",
    "F#+",
    "F#dim",
    "F#dim7",
    "F#sus2",
  ];
  final nameChordsFD = [
    "Фа-диез мажор",
    "Фа-диез минор",
    "Доминантсептаккорд (мажорный септаккорд) от ноты Фа-диез",
    "Минорный септаккорд от ноты Фа-диез",
    "Фа-диез мажор увеличенный",
    "Уменьшенный аккорд от ноты Фа-диез",
    "Уменьшенный септаккорд от ноты Фа-диез",
    "Фа-диез мажор с большой секундой вместо терции",
  ];

  final chordsG = [
    AppImages.g8,
    AppImages.g1,
    AppImages.g2,
    AppImages.g3,
    AppImages.g4,
    AppImages.g5,
    AppImages.g6,
    AppImages.g7,
  ];

  final titleChordsG = [
    "G",
    "Gm",
    "G7",
    "Gm7",
    "G+",
    "Gdim",
    "Gdim7",
    "Gsus2",
  ];

  final nameChordsG = [
    "Соль мажор",
    "Соль минор",
    "Доминантсептаккорд (мажорный септаккорд) от ноты Соль",
    "Минорный септаккорд от ноты Соль",
    "Соль мажор увеличенный",
    "Уменьшенный аккорд от ноты Соль",
    "Уменьшенный септаккорд от ноты Соль",
    "Соль мажор с большой секундой вместо терции",
  ];

  final chordsGD = [
    AppImages.gd8,
    AppImages.gd1,
    AppImages.gd2,
    AppImages.gd3,
    AppImages.gd4,
    AppImages.gd5,
    AppImages.gd6,
    AppImages.gd7,
  ];

  final titleChordsGD = [
    "G#",
    "G#m",
    "G#7",
    "G#m7",
    "G#+",
    "G#dim",
    "G#dim7",
    "G#sus2",
  ];

  final nameChordsGD = [
    "Соль-диез мажор",
    "Соль-диез минор",
    "Доминантсептаккорд (мажорный септаккорд) от ноты Соль-диез",
    "Минорный септаккорд от ноты Соль-диез",
    "Соль-диез мажор увеличенный",
    "Уменьшенный аккорд от ноты Соль-диез",
    "Уменьшенный септаккорд от ноты Соль-диез",
    "Соль-диез мажор с большой секундой вместо терции",
  ];

  setChords(Chords chords, String name) {
    this.chords = chords;
    this.name = name;
    _currentIndex = 0;
    update();
  }

  setIndex(int index) {
    _currentIndex = index;
    update();
  }
}

enum Chords {
  c,
  cd,
  d,
  dd,
  e,
  f,
  fd,
  g,
  gd,
}
