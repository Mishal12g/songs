import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:songs/models/accessories.dart';
import 'package:songs/models/guitar.dart';
import 'package:songs/models/song.dart';
import 'package:songs/resources/resources.dart';
import 'package:songs/ui/companents/form_textfield_widget.dart';
import 'package:songs/ui/companents/two_buttons_widget.dart';
import 'package:songs/ui/pages/songs_page/song_form_page/song_form_page_controller.dart';
import 'package:songs/ui/pages/songs_page/songs_page_controller.dart';

class SongFormPage extends StatelessWidget {
  const SongFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SongFormPageController c = Get.put(SongFormPageController());

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Text("Добавить песню"),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            const SizedBox(height: 12),
            FormTextFieldWidget(
              title: "Название песни*",
              hintText: "Название",
              controller: c.nameController,
            ),
            const SizedBox(height: 12),
            FormTextFieldWidget(
                title: "Исполнитель песни*",
                hintText: "Исполнитель",
                controller: c.executorController),
            const SizedBox(height: 12),
            FormTextFieldWidget(
                title: "Текст песни*",
                hintText: "Текст песни",
                maxLines: null,
                maxHeight: 560,
                controller: c.textController),
            const SizedBox(height: 12),
            FormTextFieldWidget(
                title: "Комментарий (необязательно)",
                hintText: "Комментарий",
                maxLines: null,
                maxHeight: 190,
                controller: c.commentController),
            const SizedBox(height: 20),
            Column(
              children: [
                _PopMenuWidget(
                  isGuitar: true,
                  text: "Выбрать гитару (необязательно)",
                  c: c,
                ),
                const Divider(thickness: 0.3),
                _PopMenuWidget(
                  text: "Выбрать аксессуар (необязательно)",
                  c: c,
                  isGuitar: false,
                ),
                const Divider(thickness: 0.3),
              ],
            ),
            const SizedBox(height: 24),
            TwoButtonsWidget(
              onTapOne: () {
                Get.back();
                c.clearControllers();
              },
              onTapTwo: () {
                if (c.nameController.text.isNotEmpty &&
                    c.executorController.text.isNotEmpty &&
                    c.textController.text.isNotEmpty) {
                  final song = Song(
                    name: c.nameController.text,
                    text: c.textController.text,
                    comment: c.commentController.text,
                    executor: c.executorController.text,
                    guitar: c.guitar,
                    accessory: c.accessory,
                  );
                  Get.find<SongsPageController>().addSong(song);
                  c.clearControllers();
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

class _PopMenuWidget extends StatelessWidget {
  final String text;
  final bool isGuitar;

  const _PopMenuWidget({
    required this.c,
    required this.text,
    required this.isGuitar,
  });

  final SongFormPageController c;

  @override
  Widget build(BuildContext context) {
    return isGuitar
        ? PopupMenuButton<Guitar>(
            icon: Row(
              children: [
                Text(text),
                const SizedBox(width: 8),
                Image.asset(AppImages.chevroneBottom)
              ],
            ),
            color: const Color.fromRGBO(50, 49, 58, 1),
            onSelected: (Guitar item) {
              c.guitar = item;
            },
            itemBuilder: (BuildContext context) => c.guitars.map(
              (e) {
                return PopupMenuItem<Guitar>(
                  value: e,
                  child: SizedBox(
                    width: 110,
                    child: Text(
                      e.comment,
                      style: GoogleFonts.manrope(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ).toList(),
          )
        : PopupMenuButton<Accessory>(
            icon: Row(
              children: [
                Text(text),
                const SizedBox(width: 8),
                Image.asset(AppImages.chevroneBottom)
              ],
            ),
            color: const Color.fromRGBO(50, 49, 58, 1),
            onSelected: (Accessory item) {
              c.accessory = item;
            },
            itemBuilder: (BuildContext context) => c.accessories.map(
              (e) {
                return PopupMenuItem<Accessory>(
                  value: e,
                  child: SizedBox(
                    width: 110,
                    child: Text(
                      e.name,
                      style: GoogleFonts.manrope(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ).toList(),
          );
  }
}
