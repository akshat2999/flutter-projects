import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:gymnash_owner/Dashboard/Screens/DashboardScreen.dart';

import '../../Utilities/SizeConfig.dart';
import '../../Utilities/Snackbar.dart';
import '../../Utilities/Theme.dart';
import '../../Utilities/CustomDialog.dart';
import '../Utilities/AuthUtilities.dart';

class LoginScreen extends StatelessWidget {
  static final routeName = "/login";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.only(bottom: SizeConfig.heightMultiplier * 5),
        decoration: BoxDecoration(
          color: ThemeColors.primary,
          image: DecorationImage(image: AssetImage("assets/loginbg.png"), fit: BoxFit.cover),
        ),
        height: SizeConfig.heightMultiplier * 100,
        width: SizeConfig.widthMultiplier * 100,
        child: LoginWidget(),
      ),
    );
  }
}

class LoginWidget extends StatelessWidget {
  LoginWidget({Key key}) : super(key: key);
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final utils = AuthUtilities();
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ...AuthUtilities().header("Login"),
        SizedBox(height: SizeConfig.heightMultiplier * 2),
        Column(
          children: [
            AuthUtilities().textFieldContainer(
                TextField(
                  controller: _usernameController,
                  cursorColor: ThemeColors.accent,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.name,
                  maxLength: 11,
                  decoration: InputDecoration(
                    prefixIcon: Container(
                      transform: Matrix4.translationValues(-10.0, 0.0, 0.0),
                      child: Icon(Icons.account_circle_sharp, color: ThemeColors.white),
                    ),
                    hintText: "Username...",
                    hintStyle: AuthUtilities().hintStyle(),
                    counterText: "",
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
                width: SizeConfig.widthMultiplier * 70),
            SizedBox(height: SizeConfig.heightMultiplier * 2.5),
            AuthUtilities().textFieldContainer(
                TextField(
                  controller: _passwordController,
                  cursorColor: ThemeColors.accent,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  maxLength: 11,
                  decoration: InputDecoration(
                    prefixIcon: Container(
                      transform: Matrix4.translationValues(-10.0, 0.0, 0.0),
                      child: Icon(Icons.lock_open, color: ThemeColors.white),
                    ),
                    hintText: "Password...",
                    hintStyle: AuthUtilities().hintStyle(),
                    counterText: "",
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
                width: SizeConfig.widthMultiplier * 70),
            SizedBox(height: SizeConfig.heightMultiplier * 2.5),
            AuthUtilities().textButton(
              () async {
                FocusScope.of(context).unfocus();
                print(_usernameController.text);
                print(_passwordController.text);
                Navigator.popAndPushNamed(context, DashboardScreen.routeName);
                // if (_mobileController.text.length != 11) {
                //   Snackbar.display(context, "Enter Valid Phone Number", isError: true);
                //   return;
                // }
                // CustomDialog().loaderDialog(context, "Sending OTP");
                // var _response = await APIClient().sendOTP(_mobileController.text.replaceAll('-', ''));
                // Navigator.pop(context);
                // if (_response[APIUtils.RESULT_OK]) {
                //   Snackbar.display(context, _response[APIUtils.MESSAGE]);
                //   Navigator.pushNamed(context, OTPScreen.routeName);
                // } else
                //   Snackbar.display(context, _response[APIUtils.MESSAGE], isError: true);
              },
            )
          ],
        ),
        SizedBox(height: SizeConfig.heightMultiplier * 30),
        Container(
          width: SizeConfig.widthMultiplier * 90,
          alignment: Alignment.center,
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: AuthUtilities().linkTextStyle(),
              children: <TextSpan>[
                // TextSpan(text: "By providing my phone number, I hereby agree and accept the "),
                TextSpan(
                  text: "Terms of Service",
                  style: utils.linkStyle(),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      await AuthUtilities().launchURL("Terms");
                    },
                ),
                TextSpan(text: " & "),
                TextSpan(
                  text: "Privacy Policy",
                  style: utils.linkStyle(),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      await AuthUtilities().launchURL("Privacy");
                    },
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
