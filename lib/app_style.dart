import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static List<Color> colorSwatch = [
    const Color(0xFF6aa0df),
    const Color(0xFFbfbdea),
    const Color(0xFF9f43b5),
    const Color(0xFF5c61af),
    const Color(0xFF2fbca1),
    const Color(0xFFd89e64),
  ];

// static Color swatch_1 =
// static Color swatch_2 =
// static Color swatch_3 =
// static Color swatch_4 =
// static Color swatch_5 =
// static Color swatch_6 =
// static Color swatch_7 =
// static Color swatch_8 =

  //text style
  static TextStyle mainTitle = GoogleFonts.roboto(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static TextStyle mainContent = GoogleFonts.nunito(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static TextStyle animeEpisodeListTitleStyle = GoogleFonts.roboto(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static TextStyle animeEpisodeListSubTitleStyle = GoogleFonts.roboto(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );
}
