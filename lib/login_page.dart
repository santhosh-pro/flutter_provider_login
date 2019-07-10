import 'package:flutter/material.dart';
import 'package:flutter_provider_login/base_provider.dart';
import 'package:flutter_provider_login/form_validator.dart';
import 'package:flutter_provider_login/login_presenter.dart';
import 'package:flutter_provider_login/login_request_model.dart';
import 'package:flutter_provider_login/router.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final LoginRequestModel _loginRequestModel = LoginRequestModel();

  @override
  Widget build(BuildContext context) {
    return BaseWidget<LoginPresenter>(
        model: LoginPresenter(loginService: Provider.of(context)),
        builder: (context, model, child) => Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              title: Text('Login'),
            ),
            body: Center(
                child: Form(
                    key: _formKey,
                    child: Container(
                        padding: const EdgeInsets.all(0.0),
                        width: 300.0,
                        height: 300.0,
                        child: Column(children: <Widget>[
                          TextFormField(
                            // initialValue: "9876543211",
                            onSaved: (_value) =>
                                {_loginRequestModel.username = _value},
                            decoration: InputDecoration(
                              hintText: "Username",
                            ),
                            keyboardType: TextInputType.number,
                            validator: FormValidator().validateUsername,
                          ),
                          TextFormField(
                            // initialValue: "Admin12345",
                            onSaved: (_value) =>
                                {_loginRequestModel.password = _value},
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "Password",
                            ),

                            validator: FormValidator().validatePassword,
                          ),
                          RaisedButton(
                            onPressed: () async {
                              final FormState form = _formKey.currentState;
                              if (!form.validate()) {
                              } else {
                                form.save();
                                model.request = _loginRequestModel;
                                await model.login(model.request);
                                if (model.isLoginSuccess) {
                                  Navigator.pushNamed(
                                      context, RoutePaths.Second);
                                } else {
                                  SnackBar snackBar = new SnackBar(
                                      content:
                                          new Text(model.error.toString()));
                                  _scaffoldKey.currentState
                                      .showSnackBar(snackBar);
                                }
                              }
                            },
                            child: Text('Login'),
                            color: Colors.blue,
                            textColor: Colors.white,
                          ),
                        ]))))));
  }
}
