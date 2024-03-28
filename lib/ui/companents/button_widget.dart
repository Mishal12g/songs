import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:songs/resources/app_colors.dart';

class ButtonWidget extends StatelessWidget {
  final Color? color;
  final Color colorText;
  final bool isHiddenBorder;
  final String text;
  final double radius;
  final TextStyle? textStyle;
  final Function onTap;

  const ButtonWidget({
    super.key,
    required this.text,
    required this.onTap,
    this.isHiddenBorder = true,
    this.colorText = AppColors.yellow,
    this.color,
    this.radius = 0,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(radius),
            border: isHiddenBorder
                ? null
                : Border.all(
                    width: 1,
                    color: colorText,
                  ),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 12,
          ),
          child: Text(text,
              style: textStyle ??
                  GoogleFonts.manrope(
                    color: AppColors.yellow,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  )),
        ),
        onTap: () => onTap(),
      ),
    );
  }
}
