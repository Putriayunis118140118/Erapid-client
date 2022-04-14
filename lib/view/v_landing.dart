import 'package:erapid_new/responsive.dart';
import 'package:erapid_new/view/components/landing/header_component.dart';
import 'package:erapid_new/view/components/landing/layanan_component.dart';
import 'package:erapid_new/view/components/landing/tentangkami_component.dart';
import 'package:erapid_new/view/components/landing/topbar_component.dart';
import 'package:erapid_new/view/components/utility_ui.dart';
import 'package:erapid_new/view_model/vm_landing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:stacked/stacked.dart';

class ViewLandingPage extends StatelessWidget {
  const ViewLandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LandingPageViewModel>.reactive(
      viewModelBuilder: () => LandingPageViewModel(),
      onModelReady: (model) => model.initLanding(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: bgColor,
        body: SingleChildScrollView(
          controller: model.controller,
          scrollDirection: model.scrollDirection,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (Responsive.isDesktop(context)) TopBarComponent(model: model),
              AutoScrollTag(
                key: const ValueKey(0),
                controller: model.controller,
                index: 0,
                child: HeaderComponent(model: model),
              ),
              AutoScrollTag(
                key: const ValueKey(1),
                controller: model.controller,
                index: 1,
                child: Container(
                  height: 120.r,
                  child: SvgPicture.asset("assets/landing/dots.svg"),
                ),
              ),
              AutoScrollTag(
                key: const ValueKey(2),
                controller: model.controller,
                index: 2,
                child: const TentangKamiComponent(),
              ),
              SizedBox(height: 100.h),
              AutoScrollTag(
                key: const ValueKey(3),
                controller: model.controller,
                index: 3,
                child: LayananComponent(),
              ),
              SizedBox(height: 100.h),
              AutoScrollTag(
                key: const ValueKey(4),
                controller: model.controller,
                index: 4,
                child: Container(
                  width: Get.width,
                  height: 200.h,
                  color: primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}