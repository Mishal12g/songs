import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:songs/resources/resources.dart';
import 'package:songs/services/settings_service.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Настройки"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            const SizedBox(height: 24),
            _SettingsTileWidget(
              text: "Политика конфиденциальности",
              image: AppImages.confendiality,
              onTap: () {
                SettingsService.termsAndAgreement();
              },
            ),
            const SizedBox(height: 8),
            _SettingsTileWidget(
              text: "Пользовательское соглашение",
              image: AppImages.agreement,
              onTap: () {
                SettingsService.termsAndAgreement();
              },
            ),
            const SizedBox(height: 8),
            _SettingsTileWidget(
              text: "Оценить приложение",
              image: AppImages.star,
              onTap: () async {
                await SettingsService.appReview();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingsTileWidget extends StatelessWidget {
  final String text;
  final String image;
  final Function onTap;

  const _SettingsTileWidget({
    required this.text,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Image.asset(image),
              const SizedBox(width: 16),
              Text(
                text,
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              )
            ],
          ),
        ),
        Positioned.fill(
            child: InkWell(
          onTap: () => onTap(),
        )),
      ],
    );
  }
}
