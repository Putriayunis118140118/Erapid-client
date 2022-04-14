import 'package:erapid_new/constants.dart';
import 'package:erapid_new/responsive.dart';
import 'package:erapid_new/view_model/vm_beranda_admin.dart';
import 'package:erapid_new/view_model/vm_landing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SideMenu extends StatelessWidget {
  final BerandaAdminViewModel model;

  const SideMenu({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("${imgPath}main_logo.png"),
          ),
          for (var menu in model.listMenu)
            DrawerListTile(
              title: menu['title'] ?? '',
              svgSrc: menu['icon'],
              press: menu['onPressed'],
            ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      // leading: SvgPicture.asset(
      //   svgSrc,
      //   color: Colors.white54,
      //   height: 16,
      // ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.black45),
      ),
    );
  }
}

class SideMenuDesktop extends StatelessWidget {
  final LandingPageViewModel model;

  const SideMenuDesktop({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ListView(
          // scrollDirection: Axis.horizontal,
          children: [
            DrawerHeader(
              child: Image.asset("${imgPath}img_tiara.png"),
            ),
            for (var menu in model.listMenu)
              DrawerListTile(
                title: menu['title'] ?? '',
                svgSrc: menu['icon'],
                press: menu['onPressed'],
              ),
          ],
        ),
      ),
    );
  }
}
