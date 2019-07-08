import 'dart:io';
import 'package:flutter_provider_login/constants.dart';
import 'package:flutter_provider_login/login_request_model.dart';
import 'package:flutter_provider_login/login_response_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class LoginService {
  Future<LoginResponseModel> login(LoginRequestModel loginrequest) async {
    final String url = Constants.baseurl + 'Auth/login';

    var requestData = convert.jsonEncode(loginrequest.toJson());
    try {
      final response = await http.post('$url',
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.authorizationHeader: ''
          },
          body: requestData);

      if (response.statusCode <= 200 || response.statusCode >= 400) {
        var result = response.body;

        var responseData =
            LoginResponseModel.fromJson(convert.jsonDecode(result));
        return (responseData);
      } else {
        return throw Exception('Unable to connect with server');
      }
    } catch (e) {
      var s = e;
    }
  }
}
