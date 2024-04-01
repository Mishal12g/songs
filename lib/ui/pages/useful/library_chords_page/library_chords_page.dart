import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_page_view_indicator/flutter_page_view_indicator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:songs/resources/app_colors.dart';
import 'package:songs/resources/resources.dart';
import 'package:songs/ui/pages/useful/library_chords_page/library_chords_controller.dart';

class LubraryChordsPage extends StatefulWidget {
  const LubraryChordsPage({super.key});

  @override
  State<LubraryChordsPage> createState() => _LubraryChordsPageState();
}

class _LubraryChordsPageState extends State<LubraryChordsPage> {
  final c = Get.put(LibraryChordsController());

  @override
  Widget build(BuildContext context) {
    final controller = PageController(initialPage: 0);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Бибилиотека аккордов"),
      ),
      body: GetBuilder<LibraryChordsController>(
        builder: (_) => Stack(
          children: [
            Column(
              children: [
                const SizedBox(height: 170),
                SizedBox(
                  height: 300,
                  child: PageView.builder(
                    onPageChanged: (value) {
                      c.setIndex(value);
                    },
                    controller: controller,
                    itemCount: c.chordsC.length,
                    itemBuilder: (context, index) => _PageWidget(
                      chord: switch (c.chords) {
                        Chords.c => c.titleChordC[index],
                        Chords.cd => c.titleChordsCD[index],
                        Chords.d => c.titleChordsD[index],
                        Chords.dd => c.titleChordsDD[index],
                        Chords.e => c.titleChordsE[index],
                        Chords.f => c.titleChordsF[index],
                        Chords.fd => c.titleChordsFD[index],
                        Chords.g => c.titleChordsG[index],
                        Chords.gd => c.titleChordsGD[index],
                      },
                      name: switch (c.chords) {
                        Chords.c => c.nameChordC[index],
                        Chords.cd => c.nameChordsCD[index],
                        Chords.d => c.nameChordsD[index],
                        Chords.dd => c.nameChordsDD[index],
                        Chords.e => c.nameChordsE[index],
                        Chords.f => c.nameChordsF[index],
                        Chords.fd => c.nameChordsFD[index],
                        Chords.g => c.nameChordsG[index],
                        Chords.gd => c.nameChordsGD[index],
                      },
                      page: switch (c.chords) {
                        Chords.c => c.chordsC[index],
                        Chords.cd => c.chordsCD[index],
                        Chords.d => c.chordsD[index],
                        Chords.dd => c.chordsDD[index],
                        Chords.e => c.chordsE[index],
                        Chords.f => c.chordsF[index],
                        Chords.fd => c.chordsFD[index],
                        Chords.g => c.chordsG[index],
                        Chords.gd => c.chordsGD[index],
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 19),
                PageViewIndicator(
                  length: 8,
                  currentIndex: c.currentIndex,
                )
              ],
            ),
            Positioned(
              top: 16,
              left: 16,
              child: PopupMenuButton<Chords>(
                icon: Row(
                  children: [
                    Text(c.name),
                    const SizedBox(width: 8),
                    Image.asset(AppImages.chevroneBottom)
                  ],
                ),
                color: const Color.fromRGBO(50, 49, 58, 1),
                onSelected: (Chords item) {
                  switch (item) {
                    case Chords.c:
                      c.setChords(item, "Аккорды С (До)");
                      controller.jumpToPage(0);
                    case Chords.cd:
                      c.setChords(item, "Аккорды C# (До-диез)");
                      controller.jumpToPage(0);
                    case Chords.d:
                      c.setChords(item, "Аккорды D (Ре)");
                      controller.jumpToPage(0);
                    case Chords.dd:
                      c.setChords(item, "Аккорды D# (Ре-диез)");
                      controller.jumpToPage(0);
                    case Chords.e:
                      c.setChords(item, "Аккорды E (Ми)");
                      controller.jumpToPage(0);
                    case Chords.f:
                      c.setChords(item, "Аккорды F (Фа)");
                      controller.jumpToPage(0);
                    case Chords.fd:
                      c.setChords(item, "Аккорды F# (Фа-диез)");
                      controller.jumpToPage(0);
                    case Chords.g:
                      c.setChords(item, "Аккорды G (Соль)");
                      controller.jumpToPage(0);
                    case Chords.gd:
                      c.setChords(item, "Аккорды G# (Соль-диез)");
                      controller.jumpToPage(0);
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<Chords>>[
                  PopupMenuItem<Chords>(
                    value: Chords.c,
                    child: SizedBox(
                      width: 110,
                      child: Text(
                        'Аккорды С (До)',
                        style: GoogleFonts.manrope(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  PopupMenuItem<Chords>(
                    value: Chords.cd,
                    child: SizedBox(
                      width: 110,
                      child: Text(
                        'Аккорды C# (До-диез)',
                        style: GoogleFonts.manrope(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  PopupMenuItem<Chords>(
                    value: Chords.d,
                    child: SizedBox(
                      width: 110,
                      child: Text(
                        'Аккорды D (Ре)',
                        style: GoogleFonts.manrope(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  PopupMenuItem<Chords>(
                    value: Chords.dd,
                    child: SizedBox(
                      width: 110,
                      child: Text(
                        'Аккорды D# (Ре-диез)',
                        style: GoogleFonts.manrope(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  PopupMenuItem<Chords>(
                    value: Chords.e,
                    child: SizedBox(
                      width: 110,
                      child: Text(
                        'Аккорды E (Ми)',
                        style: GoogleFonts.manrope(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  PopupMenuItem<Chords>(
                    value: Chords.f,
                    child: SizedBox(
                      width: 110,
                      child: Text(
                        'Аккорды F (Фа)',
                        style: GoogleFonts.manrope(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  PopupMenuItem<Chords>(
                    value: Chords.fd,
                    child: SizedBox(
                      width: 110,
                      child: Text(
                        'Аккорды F# (Фа-диез)',
                        style: GoogleFonts.manrope(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  PopupMenuItem<Chords>(
                    value: Chords.g,
                    child: SizedBox(
                      width: 110,
                      child: Text(
                        'Аккорды G (Соль)',
                        style: GoogleFonts.manrope(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  PopupMenuItem<Chords>(
                    value: Chords.gd,
                    child: SizedBox(
                      width: 110,
                      child: Text(
                        'Аккорды G# (Соль-диез)',
                        style: GoogleFonts.manrope(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PageWidget extends StatelessWidget {
  final String page;
  final String name;
  final String chord;
  const _PageWidget({
    required this.page,
    required this.name,
    required this.chord,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          chord,
          style: GoogleFonts.manrope(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: AppColors.yellow,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          name,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.manrope(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 12),
        Image.asset(
          page,
        ),
      ],
    );
  }
}
