import 'package:erapid_new/view/components/utility_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LayananComponent extends StatelessWidget {
  const LayananComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(top: 50.h),
            child: SvgPicture.asset('assets/landing/background-layanan.svg'),
          ),
          Container(
            width: Get.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 100.r),
                      child: Image.asset(
                        'assets/landing/frame-orang-layanan-a.png',
                        height: 700.r,
                      ),
                    ),
                    SizedBox(height: 50.h),
                    Container(
                      width: Get.width / 3,
                      padding: EdgeInsets.symmetric(horizontal: 100.r),
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "PEMERIKSAAN RAPID TEST ANTIGEN",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Inter',
                              fontSize: 20.sp,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Rapid Test Antigen",
                                style: TextStyle(fontSize: 15.sp),
                              ),
                              Container(
                                height: 25.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Rapid Test Antibody",
                                style: TextStyle(fontSize: 15.sp),
                              ),
                              Container(
                                height: 25.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "RT-PCR",
                                style: TextStyle(fontSize: 15.sp),
                              ),
                              Container(
                                height: 25.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 150.h),
                      Text(
                        'Layanan',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Inter',
                          color: primaryTextColor,
                          fontSize: 40.sp,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      SizedBox(
                        width: 500.w,
                        child: Text(
                          'Selain pelayanan medis dasar, setiap rumah sakit kami memiliki beberapa layanan unggulan yang secara khusus ditangani oleh spesialis ahli dan sesuai dengan perkembangan ilmu, dan teknologi kesehatan.',
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      SizedBox(height: 100.h),
                      Container(
                        padding: EdgeInsets.only(left: 50.r),
                        height: 900.h,
                        child: Image.asset(
                          'assets/landing/frame-orang-layanan-b.png',
                          // height: 1200.h,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
