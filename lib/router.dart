import 'package:flutter/material.dart';
import 'package:kalaapp/ui/absensi/absensi.dart';
import 'package:kalaapp/ui/profile/profile.dart';
import 'package:kalaapp/ui/task_absensi/task_abensi.dart';

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
  static const String absensi = '/absensi';
  static const String inOutAbsen = '/in_out_absen';
  static const String taskAbsensi = '/task_absensi';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    login: (BuildContext context) => LoginScreen(),
    otp: (BuildContext context) => Otp(),
    home: (BuildContext context) => HomeScreen(),
    profile: (BuildContext context) => Profile(),
    absensi: (BuildContext context) => Absensi(),
    inOutAbsen: (BuildContext context) => AbsenInOut(),
    taskAbsensi: (BuildContext context) => TaskAbsensi(),
  };
}

