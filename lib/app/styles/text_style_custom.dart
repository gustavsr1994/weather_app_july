import 'package:flutter/material.dart';
import 'package:weather_app/app/styles/color_pallete.dart';


TextStyle styleTextSmall({Color fontColor = colorBlack, bool isBold = false}) {
  return TextStyle(
    fontSize: 10,
    color: fontColor,
    fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
  );
}

TextStyle styleTextNormal({Color fontColor = colorBlack, bool isBold = false}) {
  return TextStyle(
    fontSize: 14,
    color: fontColor,
    fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
  );
}

TextStyle styleTextMedium({Color fontColor = colorBlack, bool isBold = false}) {
  return TextStyle(
    fontSize: 18,
    color: fontColor,
    fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
  );
}

TextStyle styleTextLarge({Color fontColor = colorBlack, bool isBold = false}) {
  return TextStyle(
    fontSize: 24,
    color: fontColor,
    fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
  );
}

TextStyle styleTextXtraLarge({Color fontColor = colorBlack, bool isBold = false}) {
  return TextStyle(
    fontSize: 70,
    color: fontColor,
    fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
  );
}