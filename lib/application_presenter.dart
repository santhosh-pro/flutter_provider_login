import 'package:flutter/widgets.dart';
import 'package:flutter_provider_login/shared_preferences_util.dart';

class ApplicationPresenter extends ChangeNotifier {
  bool _isAuthenticated;

  bool get isAuthenticated => _isAuthenticated;

  set isAuthenticated(bool isAuthenticated) {
    _isAuthenticated = isAuthenticated;
  }

  Future<bool> hasToken() async {
    SharedPreferencesUtil prefs = SharedPreferencesUtil();
    var token = await prefs.getValue("refreshToken");
    isAuthenticated = (token != null) ? true : false;
    notifyListeners();
    return isAuthenticated;
  }
}
