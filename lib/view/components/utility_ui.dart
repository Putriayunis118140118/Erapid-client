import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

// Color scheme
const primaryColor = Color(0xFFA85EA0);
const secondaryColor = Color(0xFFFFFFFF);
const bgColor = Color(0xFFFFFFFF);
const textColor = Color(0xff313131);
const borderColor = Color(0xffe5e5e5);
const primaryTextColor = Color(0xffBA78BB);
const textHintColor = Color(0xffe5e5e5);
const textCardColor = Color(0xFFFFFFFF);

// sizing
double defaultAppbarSize = 60.0;
BorderRadius defaultBorderRadius = BorderRadius.circular(10);

// styling card / container
const List<BoxShadow> defaultCardShadow = [
  BoxShadow(
    color: Color(0x29000000),
    offset: Offset(0, 3),
    blurRadius: 6,
    spreadRadius: 0,
  ),
];

const List<BoxShadow> defaultPinShadow = [
  BoxShadow(
    color: Color(0x29000000),
    offset: Offset(0, 5),
    blurRadius: 2,
    spreadRadius: 0,
  ),
];

const double heightBetweenField = 15.0;

BoxDecoration defaultCardDecoration = BoxDecoration(
  color: secondaryColor,
  borderRadius: defaultBorderRadius,
  boxShadow: defaultCardShadow,
);

// Text / font styling
class MainTextStyle extends TextStyle {
  static const bool fontScaling = false;
  static const double letterSpace = 0.5;
  static const double normalSize = 12.5;
  static const double normalh4Size = 11.5;
  static const double normalh3Size = 13.5;
  static const double boldSize = 15.5;

  static const double fontSizeH1 = 96.0 - 15.0;
  static const double fontSizeH2 = 60.0 - 15.0;
  static const double fontSizeH3 = 48.0 - 15.0;
  static const double fontSizeH4 = 34.0 - 15.0;
  static const double fontSizeH5 = 24.0 - 15.0;
  static const double fontSizeH6 = 20.0 - 15.0;
  static const double fontSizeSubtitle1 = 16.0;
  static const double fontSizeSubtitle2 = 14.0;
  static const double fontSizeBody1 = 16.0 - 3;
  static const double fontSizeBody2 = 14.0 - 3;
  static const double fontSizeButton = 14.0;
  static const double fontSizeCaption = 12 - 1.0;
  static const double fontSizeOverline = 10 - 1.0;

  static const double letterSpaceH1 = -1.5;
  static const double letterSpaceH2 = -0.5;
  static const double letterSpaceH3 = 0;
  static const double letterSpaceH4 = 0.25;
  static const double letterSpaceH5 = 0;
  static const double letterSpaceH6 = 0.15;
  static const double letterSpaceSubtitle1 = 0.15;
  static const double letterSpaceSubtitle2 = 0.1;
  static const double letterSpaceBody1 = 0.5;
  static const double letterSpaceBody2 = 0.25;
  static const double letterSpaceButton = 1.25;
  static const double letterSpaceCaption = 0.4;
  static const double letterSpaceOverline = 1.5;

  TextStyle textStyleH1 = GoogleFonts.roboto(
    color: textColor,
    letterSpacing: letterSpaceH1,
    fontSize: fontSizeH1,
    fontWeight: FontWeight.w300,
  );

  TextStyle textStyleH2 = GoogleFonts.roboto(
    color: textColor,
    letterSpacing: letterSpaceH2,
    fontSize: fontSizeH2,
    fontWeight: FontWeight.w300,
  );

  TextStyle textStyleH3 = GoogleFonts.roboto(
    color: textColor,
    letterSpacing: letterSpaceH3,
    fontSize: fontSizeH3,
    fontWeight: FontWeight.normal,
  );

  TextStyle textStyleH4 = GoogleFonts.roboto(
    color: textColor,
    letterSpacing: letterSpaceH4,
    fontSize: fontSizeH4,
    fontWeight: FontWeight.normal,
  );

  TextStyle textStyleH5 = GoogleFonts.roboto(
    color: textColor,
    letterSpacing: letterSpaceH5,
    fontSize: fontSizeH5,
    fontWeight: FontWeight.w100,
  );

  TextStyle textStyleH6 = GoogleFonts.roboto(
    color: textColor,
    letterSpacing: letterSpaceH6,
    fontSize: fontSizeH6,
    fontWeight: FontWeight.w500,
  );

  TextStyle textStyleSubtitle1 = GoogleFonts.roboto(
    color: textColor,
    letterSpacing: letterSpaceSubtitle1,
    fontSize: fontSizeSubtitle1,
    fontWeight: FontWeight.normal,
  );

  TextStyle textStyleSubtitle2 = GoogleFonts.roboto(
    color: textColor,
    letterSpacing: letterSpaceSubtitle2,
    fontSize: fontSizeSubtitle2,
    fontWeight: FontWeight.w500,
  );

  TextStyle textStyleBody1 = GoogleFonts.roboto(
    color: textColor,
    letterSpacing: letterSpaceBody1,
    fontSize: fontSizeBody1,
    // fontWeight: FontWeight.w500,
  );

  TextStyle textStyleBody2 = GoogleFonts.roboto(
    color: textColor,
    letterSpacing: letterSpaceBody1,
    fontSize: fontSizeBody1,
    fontWeight: FontWeight.normal,
  );

  TextStyle textStyleButton = GoogleFonts.roboto(
    color: bgColor,
    letterSpacing: letterSpaceButton,
    fontSize: fontSizeButton,
    fontWeight: FontWeight.w500,
  );

  TextStyle textStyleCaption = GoogleFonts.roboto(
    color: textColor,
    letterSpacing: letterSpaceCaption,
    fontSize: fontSizeCaption,
    fontWeight: FontWeight.normal,
  );

  TextStyle textStyleOverline = GoogleFonts.roboto(
    color: textColor,
    letterSpacing: letterSpaceOverline,
    fontSize: fontSizeOverline,
    fontWeight: FontWeight.normal,
  );

  TextStyle textStyleCard = GoogleFonts.roboto(
    color: textCardColor,
    letterSpacing: 2,
    fontSize: fontSizeH4,
    fontWeight: FontWeight.normal,
  );

}
