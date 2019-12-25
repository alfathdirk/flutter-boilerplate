import 'package:flutter/material.dart';

import 'ui/home/home.dart';
import 'ui/login/login.dart';
import 'ui/splash/splash.dart';
import 'ui/otp/otp.dart';

class Routes {
  Routes._();
  //static variables
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
  static const String otp = '/otp';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    login: (BuildContext context) => LoginScreen(),
    otp: (BuildContext context) => Otp(),
    home: (BuildContext context) => HomeScreen(),
  };
}

