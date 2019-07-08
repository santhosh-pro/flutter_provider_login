import 'package:flutter/material.dart';
import 'package:flutter_provider_login/base_provider.dart';
import 'package:flutter_provider_login/login_presenter.dart';
import 'package:flutter_provider_login/login_request_model.dart';
import 'package:provider/provider.dart';

import 'login_response_model.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginRequestModel _loginRequestModel=LoginRequestModel();
  LoginResponseModel _loginResponseModel;
  @override
  Widget build(BuildContext context) {
    return BaseWidget<LoginPresenter>(
        model: LoginPresenter(loginService: Provider.of(context)),
        builder: (context, model, child) => Scaffold(
            appBar: AppBar(
              title: Text('Login'),
            ),
            body: Center(
                child: Container(
                    padding: const EdgeInsets.all(0.0),
                    width: 300.0,
                    height: 300.0,
                    child: Column(children: <Widget>[
                      TextField(
                        onChanged: (_value) =>
                            {_loginRequestModel.username = _value},
                        decoration: InputDecoration(
                          hintText: "Username",
                        ),
                      ),
                      TextField(
                        onChanged: (_value) =>
                            {_loginRequestModel.password = _value},
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Password",
                        ),
                      ),
                      RaisedButton(
                        onPressed: () async {
                          model.request = _loginRequestModel;
                          await model.login(model.request);
                        },
                        child: Text('Login'),
                        color: Colors.blue,
                        textColor: Colors.white,
                      ),
                      Text(model.response?.role==null?"hello":model.response.role)
                    ])))));
  }
}
