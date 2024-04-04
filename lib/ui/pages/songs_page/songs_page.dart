import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:songs/resources/app_colors.dart';
import 'package:songs/resources/resources.dart';
import 'package:songs/ui/companents/button_widget.dart';
import 'package:songs/ui/companents/pop_up_delete_or_edit_widget.dart';
import 'package:songs/ui/pages/songs_page/songs_page_controller.dart';

class SongsPage extends StatelessWidget {
  const SongsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SongsPageController c = Get.put(SongsPageController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Песни"),
      ),
      body: GetBuilder<SongsPageController>(
        builder: (_) => Stack(
          children: [
            c.songs.isEmpty
                ? const _EmptyStateWidget()
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ListView.builder(
                      itemCount: c.songs.length,
                      itemBuilder: (context, index) {
                        final song = c.songs[index];
                        return Column(
                          children: [
                            _SongTileWidget(
                              name: song.name,
                              group: song.executor,
                              delete: () {},
                              edit: () => Get.toNamed("/SongEditFormPage",
                                  arguments: song),
                              onTap: () {
                                Get.toNamed("/SongPage", arguments: song);
                              },
                            ),
                            const Divider(thickness: 0.3),
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
                  text: "Добавить песню",
                  rightWidget: const Icon(Icons.add),
                  onTap: () {
                    Get.toNamed("/SongFormPage");
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

class _SongTileWidget extends StatelessWidget {
  final String name;
  final String group;
  final Function delete;
  final Function edit;
  final Function onTap;

  const _SongTileWidget({
    required this.name,
    required this.group,
    required this.delete,
    required this.edit,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            Image.asset(AppImages.notaIcon),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    group,
                    style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: const Color.fromRGBO(173, 173, 173, 1),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right,
              color: Colors.white,
            )
          ],
        ),
        Positioned.fill(
          child: InkWell(
            onTap: () => onTap(),
          ),
        ),
        Positioned(
          right: 15,
          child: PopUpDeleteOrEditWidget(
            edit: () => edit(),
            delete: () => delete(),
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
          AppImages.backgroundSongs,
          width: double.infinity,
          fit: BoxFit.fitWidth,
        ),
        Positioned.fill(
          child: Column(
            children: [
              const SizedBox(height: 12),
              Text(
                "Здесь пока ещё нет песен",
                textAlign: TextAlign.center,
                style: GoogleFonts.manrope(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: Image.asset(
                  AppImages.nota1,
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
