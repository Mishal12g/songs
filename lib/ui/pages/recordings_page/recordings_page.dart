import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:songs/resources/app_colors.dart';
import 'package:songs/resources/resources.dart';
import 'package:songs/ui/companents/button_widget.dart';
import 'package:songs/ui/companents/pop_up_delete_or_edit_widget.dart';
import 'package:songs/ui/pages/recordings_page/recordings_page_controller.dart';

class RecordingsPage extends StatelessWidget {
  const RecordingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final RecordingsPageController c = Get.put(RecordingsPageController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Звукозаписи"),
      ),
      body: GetBuilder<RecordingsPageController>(
        builder: (controller) => Stack(
          children: [
            c.audioList.isEmpty
                ? const _EmptyStateWidget()
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ListView.builder(
                      itemCount: c.audioList.length,
                      itemBuilder: (context, index) {
                        return const _AudioTileWidget();
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
                  text: "Записать",
                  onTap: () {
                    Get.toNamed("/RecordingPage");
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

class _AudioTileWidget extends StatefulWidget {
  const _AudioTileWidget();

  @override
  State<_AudioTileWidget> createState() => _AudioTileWidgetState();
}

class _AudioTileWidgetState extends State<_AudioTileWidget> {
  bool isPlay = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            color: AppColors.action,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Минус",
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "03:26",
                    style: GoogleFonts.manrope(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: AppColors.yellow),
                  ),
                  const Spacer(),
                  Image.asset(
                    AppImages.soundRecordingTwo,
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isPlay = !isPlay;
                      });
                    },
                    icon: Image.asset(
                      !isPlay ? AppImages.play : AppImages.stopTwo,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          right: -10,
          top: -5,
          child: PopUpDeleteOrEditWidget(
            edit: () {},
            delete: () {},
          ),
        )
      ],
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
          AppImages.recordOne,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fitWidth,
        ),
        Positioned.fill(
          child: Column(
            children: [
              const SizedBox(height: 12),
              Text(
                "Здесь пока ещё нет звукозаписей",
                textAlign: TextAlign.center,
                style: GoogleFonts.manrope(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
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
