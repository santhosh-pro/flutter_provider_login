import 'package:flutter/material.dart';
import 'package:flutter_provider_login/login_request_model.dart';
import 'package:flutter_provider_login/login_response_model.dart';
import 'package:flutter_provider_login/login_service.dart';

class LoginPresenter with ChangeNotifier {
  LoginRequestModel _request;

  LoginRequestModel get request => _request;

  set request(LoginRequestModel request) {
    _request = request;
  }
  LoginResponseModel _response;

  LoginResponseModel get response => _response;

  set response(LoginResponseModel response) {
    _response = response;
  }
  LoginService _loginService;

  LoginPresenter(
    {LoginService loginService}): _loginService = loginService;
  

  Future login(LoginRequestModel request) async {
    response = await _loginService.login(request);
    notifyListeners();
  }
}
