import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GuitarFormPageController extends GetxController {
  final TextEditingController typeGuitarController = TextEditingController();
  final TextEditingController markController = TextEditingController();
  final TextEditingController modelGuitarController = TextEditingController();
  final TextEditingController commentController = TextEditingController();

  clearTextFields() {
    typeGuitarController.text = "";
    markController.text = "";
    modelGuitarController.text = "";
    commentController.text = "";
  }
}
