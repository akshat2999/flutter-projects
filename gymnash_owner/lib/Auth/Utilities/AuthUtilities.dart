import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Utilities/SizeConfig.dart';
import '../../Utilities/Theme.dart';

class AuthUtilities {
  TextStyle textStyle({fontSize, double letterSpacing}) =>
      TextStyle(fontSize: fontSize ?? SizeConfig.textMultiplier * 2.5, color: ThemeColors.white, letterSpacing: letterSpacing ?? 0.5);
  TextStyle hintStyle({fontSize, letterSpacing}) =>
      TextStyle(fontSize: fontSize ?? SizeConfig.textMultiplier * 2.5, color: ThemeColors.silver, letterSpacing: letterSpacing ?? 1);

  TextStyle linkTextStyle({fontSize}) => TextStyle(color: ThemeColors.silver, fontSize: fontSize ?? SizeConfig.textMultiplier * 1.8);
  TextStyle linkStyle({fontSize}) =>
      TextStyle(color: ThemeColors.accent, fontSize: fontSize ?? SizeConfig.textMultiplier * 1.8, fontWeight: FontWeight.bold);

  List<Widget> header(String heading) {
    return [
      Center(child: Text(heading, style: TextStyle(fontSize: SizeConfig.textMultiplier * 6, color: ThemeColors.accent))),
      SizedBox(height: SizeConfig.heightMultiplier * 1.5),
    ];
  }

  Widget textButton(Function onPressed) {
    return TextButton(
      child: Icon(
        Icons.arrow_right_alt,
        color: ThemeColors.silver,
        size: SizeConfig.textMultiplier * 6,
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(ThemeColors.accent),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(SizeConfig.widthMultiplier * 3))),
        padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5)),
      ),
      onPressed: onPressed,
    );
  }

  Widget textFieldContainer(Widget child, {height, width}) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5),
      decoration: BoxDecoration(
          color: ThemeColors.textfieldColor,
          border: Border.all(color: ThemeColors.accent, width: 1.5),
          borderRadius: BorderRadius.circular(SizeConfig.widthMultiplier * 2.5)),
      height: height ?? SizeConfig.heightMultiplier * 7,
      width: width ?? SizeConfig.widthMultiplier * 90,
      margin: EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier),
      child: child,
    );
  }

  launchURL(method) async {
    String _url = "http://www.gymnash.com";
    switch (method) {
      case "Terms":
        _url = "https://drive.google.com/file/d/124VHk-tle3y2xSbqyKmZ1bB4r0Jo1XEx/view?usp=sharing";
        break;
      case "Privacy":
        _url = "https://drive.google.com/file/d/17MHsi65sRDQTLCdgrQtjxa6jfI-eTjE7/view?usp=sharing";
        break;
    }
    if (await canLaunch(_url)) await launch(_url);
  }
}
