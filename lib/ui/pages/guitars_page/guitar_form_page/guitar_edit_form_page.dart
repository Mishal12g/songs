import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:songs/models/guitar.dart';
import 'package:songs/resources/resources.dart';
import 'package:songs/ui/companents/form_textfield_widget.dart';
import 'package:songs/ui/companents/show_alert.dart';
import 'package:songs/ui/companents/two_buttons_widget.dart';
import 'package:songs/ui/pages/guitars_page/guitar_form_page/guitar_form_page_controller.dart';
import 'package:songs/ui/pages/guitars_page/guitars_page_controller.dart';

class GuitarEditFormPage extends StatelessWidget {
  const GuitarEditFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    GuitarFormPageController c = Get.put(GuitarFormPageController());

    final guitar = Get.arguments as Guitar;
    c.typeGuitarController.text = guitar.typeGuitar;
    c.markController.text = guitar.markGuitar;
    c.modelGuitarController.text = guitar.modelGuitar;
    c.commentController.text = guitar.comment;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text("Редактировать гитару"),
            const Spacer(),
            IconButton(
              onPressed: () async {
                await showAlert(
                  context,
                  () {
                    Get.back();
                  },
                  title: 'Удалить?',
                  content: 'Вы точно хотите удалить гитару?',
                );
              },
              icon: Image.asset(AppImages.delete),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            const SizedBox(height: 12),
            FormTextFieldWidget(
              controller: c.typeGuitarController,
              title: 'Тип гитары*',
              hintText: 'Тип',
            ),
            const SizedBox(height: 12),
            FormTextFieldWidget(
              controller: c.markController,
              title: 'Марка гитары*',
              hintText: 'Марка',
            ),
            const SizedBox(height: 12),
            FormTextFieldWidget(
              controller: c.modelGuitarController,
              title: 'Модель гитары*',
              hintText: 'Модель',
            ),
            const SizedBox(height: 12),
            FormTextFieldWidget(
              controller: c.commentController,
              height: 187,
              maxLines: null,
              title: 'Комментарий (необязательно)',
              hintText: 'Комментарий',
            ),
            const SizedBox(height: 24),
            TwoButtonsWidget(
              onTapOne: () {
                Get.back();
                c.clearTextFields();
              },
              onTapTwo: () {
                if (c.typeGuitarController.text.isNotEmpty &&
                    c.markController.text.isNotEmpty &&
                    c.modelGuitarController.text.isNotEmpty) {
                  final newGuitar = Guitar(
                    typeGuitar: c.typeGuitarController.text,
                    markGuitar: c.markController.text,
                    modelGuitar: c.modelGuitarController.text,
                    comment: c.commentController.text,
                  );

                  Get.find<GuitarsPageController>()
                      .editGuitar(newGuitar, guitar.id);
                  c.clearTextFields();
                  Get.back();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
