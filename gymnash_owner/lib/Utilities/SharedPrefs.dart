import 'package:shared_preferences/shared_preferences.dart';

import 'Constants.dart';

class SharedPrefs {
  static SharedPreferences prefs;
  Future<List<bool>> initialize() async {
    prefs = await SharedPreferences.getInstance();
    List<bool> result = [];
    // result.add(prefs.getBool(Constants.isFirstOpen) ?? true);
    result.add(prefs.getBool(Constants.isLoggedIn) ?? false);
    result.add(prefs.getBool(Constants.isNewUser) ?? false);
    return result;
  }
}
