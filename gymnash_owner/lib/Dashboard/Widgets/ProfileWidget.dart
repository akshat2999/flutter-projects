import 'package:flutter/material.dart';
import 'package:gymnash_owner/Utilities/SizeConfig.dart';
import 'package:gymnash_owner/Utilities/Theme.dart';

class ProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "User",
        style: TextStyle(color: ThemeColors.silver),
      ),
    );
  }
}
