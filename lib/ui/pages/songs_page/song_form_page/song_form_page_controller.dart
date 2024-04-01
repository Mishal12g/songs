import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:songs/models/accessories.dart';
import 'package:songs/models/guitar.dart';

class SongFormPageController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController executorController = TextEditingController();
  final TextEditingController textController = TextEditingController();
  final TextEditingController commentController = TextEditingController();

  Guitar? guitar = null;
  Accessory? accessory = null;

  List<Guitar> guitars = [
    Guitar(typeGuitar: "1", markGuitar: "1", modelGuitar: "1", comment: "1"),
    Guitar(typeGuitar: "2", markGuitar: "2", modelGuitar: "2", comment: "2"),
    Guitar(typeGuitar: "3", markGuitar: "3", modelGuitar: "3", comment: "3"),
  ];
  List<Accessory> accessories = [
    Accessory(name: "1", description: "1", comment: "1"),
    Accessory(name: "2", description: "2", comment: "2"),
    Accessory(name: "2", description: "2", comment: "2"),
  ];

  clearControllers() {
    nameController.clear();
    executorController.clear();
    textController.clear();
    commentController.clear();
    update();
  }
}
