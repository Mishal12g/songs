import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:songs/resources/app_colors.dart';

class ButtonWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;
  final Color colorText;
  final bool isHiddenBorder;
  final String text;
  final double radius;
  final TextStyle? textStyle;
  final Function onTap;
  final Color borderColor;
  final Widget? rightWidget;

  const ButtonWidget({
    super.key,
    required this.text,
    required this.onTap,
    this.isHiddenBorder = true,
    this.colorText = AppColors.yellow,
    this.color,
    this.radius = 0,
    this.textStyle,
    this.borderColor = AppColors.yellow,
    this.width,
    this.height,
    this.rightWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(radius),
            border: isHiddenBorder
                ? null
                : Border.all(
                    width: 1,
                    color: borderColor,
                  ),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: textStyle ??
                    GoogleFonts.manrope(
                      color: colorText,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
              ),
              rightWidget != null ? const SizedBox(width: 8) : const SizedBox(),
              rightWidget ?? const SizedBox()
            ],
          ),
        ),
        Positioned.fill(
          child: Material(
            borderRadius: BorderRadius.circular(radius),
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(radius),
              onTap: () => onTap(),
            ),
          ),
        )
      ],
    );
  }
}
