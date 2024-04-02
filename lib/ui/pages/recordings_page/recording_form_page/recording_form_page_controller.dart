import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:songs/models/song.dart';

class RecordingFormPageController extends GetxController {
  final TextEditingController nameController = TextEditingController();

  List<Song> songs = [
    Song(name: "name", text: "text", comment: "comment", executor: "executor")
  ];

  Song? song;
}
