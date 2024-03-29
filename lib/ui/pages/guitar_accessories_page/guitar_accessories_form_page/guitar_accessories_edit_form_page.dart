import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:songs/models/accessories.dart';
import 'package:songs/resources/resources.dart';
import 'package:songs/ui/companents/form_textfield_widget.dart';
import 'package:songs/ui/companents/show_alert.dart';
import 'package:songs/ui/companents/two_buttons_widget.dart';
import 'package:songs/ui/pages/guitar_accessories_page/guitar_accessories_form_page/guitar_accessories_form_page_controller.dart';
import 'package:songs/ui/pages/guitar_accessories_page/guitar_accessories_page_controller.dart';

class GuitarEditAccessoriesFormPage extends StatelessWidget {
  const GuitarEditAccessoriesFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    GuitarAccessoriesFormPageController c =
        Get.put(GuitarAccessoriesFormPageController());

    final accessory = Get.arguments as Accessories;
    c.nameController.text = accessory.name;
    c.descriprionController.text = accessory.description;
    c.commentController.text = accessory.comment;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text("Изменить аксессуар"),
            const Spacer(),
            IconButton(
              onPressed: () async {
                await showAlert(
                  context,
                  () {
                    print("delete");
                    Get.back();
                  },
                  title: 'Удалить?',
                  content: 'Вы точно хотите удалить аксессуар?',
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
              controller: c.nameController,
              title: 'Название аксессуара*',
              hintText: 'Название',
            ),
            const SizedBox(height: 12),
            FormTextFieldWidget(
              controller: c.descriprionController,
              height: 187,
              maxLines: null,
              title: 'Описание*',
              hintText: 'Описание',
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
              },
              onTapTwo: () {
                if (c.nameController.text.isNotEmpty &&
                    c.descriprionController.text.isNotEmpty) {
                  final accessories = Accessories(
                    name: c.nameController.text,
                    description: c.descriprionController.text,
                    comment: c.commentController.text,
                  );
                  Get.find<GuitarsAccessoriesPageController>()
                      .editAccessory(accessories);
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
