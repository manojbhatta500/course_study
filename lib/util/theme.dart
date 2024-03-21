import 'package:coursestudy/util/size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const primaryColor = Color(0xff2696F1);
const Color secondaryColor = Color(0xffFFFFFF);
const Color textFormColor = Color(0xFFD9D9D9);
const Color errorColor = Color(0xffff0000);

ThemeData lightTheme(BuildContext context) {
  return ThemeData(
    primaryColor: primaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: secondaryColor,
      centerTitle: true,
      foregroundColor: primaryColor,
      actionsIconTheme: IconThemeData(
        color: primaryColor,
      ),
    ),
    // buttonTheme: const ButtonThemeData(
    //   buttonColor: primaryColor,
    // ),
    cardColor: secondaryColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      iconSize: SizeConfig.screenHeight,
    ),
    textTheme: TextTheme(
      displayMedium: GoogleFonts.poppins(
          textStyle: Theme.of(context).textTheme.displayMedium),
      displaySmall: GoogleFonts.poppins(
          textStyle: Theme.of(context).textTheme.displaySmall),
      titleMedium: GoogleFonts.poppins(
          textStyle: Theme.of(context).textTheme.titleMedium),
      labelSmall: GoogleFonts.poppins(
          textStyle: Theme.of(context).textTheme.labelSmall),
      labelMedium: GoogleFonts.poppins(
          textStyle: Theme.of(context).textTheme.labelMedium),
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: SizeConfig.screenHeight! * 0.01,
          color: const Color(0xff2696F1),
          //color: primaryColor,
        ),
        borderRadius: BorderRadius.circular(
          SizeConfig.screenHeight! * 0.01,
        ),
      ),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: SizeConfig.screenHeight! * 0.01,
            color: primaryColor,
            //color: Theme.of(context).disabledColor,
          ),
          borderRadius: BorderRadius.circular(
            SizeConfig.screenHeight! * 0.01,
          )),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: SizeConfig.screenWidth! * 0.01,
          color: errorColor,
        ),
        borderRadius: BorderRadius.circular(
          SizeConfig.screenHeight! * 0.01,
        ),
      ),
    ),
  );
}
