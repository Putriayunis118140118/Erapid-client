import 'package:erapid_new/constants.dart';
import 'package:erapid_new/view/components/button_widget.dart';
import 'package:erapid_new/view/components/utility_ui.dart';
import 'package:erapid_new/view_model/vm_landing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopBarComponent extends StatelessWidget {
  final LandingPageViewModel model;
  const TopBarComponent({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.r),
      child: Row(
        children: [
          Image.asset(
            "${imgPath}main_logo.png",
            height: 50,
          ),
          Spacer(),
          for (var menu in model.listMenu)
            _menuButtonBuilder(
              title: menu['title'] ?? '',
              onPressed: () => model.toMenu(menu['index']),
            ),
          Spacer(),
          TextButtonW(
            onPressed: () => Get.toNamed('/login-page'),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: const Text(
                'Masuk',
                style: TextStyle(color: textColor),
              ),
            ),
          ),
          SizedBox(width: 5),
          ElevatedButtonW(
            onPressed: () => Get.toNamed('/registrasi-page'),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: const Text(
                'Daftar',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _menuButtonBuilder({
  required String title,
  Widget? icon,
  required VoidCallback onPressed,
}) {
  return GestureDetector(
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        title,
        style: GoogleFonts.kanit(
          textStyle: const TextStyle(
            color: primaryTextColor,
          ),
        ),
      ),
    ),
    onTap: onPressed,
  );
}