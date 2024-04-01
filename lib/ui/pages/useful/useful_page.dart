import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class UsefulPage extends StatelessWidget {
  const UsefulPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Полезное"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _ButtonWidget(
                width: width,
                color: const Color.fromRGBO(218, 179, 249, 1),
                title: 'Бибилиотека аккордов',
                onTap: () {
                  Get.toNamed("/LubraryChordsPage");
                },
              ),
              const SizedBox(width: 7),
              _ButtonWidget(
                width: width,
                color: const Color.fromRGBO(92, 156, 252, 1),
                title: 'Настройка гитары',
                onTap: () {
                  Get.toNamed("/SettingGuitarPage");
                },
              ),
            ],
          ),
          const SizedBox(height: 7),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _ButtonWidget(
                width: width,
                color: const Color.fromRGBO(47, 173, 150, 1),
                title: 'Уход за гитарой',
                onTap: () {},
              ),
              const SizedBox(width: 7),
              _ButtonWidget(
                width: width,
                color: const Color.fromRGBO(226, 147, 152, 1),
                title: 'Уроки игры на гитаре',
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ButtonWidget extends StatelessWidget {
  final Color color;
  final String title;
  final Function onTap;
  final double width;

  const _ButtonWidget({
    required this.width,
    required this.color,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: (width - 39) / 2,
          height: (width - 39) / 2,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                textAlign: TextAlign.center,
                title,
                style: GoogleFonts.manrope(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 2,
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () => onTap(),
            ),
          ),
        ),
      ],
    );
  }
}
