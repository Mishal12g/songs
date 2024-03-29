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
      body: Stack(
        children: [
          c.guitars.isEmpty
              ? const _EmptyStateWidget()
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ListView(
                    children: [
                      TileCollectionWidget(
                        typeGuitar: "Электроакустическая гитара",
                        markGuitar: "Crafter",
                        modelGuitar: "ML G-1000CE",
                        comment:
                            "Корпус Гранд Аудиториум разработан американской компанией Taylor в 1994. Форма гитары сочетает в себе изящный профиль Аудиториума с большим объёмом Дредноута, с целью стать идеальной универсальной акустической гитарой. Абсолютно универсальная гитара, на которой можно играть как перебором (фингерстайлом), так и медиатором.",
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
                          print("edit");
                        },
                      ),
                      const SizedBox(height: 70)
                    ],
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
