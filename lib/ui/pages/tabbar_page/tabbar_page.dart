import 'package:flutter/material.dart';
import 'package:songs/resources/app_colors.dart';
import 'package:songs/resources/resources.dart';

class TabbarPage extends StatefulWidget {
  const TabbarPage({super.key});

  @override
  State<TabbarPage> createState() => _TabbarPageState();
}

class _TabbarPageState extends State<TabbarPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: AppColors.background,
        ),
        child: BottomNavigationBar(
          unselectedItemColor: Colors.red,
          backgroundColor: AppColors.background,
          currentIndex: currentIndex,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          selectedItemColor: Colors.red,
          items: [
            BottomNavigationBarItem(
              label: "",
              icon: Image.asset(
                AppImages.tab1,
                color: currentIndex == 0 ? AppColors.blue : null,
              ),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Image.asset(
                AppImages.tab2,
                color: currentIndex == 1 ? AppColors.blue : null,
              ),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Image.asset(
                AppImages.tab3,
                color: currentIndex == 2 ? AppColors.blue : null,
              ),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Image.asset(
                AppImages.tab4,
                color: currentIndex == 3 ? AppColors.blue : null,
              ),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Image.asset(
                AppImages.tab5,
                color: currentIndex == 4 ? AppColors.blue : null,
              ),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Image.asset(
                AppImages.tab6,
                color: currentIndex == 5 ? AppColors.blue : null,
              ),
            ),
          ],
          onTap: (int value) => _setIndex(value),
        ),
      ),
      body: const [
        Center(child: Text("Collection Guitars")),
        Center(child: Text("Guitar Accessories")),
        Center(child: Text("Songs")),
        Center(child: Text("Sound recordings")),
        Center(child: Text("Useful")),
        Center(child: Text("Settings")),
      ][currentIndex],
    );
  }

  _setIndex(int value) {
    currentIndex = value;
    setState(() {});
  }
}
