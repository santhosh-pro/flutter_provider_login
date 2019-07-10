import 'package:flutter/material.dart';
import 'package:flutter_provider_login/shared_preferences_util.dart';

class SecondPresenter extends ChangeNotifier {
  String _id;

  String get id => _id;

  set id(String id) {
    _id = id;
  }

  String _token;

  String get token => _token;

  set token(String token) {
    _token = token;
  }

  SharedPreferencesUtil prefs = SharedPreferencesUtil();
  Future logout() async {
    prefs.deleteValue("id");
    prefs.deleteValue("refreshToken");
  }

  Future setUserDetails() async {
    id = await prefs.getValue("id");
    token = await prefs.getValue("refreshToken");
    notifyListeners();
  }
}
