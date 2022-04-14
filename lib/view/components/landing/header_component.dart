import 'package:erapid_new/view/components/utility_ui.dart';
import 'package:erapid_new/view_model/vm_landing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderComponent extends StatelessWidget {
  final LandingPageViewModel model;
  const HeaderComponent({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.topRight,
          width: Get.width,
          child: SvgPicture.asset(
            'assets/landing/background_decoration_1.svg',
            width: 1250.w,
            height: 800.h,
            fit: BoxFit.fill,
          ),
        ),
        // konten utama
        Container(
          padding: EdgeInsets.symmetric(horizontal: 200.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // title dan subtitle
              Container(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Text(
                            "Pelayanan",
                            style: GoogleFonts.inter(
                              shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(2, 10.0),
                                  blurRadius: 5.0,
                                  color: Color.fromRGBO(0, 0, 0, 0.1),
                                ),
                              ],
                              textStyle: TextStyle(
                                color: primaryTextColor,
                                fontSize: 90.sp,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 25.0),
                            child: Text(
                              "E-RAPID",
                              style: GoogleFonts.inter(
                                height: 0.7,
                                shadows: <Shadow>[
                                  Shadow(
                                    offset: Offset(2, 10.0),
                                    blurRadius: 8.0,
                                    color: Color.fromRGBO(0, 0, 0, 0.15),
                                  ),
                                ],
                                textStyle: TextStyle(
                                  color: primaryTextColor,
                                  fontSize: 90.sp,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 50),
                    Container(
                      width: 400,
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '"We Care With Concerity"',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Inter',
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Kami siap melayani anda dengan sepenuh hati.\nPelayanan E-Rapid untuk memudahkan anda dalam melakukan pemeriksaan.',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 700.r,
                padding: EdgeInsets.only(top: 50.r),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      height: 580.r,
                      padding: EdgeInsets.only(left: 10),
                      child: SvgPicture.asset(
                        'assets/landing/background_orang.svg',
                      ),
                    ),
                    Container(
                      height: 700.r,
                      padding: EdgeInsets.only(right: 50),
                      child: Image.asset('assets/landing/orang.png'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
