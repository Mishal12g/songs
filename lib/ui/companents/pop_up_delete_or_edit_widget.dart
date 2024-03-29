import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:songs/models/enums/delete_or_edit.dart';
import 'package:songs/resources/resources.dart';

class PopUpDeleteOrEditWidget extends StatelessWidget {
  final Function edit;
  final Function delete;

  const PopUpDeleteOrEditWidget({
    super.key,
    required this.edit,
    required this.delete,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<DeleteOrEdit>(
      icon: const Icon(
        Icons.more_vert,
        color: Color.fromRGBO(131, 131, 131, 1),
      ),
      color: const Color.fromRGBO(7, 42, 57, 1),
      onSelected: (DeleteOrEdit item) {
        switch (item) {
          case DeleteOrEdit.edit:
            edit();
          case DeleteOrEdit.delete:
            delete();
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<DeleteOrEdit>>[
        PopupMenuItem<DeleteOrEdit>(
          value: DeleteOrEdit.edit,
          child: SizedBox(
            width: 110,
            child: Row(
              children: [
                Image.asset(AppImages.union),
                const SizedBox(width: 6),
                Text(
                  'Изменить',
                  style: GoogleFonts.manrope(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        PopupMenuItem<DeleteOrEdit>(
          value: DeleteOrEdit.delete,
          child: SizedBox(
            width: 110,
            child: Row(
              children: [
                Image.asset(AppImages.trash),
                const SizedBox(width: 6),
                Text(
                  'Удалить',
                  style: GoogleFonts.manrope(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
