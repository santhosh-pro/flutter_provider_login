import 'package:flutter/material.dart';
import 'package:flutter_provider_login/constants.dart';
import 'package:flutter_provider_login/login_page.dart';
import 'package:flutter_provider_login/provider_setup.dart';
import 'package:provider/provider.dart';

void main() {
  Provider.debugCheckInvalidValueType=null;
  Constants.setEnvironment(Environment.DEV);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: providers,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: LoginPage(),
        ));
  }
}
