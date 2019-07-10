import 'package:flutter/material.dart';
import 'package:flutter_provider_login/base_provider.dart';
import 'package:flutter_provider_login/router.dart';
import 'package:flutter_provider_login/second_presenter.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<SecondPresenter>(
        model: SecondPresenter(),
        onModelReady: (model) => model.setUserDetails(),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                  title: Text('Second Page'), automaticallyImplyLeading: false),
              body: Container(
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Text(model.id),
                      Text(model.token),
                      RaisedButton(
                        child: Text("Logout"),
                        onPressed: () {
                          model.logout();
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              RoutePaths.Login,
                              (Route<dynamic> route) => false);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
