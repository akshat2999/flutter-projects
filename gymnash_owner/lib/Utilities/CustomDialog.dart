import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Constants.dart';
import 'SizeConfig.dart';
import 'Theme.dart';

class CustomDialog {
  final TextStyle cupertinoActionStyle = TextStyle(color: ThemeColors.accent);

  Future loaderDialog(BuildContext context, String message) async {
    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          child: Wrap(
            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [CircularProgressIndicator(), SizedBox(height: 30), Text(message)],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future subtitleDialog(
    BuildContext context,
    String title,
    String subtitle,
    Function onPressed, {
    String onPressedText = "Confirm",
    String onCancelText = "Cancel",
  }) async {
    return await showDialog(
      context: context,
      builder: (_) {
        return Constants.isIOS
            ? CupertinoAlertDialog(
                title: Text(title),
                content: Text(subtitle),
                actions: [
                  CupertinoDialogAction(
                    textStyle: cupertinoActionStyle,
                    child: Text(onCancelText),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  CupertinoDialogAction(textStyle: cupertinoActionStyle, child: Text(onPressedText), onPressed: onPressed)
                ],
              )
            : AlertDialog(
                title: Text(title),
                content: Text(subtitle),
                actions: [
                  TextButton(
                    child: Text(onCancelText),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(child: Text(onPressedText), onPressed: onPressed)
                ],
              );
      },
    );
  }

  Future textFieldDialog(
    BuildContext context,
    String title,
    String hintText,
    TextEditingController controller,
    Function onPressed, {
    String onPressedText = "Confirm",
    String onCancelText = "Cancel",
    Function onTextTap,
    bool textReadOnly = false,
  }) async {
    return await showDialog(
      context: context,
      builder: (_) {
        return Constants.isIOS
            ? CupertinoAlertDialog(
                title: Text(title),
                content: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: CupertinoTextField(
                    padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.heightMultiplier * 1.5,
                      horizontal: SizeConfig.widthMultiplier * 5,
                    ),
                    decoration: BoxDecoration(
                      color: ThemeColors.textfieldColor,
                      border: Border.all(color: ThemeColors.accent, width: 1.5),
                      borderRadius: BorderRadius.circular(SizeConfig.widthMultiplier * 2.5),
                    ),
                    controller: controller,
                    cursorColor: ThemeColors.accent,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    textAlignVertical: TextAlignVertical.center,
                    readOnly: textReadOnly,
                    onTap: onTextTap,
                    placeholder: hintText,
                    placeholderStyle: TextStyle(fontSize: SizeConfig.textMultiplier * 2.2, color: ThemeColors.silver),
                    style: TextStyle(fontSize: SizeConfig.textMultiplier * 2.2, color: ThemeColors.white),
                  ),
                ),
                actions: [
                  CupertinoDialogAction(
                    textStyle: cupertinoActionStyle,
                    child: Text(onCancelText),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  CupertinoDialogAction(textStyle: cupertinoActionStyle, child: Text(onPressedText), onPressed: onPressed)
                ],
              )
            : AlertDialog(
                title: Text(title),
                contentPadding: EdgeInsets.only(top: 8, left: 24, right: 24),
                content: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 5),
                  decoration: BoxDecoration(
                    color: ThemeColors.textfieldColor,
                    border: Border.all(color: ThemeColors.accent, width: 1.5),
                    borderRadius: BorderRadius.circular(SizeConfig.widthMultiplier * 2.5),
                  ),
                  height: SizeConfig.heightMultiplier * 6,
                  width: SizeConfig.widthMultiplier * 90,
                  margin: EdgeInsets.only(top: SizeConfig.heightMultiplier),
                  child: TextField(
                    controller: controller,
                    cursorColor: ThemeColors.accent,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    textAlignVertical: TextAlignVertical.center,
                    readOnly: textReadOnly,
                    onTap: onTextTap,
                    decoration: InputDecoration(
                      hintText: hintText,
                      hintStyle: TextStyle(fontSize: SizeConfig.textMultiplier * 2.2, color: ThemeColors.silver),
                      counterText: "",
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                    style: TextStyle(fontSize: SizeConfig.textMultiplier * 2.2, color: ThemeColors.white),
                  ),
                ),
                actions: [
                  TextButton(
                    child: Text(onCancelText),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(child: Text(onPressedText), onPressed: onPressed)
                ],
              );
      },
    );
  }
}
