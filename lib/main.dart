import 'package:erapid_new/prov.dart';
import 'package:erapid_new/rute.dart';
import 'package:erapid_new/view/components/utility_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: multiProvider,
      child: ScreenUtilInit(
        designSize: const Size(1600, 900),
        builder: () => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'E-Rapid 2',
          theme: ThemeData.light().copyWith(
            scaffoldBackgroundColor: bgColor,
            textTheme:
                GoogleFonts.interTextTheme(Theme.of(context).textTheme).apply(
              bodyColor: textColor,
              fontSizeFactor: 1.1,
              fontSizeDelta: 2.0,
            ),
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.pink,
            ),
            backgroundColor: bgColor,
            canvasColor: secondaryColor,
            primaryColor: primaryColor,
          ),
          initialRoute: routeMain, 
          getPages: listRoute,
          builder: (BuildContext context, Widget? child){
            final MediaQueryData data = MediaQuery.of(context);
            return MediaQuery(
              data: data.copyWith(
                textScaleFactor: data.textScaleFactor > 2.0 ? 2.0 : 1.0,
              ),
              child: child ?? const SizedBox(),
            );
          },
        ),
      ),
    );
  }
}