import 'package:flutter/material.dart';
import 'package:inject/inject.dart';
import 'package:kalaapp/injector/modules/state_store.dart';

import './injector/components/app_component.dart';
import 'constants/constant.dart';
import './router.dart';
import 'ui/splash/splash.dart';

var appComponent;

void main() async {
  appComponent = await AppComponent.create(StateModule());
  runApp(appComponent.app);
}

@provide
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      // theme: themeData,
      routes: Routes.routes,
      home: SplashScreen(),
    );
  }
}
