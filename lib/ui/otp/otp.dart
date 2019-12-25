import 'dart:async';

import 'package:kalaapp/constants/constant.dart';
import 'package:kalaapp/router.dart';
import 'package:kalaapp/widgets/app_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:kalaapp/widgets/otp_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Otp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OtpState();
}

class _OtpState extends State<Otp> {

  int i = 13;
  bool isVisibleResendCode = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _onSubmit(String dataOtp) {
    print(dataOtp);
  }

  _startTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      i--;
      setState(() {
        i = i;
      });

      if(i < 1) {
        timer.cancel();
        setState(() {
          isVisibleResendCode = true;
        });
        navigate();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text('SMS dengan kode verifikasi telah dikirim ke nomor telepon Anda yang teregistrasi', textAlign: TextAlign.center),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('(+62 815 1562 5005)', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('00 : ${i < 10 ? 0 : ''}$i', textAlign: TextAlign.center, style: TextStyle(fontSize: 20, color: Colors.blue)),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    OtpWidget(
                      onSubmit: _onSubmit,
                    ), 
                ]),
              ),
              Visibility(
                visible: isVisibleResendCode,
                child: GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text('KIRIM ULANG KODE', textAlign: TextAlign.center),
                  ),
                  onTap: () {

                  },
                ) ,
              )
              
            ]
          )
        ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AppBar(
      flexibleSpace: Image(
        // width: size.width,
        // height: 100,
        // Image.asset('assets/images/logo_white.png', height: 45 ),
        image: AssetImage('assets/images/background_login.png'),
        fit: BoxFit.cover,
      ),
      backgroundColor: Colors.white,
      leading: IconButton(
        color: Colors.white,

        onPressed: () {
          SharedPreferences.getInstance().then((preference) {
            preference.setBool(Constants.is_logged_in, false);
            preference.setString(Constants.auth_token, '');
            Navigator.of(context).pushReplacementNamed(Routes.login);
          });
        },
        icon: Icon(
          Icons.arrow_back,
        )
      )
      // title: Container(
      //   child: Image.asset('assets/images/logo_white.png', height: 20 ),
      // ),
    );
  }


  navigate() async {
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // bool isLoggedIn = preferences.getBool(Constants.is_logged_in);
    // String authToken = preferences.getString(Constants.auth_token);

    // if ((isLoggedIn || authToken != '') ?? false) {
      Navigator.of(context).pushReplacementNamed(Routes.home);
    // } else {
    //   Navigator.of(context).pushReplacementNamed(Routes.login);
    // }
  }
}
