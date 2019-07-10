import 'package:flutter/material.dart';
import 'package:flutter_provider_login/login_request_model.dart';
import 'package:flutter_provider_login/login_response_model.dart';
import 'package:flutter_provider_login/login_service.dart';
import 'package:flutter_provider_login/shared_preferences_util.dart';

class LoginPresenter extends ChangeNotifier {
  LoginService _loginService;

  LoginPresenter({LoginService loginService}) : _loginService = loginService;
  
  String _error;
  bool _isLoginSuccess;
  LoginRequestModel _request;
  LoginResponseModel _response;

  String get error => _error;

  set error(String error) {
    _error = error;
  }

  bool get isLoginSuccess => _isLoginSuccess;

  set isLoginSuccess(bool isLoginSuccess) {
    _isLoginSuccess = isLoginSuccess;
  }

  LoginRequestModel get request => _request;

  set request(LoginRequestModel request) {
    _request = request;
  }

  LoginResponseModel get response => _response;

  set response(LoginResponseModel response) {
    _response = response;
  }

  Future<LoginResponseModel> login(LoginRequestModel request) async {
    try {
      response = await _loginService.login(request);
      SharedPreferencesUtil prefs = SharedPreferencesUtil();
      await prefs.setValue("id", response.id);
      await prefs.setValue("refreshToken", response.refreshToken);
      isLoginSuccess = true;
    } catch (e) {
      isLoginSuccess = false;
      error = e.toString();
    }
    notifyListeners();
    return response;
  }
}
