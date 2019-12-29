import 'package:flutter/material.dart';
import 'package:kalaapp/ui/profile/profile.dart';

import 'ui/home/home.dart';
import 'ui/login/login.dart';
import 'ui/splash/splash.dart';
import 'ui/otp/otp.dart';
import 'ui/absen_in_out/absen_in_out.dart';

class Routes {
  Routes._();
  //static variables
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
  static const String otp = '/otp';
  static const String profile = '/profile';
  static const String inOutAbsen = '/in_out_absen';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    login: (BuildContext context) => LoginScreen(),
    otp: (BuildContext context) => Otp(),
    home: (BuildContext context) => HomeScreen(),
    profile: (BuildContext context) => Profile(),
    inOutAbsen: (BuildContext context) => AbsenInOut(),
  };
}

