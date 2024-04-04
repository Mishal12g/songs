import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:songs/resources/app_colors.dart';
import 'package:songs/resources/resources.dart';
import 'package:songs/ui/companents/button_widget.dart';
import 'package:songs/ui/companents/show_alert.dart';
import 'package:songs/ui/companents/title_collection_widget.dart';
import 'package:songs/ui/pages/guitars_page/guitars_page_controller.dart';

class GuitarsPage extends StatelessWidget {
  const GuitarsPage({super.key});

  @override
  Widget build(BuildContext context) {
    GuitarsPageController c = Get.put(GuitarsPageController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Гитары"),
      ),
      body: GetBuilder<GuitarsPageController>(
        builder: (controller) => Stack(
          children: [
            c.guitars.isEmpty
                ? const _EmptyStateWidget()
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ListView.builder(
                      itemCount: c.guitars.length,
                      itemBuilder: (BuildContext context, int index) {
                        final guitar = c.guitars[index];

                        return Column(
                          children: [
                            TileCollectionWidget(
                              typeGuitar: guitar.typeGuitar,
                              markGuitar: guitar.markGuitar,
                              modelGuitar: guitar.modelGuitar,
                              comment: guitar.comment.isNotEmpty
                                  ? guitar.comment
                                  : "Комментарий нет",
                              deleteOnTap: () async {
                                await showAlert(
                                  context,
                                  () {
                                    c.deleteGuitar(guitar.id);
                                    Get.back();
                                  },
                                  title: 'Удалить?',
                                  content: 'Вы точно хотите удалить гитару?',
                                );
                              },
                              editOnTap: () {
                                Get.toNamed("/GuitarEditFormPage",
                                    arguments: guitar);
                              },
                            ),
                            index == c.guitars.last
                                ? const SizedBox(height: 70)
                                : const SizedBox(),
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
                  text: "Добавить гитару",
                  rightWidget: const Icon(Icons.add),
                  onTap: () {
                    Get.toNamed("/GuitarFormPage");
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
          AppImages.background,
          width: double.infinity,
          fit: BoxFit.fitWidth,
        ),
        Positioned.fill(
          child: Column(
            children: [
              const SizedBox(height: 12),
              Text(
                "Коллекция гитар пока пуста",
                textAlign: TextAlign.center,
                style: GoogleFonts.manrope(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: Image.asset(
                  AppImages.guitar,
                  fit: BoxFit.fitWidth,
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
