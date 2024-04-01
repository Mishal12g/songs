import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:songs/resources/app_colors.dart';

class FormTextFieldWidget extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController? controller;
  final double height;
  final double? maxHeight;
  final int? maxLines;

  const FormTextFieldWidget({
    super.key,
    required this.title,
    required this.hintText,
    this.controller,
    this.height = 44,
    this.maxLines = 1,
    this.maxHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.manrope(
            fontSize: 11,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          constraints: BoxConstraints(maxHeight: maxHeight ?? height),
          height: maxHeight == null ? height : null,
          decoration: BoxDecoration(
            color: AppColors.action,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            maxLines: maxLines,
            controller: controller,
            style: GoogleFonts.manrope(
              fontSize: 13,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              hintStyle: GoogleFonts.manrope(
                fontSize: 13,
                color: AppColors.gray,
                fontWeight: FontWeight.w400,
              ),
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 13,
                horizontal: 10,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
