import 'package:flutter/material.dart';
import 'package:songs/resources/app_colors.dart';
import 'package:songs/ui/companents/button_widget.dart';

class TwoButtonsWidget extends StatelessWidget {
  final Function onTapOne;
  final Function onTapTwo;
  const TwoButtonsWidget({
    super.key,
    required this.onTapOne,
    required this.onTapTwo,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ButtonWidget(
            color: AppColors.action,
            colorText: Colors.white,
            radius: 24,
            text: "Отменить",
            onTap: () => onTapOne(),
          ),
        ),
        const SizedBox(width: 7),
        Expanded(
          child: ButtonWidget(
            color: AppColors.yellow,
            colorText: Colors.black,
            radius: 24,
            text: "Сохранить",
            onTap: () => onTapTwo(),
          ),
        ),
      ],
    );
  }
}
