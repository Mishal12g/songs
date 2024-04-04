import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:songs/resources/app_colors.dart';
import 'package:songs/resources/resources.dart';
import 'package:songs/ui/companents/button_widget.dart';
import 'package:songs/ui/companents/pop_up_delete_or_edit_widget.dart';

class TileCollectionWidget extends StatefulWidget {
  final Function deleteOnTap;
  final Function editOnTap;

  final String typeGuitar;
  final String markGuitar;
  final String modelGuitar;
  final String comment;

  const TileCollectionWidget({
    super.key,
    required this.typeGuitar,
    required this.markGuitar,
    required this.modelGuitar,
    required this.comment,
    required this.deleteOnTap,
    required this.editOnTap,
  });

  @override
  // ignore: library_private_types_in_public_api
  _TileCollectionWidgetState createState() => _TileCollectionWidgetState();
}

class _TileCollectionWidgetState extends State<TileCollectionWidget> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          height: isOpen ? null : 145,
          padding:
              const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 8),
          decoration: BoxDecoration(
            color: AppColors.action,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.typeGuitar,
                maxLines: isOpen ? null : 1,
                overflow: isOpen ? null : TextOverflow.ellipsis,
                style: GoogleFonts.manrope(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.gray,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "${widget.markGuitar} ${widget.modelGuitar}",
                maxLines: isOpen ? null : 1,
                overflow: isOpen ? null : TextOverflow.ellipsis,
                style: GoogleFonts.manrope(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                widget.comment,
                maxLines: isOpen ? null : 1,
                overflow: isOpen ? null : TextOverflow.ellipsis,
                style: GoogleFonts.manrope(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.gray,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ButtonWidget(
                    radius: 24,
                    rightWidget: Image.asset(isOpen
                        ? AppImages.arrowDiagonalBottom
                        : AppImages.arrowDiagonalTop),
                    text: isOpen
                        ? "Свернуть"
                        : "Подробнее", // Изменяем текст кнопки в зависимости от состояния
                    onTap: () {
                      setState(() {
                        isOpen =
                            !isOpen; // Изменяем состояние isOpen при нажатии на кнопку
                      });
                    },
                  )
                ],
              )
            ],
          ),
        ),
        Positioned(
          right: -6,
          top: 6,
          child: PopUpDeleteOrEditWidget(
            edit: () => widget.editOnTap(),
            delete: () => widget.deleteOnTap(),
          ),
        )
      ],
    );
  }
}
