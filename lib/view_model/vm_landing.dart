import 'package:erapid_new/rute.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:stacked/stacked.dart';

class LandingPageViewModel extends BaseViewModel{
  final scrollDirection = Axis.vertical;

  late AutoScrollController controller;
  static const maxCount = 2;
  int counter = -1;

  void initLanding(){
    controller = AutoScrollController(
      viewportBoundaryGetter: () => 
          Rect.fromLTRB(0, 0, 0, MediaQuery.of(Get.context!).padding.bottom),
      axis: scrollDirection);
  }
  //Fungsi untuk menu scroll
  Future<void> toMenu(var index)async {
    counter = index;
    _scrollToCounter();
    notifyListeners();
  }

  Future _scrollToCounter() async {
    await controller.scrollToIndex(counter,
        preferPosition: AutoScrollPosition.begin);
    controller.highlight(counter);
  }

  List<Map> listMenu = [
    {
      'title': 'Beranda',
      'icon': '',
      'onPressed': () async {
         
      },
      'index' : 0,
    },
    {
      'title': 'Tentang Kami',
      'icon': '',
      'onPressed': () async {
        print("TETS");
      }, 
      'index' : 1,
    },
    {
      'title': 'Layanan',
      'icon': '',
      'onPressed': () {

      },
      'index' :2,
    },
    {
      'title': 'Fasilitas',
      'icon': '',
      'onPressed': () {

      },
      'index' : 3,
    },
    {
      'title': 'Kontak',
      'icon': '',
      'onPressed': () {
      
      },
      'index' :4,
    },
  ];
}