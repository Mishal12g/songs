import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:songs/resources/app_colors.dart';
import 'package:songs/ui/companents/button_widget.dart';

Future<dynamic> showAlert(
  BuildContext context,
  Function deleteOnTap, {
  required String title,
  required String content,
}) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: const Color.fromRGBO(84, 84, 84, 1),
      title: Center(
        child: Text(
          title,
          style: GoogleFonts.manrope(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      content: Text(
        content,
        textAlign: TextAlign.center,
        style: GoogleFonts.manrope(
          fontSize: 11,
          fontWeight: FontWeight.w400,
        ),
      ),
      actions: <Widget>[
        Row(
          children: [
            Expanded(
              child: ButtonWidget(
                height: 40,
                text: "Отмена",
                radius: 5,
                color: const Color.fromRGBO(199, 201, 204, 1),
                colorText: Colors.black,
                onTap: () {
                  Get.back();
                },
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: ButtonWidget(
                height: 40,
                text: "Удалить",
                radius: 5,
                color: AppColors.yellow,
                colorText: Colors.black,
                onTap: () => deleteOnTap(),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
