import 'package:flutter/material.dart';
import 'package:flutter_provider_login/base_provider.dart';
import 'package:flutter_provider_login/login_page.dart';
import 'package:flutter_provider_login/second_page.dart';

import 'application_presenter.dart';

class ApplicationPage extends StatefulWidget {
  @override
  _ApplicationPageState createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<ApplicationPresenter>(
      model: ApplicationPresenter(),
      onModelReady: (model) async => await model.hasToken(),
      builder: (context, model, child) =>
          model.isAuthenticated ? SecondPage() : LoginPage(),
    );
  }
}
