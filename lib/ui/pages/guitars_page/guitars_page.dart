import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:songs/resources/app_colors.dart';
import 'package:songs/resources/resources.dart';
import 'package:songs/ui/companents/button_widget.dart';

class GuitarsPage extends StatelessWidget {
  const GuitarsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Гитары"),
      ),
      body: Stack(
        children: [
          const _EmptyStateWidget(),
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
                onTap: () {},
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
