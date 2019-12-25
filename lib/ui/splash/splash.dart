import 'dart:async';

import 'package:kalaapp/constants/constant.dart';
import 'package:kalaapp/router.dart';
import 'package:kalaapp/widgets/app_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      child: Center(child: new Image.asset(
          'assets/images/background_login.png',
          width: size.width,
          height: size.height,
          fit: BoxFit.fill,
        )
      ),
    );
  }

  startTimer() {
    var _duration = Duration(milliseconds: 2000);
    return Timer(_duration, navigate);
  }

  navigate() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool isLoggedIn = preferences.getBool(Constants.is_logged_in);
    String authToken = preferences.getString(Constants.auth_token);

    if ((isLoggedIn || authToken != '') ?? false) {
      Navigator.of(context).pushReplacementNamed(Routes.home);
    } else {
      Navigator.of(context).pushReplacementNamed(Routes.login);
    }
  }
}
