import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:songs/models/accessories.dart';
import 'package:songs/models/guitar.dart';
import 'package:songs/services/accessory_store_service.dart';
import 'package:songs/services/store/guitar_store_service.dart';

class SongFormPageController extends GetxController {
  final AccessoryStoreService _accessoryStoreService = AccessoryStoreService();
  final GuitarStoreService _guitarStoreService = GuitarStoreService();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController executorController = TextEditingController();
  final TextEditingController textController = TextEditingController();
  final TextEditingController commentController = TextEditingController();

  late List<Guitar> guitars;
  late List<Accessory> accessories;

  Guitar? guitar;
  Accessory? accessory;

  SongFormPageController() {
    guitars = _guitarStoreService.guitars;
    accessories = _accessoryStoreService.accessories;
    update();
  }

  clearControllers() {
    nameController.clear();
    executorController.clear();
    textController.clear();
    commentController.clear();
    update();
  }
}
