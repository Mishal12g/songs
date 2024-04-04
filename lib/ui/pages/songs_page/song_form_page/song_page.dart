import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:songs/models/song.dart';
import 'package:songs/resources/resources.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    final song = Get.arguments as Song;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
                onPressed: () {
                  Get.toNamed("/SongEditFormPage", arguments: song);
                },
                icon: Image.asset(AppImages.editTwo)),
            IconButton(onPressed: () {}, icon: Image.asset(AppImages.trashTwo)),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            const SizedBox(height: 4),
            Center(
              child: Text(
                song.name,
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Center(
              child: Text(
                song.executor,
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: const Color.fromRGBO(173, 173, 173, 1),
                ),
              ),
            ),
            const SizedBox(height: 16),
            _AccessoryAndGuitarWidget(song: song),
            const SizedBox(height: 16),
            Text(song.text),
          ],
        ),
      ),
    );
  }
}

class _AccessoryAndGuitarWidget extends StatelessWidget {
  const _AccessoryAndGuitarWidget({
    required this.song,
  });

  final Song song;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "Гитара:",
              style: GoogleFonts.manrope(
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
            const SizedBox(width: 5),
            Text(
              song.guitar?.modelGuitar ?? "нет",
              style: GoogleFonts.manrope(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: const Color.fromRGBO(173, 173, 173, 1),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              "Аксессуар:",
              style: GoogleFonts.manrope(
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
            const SizedBox(width: 5),
            Text(
              song.accessory?.name ?? "нет",
              style: GoogleFonts.manrope(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: const Color.fromRGBO(173, 173, 173, 1),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
