import 'dart:async';

import 'package:kalaapp/constants/constant.dart';
import 'package:kalaapp/router.dart';
import 'package:kalaapp/widgets/app_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:kalaapp/widgets/textfield_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WorkingPlan extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WorkingPlanState();
}

class _WorkingPlanState extends State<WorkingPlan> {
  @override
  void initState() {
    super.initState();
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      flexibleSpace: Image(
        image: AssetImage('assets/images/background_login.png'),
        fit: BoxFit.cover,
      ),
      backgroundColor: Colors.transparent,
      title: Text('Rencana Kerja'),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Container(
        width: size.width,
        margin: EdgeInsets.all(10),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(5),
              child: TextFieldWidget(
                isSuffixIcon: false,
                isIcon: false,
                hint: "Rencana Kerja",
                inputType: TextInputType.emailAddress,
                icon: Icons.arrow_drop_down,
                iconColor: Colors.black,
                colorInput: Colors.black,
                // textController: _userEmailController,
                inputAction: TextInputAction.next,
                onFieldSubmitted: (value) {
                  // FocusScope.of(context).requestFocus(_passwordFocusNode);
                },
                // errorText: _store.formErrorStore.userEmail,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: TextFieldWidget(
                isSuffixIcon: true,
                isIcon: false,
                hint: "Target Kerja",
                inputType: TextInputType.emailAddress,
                icon: Icons.calendar_today,
                iconColor: Colors.black,
                colorInput: Colors.black,
                // textController: _userEmailController,
                inputAction: TextInputAction.next,
                onFieldSubmitted: (value) {
                  // FocusScope.of(context).requestFocus(_passwordFocusNode);
                },
                // errorText: _store.formErrorStore.userEmail,
              )
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: TextFieldWidget(
                isSuffixIcon: false,
                isIcon: false,
                hint: "Sasaran Kerja",
                inputType: TextInputType.emailAddress,
                icon: Icons.location_searching,
                iconColor: Colors.black,
                colorInput: Colors.black,
                // textController: _userEmailController,
                inputAction: TextInputAction.next,
                onFieldSubmitted: (value) {
                  // FocusScope.of(context).requestFocus(_passwordFocusNode);
                },
                // errorText: _store.formErrorStore.userEmail,
              )
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(Routes.workingPlan);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(144, 17, 254, 1),
                    ),
                    child: Text('SIMPAN', textAlign: TextAlign.center, style: TextStyle(color: Colors.white)),
                  ),
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
