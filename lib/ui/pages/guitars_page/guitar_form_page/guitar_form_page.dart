import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:songs/models/guitar.dart';
import 'package:songs/ui/companents/form_textfield_widget.dart';
import 'package:songs/ui/companents/two_buttons_widget.dart';
import 'package:songs/ui/pages/guitars_page/guitar_form_page/guitar_form_page_controller.dart';
import 'package:songs/ui/pages/guitars_page/guitars_page_controller.dart';

class GuitarFormPage extends StatelessWidget {
  const GuitarFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    GuitarFormPageController c = Get.put(GuitarFormPageController());
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Text("Добавить гитару"),
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
                  final guitar = Guitar(
                    typeGuitar: c.typeGuitarController.text,
                    markGuitar: c.markController.text,
                    modelGuitar: c.modelGuitarController.text,
                    comment: c.commentController.text,
                  );

                  Get.find<GuitarsPageController>().addGuitar(guitar);
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
