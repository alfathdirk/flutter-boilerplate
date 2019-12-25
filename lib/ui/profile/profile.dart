import 'package:flutter/material.dart';
import 'package:kalaapp/widgets/textfield_widget.dart';

class Profile extends StatelessWidget {

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      flexibleSpace: Image(
        // width: size.width,
        // height: 100,
        // Image.asset('assets/images/logo_white.png', height: 45 ),
        image: AssetImage('assets/images/background_login.png'),
        fit: BoxFit.cover,
      ),
      backgroundColor: Colors.transparent,
      title: Text('Profile'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                end: Alignment.topLeft,
                begin: Alignment.bottomRight,
                colors: [Color.fromRGBO(48, 35, 174, 1), Color.fromRGBO(200, 109, 215, 1)]
              )
            ),
            height: MediaQuery.of(context).size.height / 2,
            child: Center(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 30.0, bottom: 15),
                    child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT6JtxGtK1keCF_ITMKYW7HzISCjt2LbZPtnF1N9Fn_8GRVCWkt', width: 140, fit: BoxFit.cover),
                  ),
                  Text('Alfath Dirk', style: TextStyle(fontSize: 24, color: Colors.grey)),
                  Text('0815 1562 5005', style: TextStyle(fontSize: 20, color: Colors.grey)),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: new Icon(Icons.contact_phone, color: Colors.white, size: 32,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: new Icon(Icons.tv, color: Colors.white, size: 32,),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: TextFieldWidget(
              isSuffixIcon: true,
              isIcon: false,
              hint: "Status",
              hintColor: Colors.black,
              inputType: TextInputType.emailAddress,
              icon: Icons.create,
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
            padding: EdgeInsets.all(20),
            child: TextFieldWidget(
              isSuffixIcon: true,
              isIcon: false,
              hint: "Divisi",
              hintColor: Colors.black,
              inputType: TextInputType.emailAddress,
              icon: Icons.create,
              iconColor: Colors.black,
              colorInput: Colors.black,
              // textController: _userEmailController,
              inputAction: TextInputAction.next,
              onFieldSubmitted: (value) {
                // FocusScope.of(context).requestFocus(_passwordFocusNode);
              },
              // errorText: _store.formErrorStore.userEmail,
            ),
          )],
        ),
      )
    );
  }
}