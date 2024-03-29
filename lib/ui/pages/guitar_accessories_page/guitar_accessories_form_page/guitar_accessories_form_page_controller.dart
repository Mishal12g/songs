import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GuitarAccessoriesFormPageController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriprionController = TextEditingController();
  final TextEditingController commentController = TextEditingController();

  clearTextFields() {
    nameController.text = "";
    descriprionController.text = "";
    commentController.text = "";
  }
}
