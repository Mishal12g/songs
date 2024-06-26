import 'package:get/get.dart';
import 'package:songs/resources/resources.dart';
import 'package:songs/services/store/onboarding_store_service.dart';

class OnboardingPageController extends GetxController {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  final List<String> titles = [
    "Добро пожаловать",
    "Управляйте, создавайте, записывайте",
    "Творите без границ",
  ];
  final List<String> texts = [
    "Мы рады приветствовать вас. Надеемся, что приложение станет вашим верным спутником в мире гитарных мелодий и аккордов.",
    "Легко управляйте своими гитарами, создавайте песни, записывайте мелодии.",
    "Погрузитесь в мир звуков, творчества и возможностей. Начните играть, создавать и записывать прямо сейчас.",
  ];

  final images = [
    AppImages.splash1,
    AppImages.splash2,
    AppImages.splash3,
  ];

  setCurrentIndex(int index) {
    if (_currentIndex != 2) {
      _currentIndex = index;
      update();
    } else {
      Get.offAndToNamed("/tabbarPage");
      OnboardingStoreService.hide();
    }
  }
}
