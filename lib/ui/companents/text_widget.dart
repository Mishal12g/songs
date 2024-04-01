import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  final String? title;
  final String text;
  final String? image;
  final String? accentTitle;

  const TextWidget({
    super.key,
    required this.text,
    this.title,
    this.image,
    this.accentTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title != null
            ? Text(
                title ?? "",
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                ),
              )
            : const SizedBox(),
        Text(
          text,
          style: GoogleFonts.manrope(
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
        image != null
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Image.asset(
                  image ?? "",
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              )
            : const SizedBox(),
        accentTitle != null
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  title ?? "",
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: const Color.fromRGBO(255, 226, 149, 1),
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
