import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:songs/resources/app_colors.dart';
import 'package:songs/resources/resources.dart';
import 'package:songs/ui/companents/button_widget.dart';
import 'package:songs/ui/companents/show_alert.dart';
import 'package:songs/ui/companents/title_collection_widget.dart';
import 'package:songs/ui/pages/guitar_accessories_page/guitar_accessories_form_page/guitar_accessories_form_page_controller.dart';
import 'package:songs/ui/pages/guitar_accessories_page/guitar_accessories_page_controller.dart';

class GuitarAccessoriesPage extends StatelessWidget {
  const GuitarAccessoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(GuitarAccessoriesFormPageController());
    GuitarsAccessoriesPageController c =
        Get.put(GuitarsAccessoriesPageController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Аксессуары для гитар"),
      ),
      body: GetBuilder<GuitarsAccessoriesPageController>(
        builder: (controller) => Stack(
          children: [
            c.accessories.isEmpty
                ? const _EmptyStateWidget()
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ListView.builder(
                      itemCount: c.accessories.length,
                      itemBuilder: (context, index) {
                        final accessory = c.accessories[index];

                        return Column(
                          children: [
                            TileCollectionWidget(
                              typeGuitar: accessory.description,
                              markGuitar: accessory.name,
                              comment: accessory.comment.isEmpty
                                  ? "Комментарий нет"
                                  : accessory.comment,
                              deleteOnTap: () async {
                                await showAlert(
                                  context,
                                  () {
                                    print("delete");
                                    Get.back();
                                  },
                                  title: 'Удалить?',
                                  content: 'Вы точно хотите удалить гитару?',
                                );
                              },
                              editOnTap: () {
                                Get.toNamed("/GuitarEditAccessoriesFormPage",
                                    arguments: accessory);
                              },
                              modelGuitar: '',
                            ),
                            index == c.accessories.length - 1
                                ? const SizedBox(height: 70)
                                : const SizedBox()
                          ],
                        );
                      },
                    ),
                  ),
            Positioned(
              bottom: 12,
              right: 17,
              left: 17,
              child: Center(
                child: ButtonWidget(
                  width: double.infinity,
                  color: AppColors.yellow,
                  radius: 24,
                  colorText: Colors.black,
                  text: "Добавить аксессуар",
                  rightWidget: const Icon(Icons.add),
                  onTap: () {
                    Get.toNamed("/GuitarAccessoriesFormPage");
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyStateWidget extends StatelessWidget {
  const _EmptyStateWidget();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppImages.backgroundTwo,
          width: double.infinity,
          fit: BoxFit.fitWidth,
        ),
        Positioned.fill(
          child: Column(
            children: [
              const SizedBox(height: 12),
              Text(
                "Пока нет добавленных аксессуаров",
                textAlign: TextAlign.center,
                style: GoogleFonts.manrope(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: Image.asset(
                  AppImages.guitarAccessorie,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              const SizedBox(height: 71)
            ],
          ),
        ),
      ],
    );
  }
}
