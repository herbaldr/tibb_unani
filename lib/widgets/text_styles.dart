import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/colors.dart';

Widget headerText(String text,){
  return Padding(
    padding: EdgeInsets.only(top: 12.0),
    child: Text(
      "${text}",
      textDirection: TextDirection.rtl,
      style: TextStyle(
          color: textWhiteColor,
          fontSize: 18,
          fontWeight: FontWeight.bold
      ),
    ),
  );
}

Widget dataText(String text){
  return Text(
    "${text}",
    textDirection: TextDirection.rtl,
    style: TextStyle(
      color: textWhiteColor,
    ),
  );
}


smallTextStyle({
  String? fontFamily,
  Color color = Colors.white,
  FontWeight fontWeight = FontWeight.w500,
  TextDecoration textDecorate = TextDecoration.none
}) {
  return TextStyle(
      fontFamily: fontFamily,
      color: color,
      fontSize:  Get.height*0.012,
      fontWeight: fontWeight,
      decoration: textDecorate
  );
}

mediumTextStyle({
  String? fontFamily,
  Color color = Colors.white,
  FontWeight fontWeight = FontWeight.w500,
  TextDecoration textDecorate = TextDecoration.none
}) {
  return TextStyle(
      fontFamily: fontFamily,
      color: color,
      fontSize:  Get.height*0.018,
      fontWeight: fontWeight,
      decoration: textDecorate
  );
}

// large Text Style...
largeTextStyle({
  String? fontFamily,
  Color color = Colors.white,
  FontWeight fontWeight = FontWeight.w600,
  TextDecoration textDecorate = TextDecoration.none
}) {
  return TextStyle(
      fontFamily: fontFamily,
      color: color,
      fontSize:  Get.height*0.022,
      fontWeight: fontWeight,
      decoration: textDecorate
  );
}


// Extra Large Text Style...
extraLargeTextStyle({
  String? fontFamily,
  Color color = Colors.white,
  FontWeight fontWeight = FontWeight.w700,
  TextDecoration textDecorate = TextDecoration.none
}) {
  return TextStyle(
      fontFamily: fontFamily,
      color: color,
      fontSize:  Get.height*0.050,
      fontWeight: fontWeight,
      decoration: textDecorate
  );
}