import 'package:flutter/material.dart';
import 'package:flutter_page_view_indicator/flutter_page_view_indicator.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:songs/resources/app_colors.dart';
import 'package:songs/ui/companents/button_widget.dart';
import 'package:songs/ui/pages/onboarding_page/onboarding_page_controller.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    OnboardingPageController c = Get.put(OnboardingPageController());

    return Scaffold(
      backgroundColor: AppColors.background,
      body: GetBuilder<OnboardingPageController>(
        builder: (controller) => Stack(
          children: [
            _PageWidget(
              image: c.images[c.currentIndex],
            ),
            Positioned(
              left: 16,
              right: 16,
              bottom: 33,
              child: Column(
                children: [
                  Column(
                    children: [
                      Text(c.titles[c.currentIndex],
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: 16),
                      Text(
                        c.texts[c.currentIndex],
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      PageViewIndicator(
                        length: c.texts.length,
                        currentIndex: c.currentIndex,
                        otherSize: 8,
                        currentSize: 8,
                        currentColor: AppColors.yellow,
                        otherColor: const Color.fromRGBO(255, 255, 255, 0.16),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                  const SizedBox(height: 46),
                  Row(
                    children: [
                      ButtonWidget(
                        text: "Пропустить",
                        onTap: () {
                          Get.offAndToNamed("/tabbarPage");
                        },
                      ),
                      const Spacer(),
                      ButtonWidget(
                        text: "Далее",
                        isHiddenBorder: false,
                        radius: 24,
                        onTap: () {
                          c.setCurrentIndex(c.currentIndex + 1);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PageWidget extends StatelessWidget {
  final String image;

  const _PageWidget({
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Image(
      width: double.infinity,
      fit: BoxFit.fitWidth,
      image: AssetImage(image),
    );
  }
}
