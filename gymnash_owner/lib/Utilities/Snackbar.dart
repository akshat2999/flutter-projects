import 'package:flutter/material.dart';

import 'Theme.dart';

class Snackbar {
  static display(BuildContext context, String message, {bool isError = false}) {
    final snackBar = SnackBar(
      content: Text(message, style: TextStyle(fontSize: 16)),
      backgroundColor: isError ? Colors.red : Colors.green,
      duration: Duration(seconds: 5),
      // action: isError
      //     ? SnackBarAction(
      //         label: "Dismiss",
      //         onPressed: () {
      //           ScaffoldMessenger.of(context).hideCurrentSnackBar();
      //         },
      //         textColor: ThemeColors.silver,
      //       )
      //     : null,
    );
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static displayKey(GlobalKey<ScaffoldMessengerState> key, String message, {bool isError = false}) {
    final snackBar = SnackBar(
      content: Text(message, style: TextStyle(fontSize: 16)),
      backgroundColor: isError ? Colors.red : Colors.green,
      duration: isError ? Duration(days: 365) : Duration(seconds: 3),
      action: isError
          ? SnackBarAction(
              label: "Dismiss",
              onPressed: () {
                key.currentState.hideCurrentSnackBar();
              },
              textColor: ThemeColors.silver,
            )
          : null,
    );
    key.currentState.removeCurrentSnackBar();
    key.currentState.showSnackBar(snackBar);
  }
}

class SnackBarLauncher extends StatelessWidget {
  final String message;
  final Widget widget;

  const SnackBarLauncher({Key key, @required this.message, @required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (message != null) WidgetsBinding.instance.addPostFrameCallback((_) => Snackbar.display(context, message, isError: true));
    return widget;
  }
}
