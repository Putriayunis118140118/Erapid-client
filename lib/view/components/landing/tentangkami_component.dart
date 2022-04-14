import 'package:erapid_new/view/components/utility_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TentangKamiComponent extends StatelessWidget {
  const TentangKamiComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 200.w),
      width: Get.width / 2 + 200.w,
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: 
            Text(
              'Tentang Kami',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily: 'Inter',
                color: primaryTextColor,
                fontSize: 40.sp,
              ),
            ),
          ),
          SizedBox(height: 20.h),
          /* Container(
            child: 
            Text(
              'Profil',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontFamily: 'Inter',
                color: primaryColor,
                fontSize: 20.sp,
              ),
            ),
          ), */ 
          SizedBox(height: 20.h),
          Text(
            'Visi',
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            'Mewujudkan pelayanan kesehatan yang aman, terpercaya dan terjangkau yang berdasarkan pada nilai-nilai kepedulian dan kesigapan dalam melayani seluruh golongan lapisan masyarakat.',
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
