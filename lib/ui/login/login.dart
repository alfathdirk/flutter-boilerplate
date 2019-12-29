// import 'package:kalaapp/constants/strings.dart';
// import 'package:kalaapp/data/sharedpref/constants/preferences.dart';
import 'package:kalaapp/constants/constant.dart';
import 'package:kalaapp/router.dart';
import 'package:kalaapp/store/login/login.dart';
import 'package:kalaapp/widgets/empty_app_bar_widget.dart';
import 'package:kalaapp/widgets/progress_indicator_widget.dart';
import 'package:kalaapp/widgets/rounded_button_widget.dart';
import 'package:kalaapp/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flushbar/flushbar_helper.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //text controllers
  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  //focus node
  FocusNode _passwordFocusNode;

  //form key
  final _formKey = GlobalKey<FormState>();

  //store
  final _store = FormLoginStore();

  bool _isLogin = true;


  @override
  void initState() {
    super.initState();

    _passwordFocusNode = FocusNode();

    _userEmailController.addListener(() {
      //this will be called whenever user types in some value
      _store.setUserId(_userEmailController.text);
    });
    _passwordController.addListener(() {
      //this will be called whenever user types in some value
      _store.setPassword(_passwordController.text);
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    _userEmailController.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }


  void _onWidgetTapped(bool index) {
    setState(() {
      _isLogin = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      appBar: EmptyAppBar(),
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: _buildBody(),
      ),
    );
  }

  Material _buildBody() {
    Size size = MediaQuery.of(context).size;
    return Material(
      color: Color.fromRGBO(152, 89, 205, 1),
      child: Stack(
        children: <Widget>[
          Center(
            child: new Image.asset(
              'assets/images/background_login.png',
              width: size.width,
              height: size.height,
              fit: BoxFit.fill,
            ),
          ),
          OrientationBuilder(
            builder: (context, orientation) {
              var child;
              orientation == Orientation.landscape
                  ? child = Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: _buildLeftSide(),
                        ),
                        Expanded(
                          flex: 1,
                          child: _buildRightSide(),
                        ),
                      ],
                    )
                  : child = Center(child: _buildRightSide());

              return child;
            },
          ),
          // login Success
          // Observer(
          //   builder: (context) {
          //     return _store.dataList != null ? Text('${_store.dataList.token}') : Container();
          //   },
          // ),
          Observer(
            builder: (context) {
              return _store.success
                  ? navigate(context)
                  : showErrorMessage(context, _store.errorStore.errorMessage);
            },
          ),
          // loading
          // Observer(
          //   builder: (context) {
          //     return Visibility(
          //       visible: _store.loading,
          //       child: CustomProgressIndicatorWidget()
          //     );
          //   }
          // )
        ],
      ),
    );
  }

  Widget _buildLeftSide() {
    return SizedBox.expand(
      child: Image.asset(
        'assets/images/img_login.jpg',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildRightSide() {
    var size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[ 
          Padding(
            padding: EdgeInsets.only(top: 30, bottom: 10),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 30, left: 30, right: 30),
                  child: Image.asset('assets/images/logo_white.png', height: 45 ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 20),
                  child: Text("Selamat datang di Kala", style: TextStyle(color: Colors.white, fontSize: 16 )),
                ),
                // AppIconWidget(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () { 
                        _onWidgetTapped(true);
                      },
                      child: Text("MASUK ", style: TextStyle(
                        color: Colors.white,
                        fontWeight: _isLogin ? FontWeight.bold : FontWeight.normal,
                        decoration: _isLogin ? TextDecoration.underline : TextDecoration.none
                        )
                      ),
                    ),
                    Text(' atau ', style: TextStyle(color: Colors.white)),
                    GestureDetector(
                      onTap: () {
                        _store.getToken();
                        _onWidgetTapped(false);
                      },
                      child: Text(" REGISTRASI", style: TextStyle(color: Colors.white, fontWeight: !_isLogin ? FontWeight.bold : FontWeight.normal, decoration: !_isLogin ? TextDecoration.underline : TextDecoration.none)),
                    ),
                  ],
                )
                
              ],
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 24.0),
                  _isLogin ? _buildUserIdField() : _buildRegistWidget(),
                  // _buildPasswordField(),
                  // _buildForgotPasswordButton(),
                  !_isLogin ? _buildRegistButton() : _buildSignInButton(),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: _isLogin ? Text('Tidak dapat "MASUK" ?', textAlign: TextAlign.center, style: TextStyle(color: Colors.white)) : null
                  ),
                ],
              ),
            ),
          ),
        ]
      )
    );
  }

  Widget _buildRegistWidget() {
   return Observer(
      builder: (context) {
        return Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: TextFieldWidget(
                hint: "Nama / nomor personal pekerja",
                isIcon: false,
                hintColor: Colors.white,
                inputType: TextInputType.emailAddress,
                icon: Icons.email,
                iconColor: Colors.white,
                textController: _userEmailController,
                inputAction: TextInputAction.next,
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(_passwordFocusNode);
                },
                errorText: _store.formErrorStore.userEmail,
              )
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: TextFieldWidget(
                isIcon: false,
                hint: "No Telepon",
                hintColor: Colors.white,
                inputType: TextInputType.emailAddress,
                icon: Icons.email,
                iconColor: Colors.white,
                textController: _userEmailController,
                inputAction: TextInputAction.next,
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(_passwordFocusNode);
                },
                errorText: _store.formErrorStore.userEmail,
              )
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: TextFieldWidget(
                isIcon: false,
                hint: "Email",
                hintColor: Colors.white,
                inputType: TextInputType.emailAddress,
                icon: Icons.email,
                iconColor: Colors.white,
                textController: _userEmailController,
                inputAction: TextInputAction.next,
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(_passwordFocusNode);
                },
                errorText: _store.formErrorStore.userEmail,
              )
            ),
          ]
      );
      },
    ); 
  }

  Widget _buildUserIdField() {
    return Observer(
      builder: (context) {
        return TextFieldWidget(
          hint: 'Login Email',
          hintColor: Colors.white,
          isIcon: false,
          inputType: TextInputType.emailAddress,
          icon: Icons.email,
          iconColor: Colors.white,
          textController: _userEmailController,
          inputAction: TextInputAction.next,
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(_passwordFocusNode);
          },
          errorText: _store.formErrorStore.userEmail,
        );
      },
    );
  }
  
  Widget _buildPasswordField() {
    return Observer(
      builder: (context) {
        return TextFieldWidget(
          hint: 'password',
          isObscure: true,
          padding: EdgeInsets.only(top: 16.0),
          icon: Icons.lock,
          iconColor: Colors.black54,
          textController: _passwordController,
          focusNode: _passwordFocusNode,
          errorText: _store.formErrorStore.password,
        );
      },
    );
  }

  Widget _buildForgotPasswordButton() {
    return Align(
      alignment: FractionalOffset.centerRight,
      child: FlatButton(
        padding: EdgeInsets.all(0.0),
        child: Text(
          'Lupa Password',
          style: Theme.of(context)
              .textTheme
              .caption
              .copyWith(color: Colors.orangeAccent),
        ),
        onPressed: () {},
      ),
    );
  }

  Widget _buildSignInButton() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: RoundedButtonWidget(
        buttonText: 'LOGIN',
        buttonColor: Colors.white,
        textColor: Colors.black,
        isBold: true,
        onPressed: () async {
          // print('asd');
          // if (_store.canLogin) {
            return _store.login();
          // } else {
          //   showErrorMessage(context, 'Please fill in all fields');
          // }
        },
      ),
    );
  }

  Widget _buildRegistButton() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: RoundedButtonWidget(
        buttonText: "REGISTRASI",
        buttonColor: Colors.white,
        textColor: Colors.black,
        isBold: true,
        onPressed: () async {
          if (_store.canLogin) {
            _store.login();
          } else {
            showErrorMessage(context, 'Please fill register in all fields');
          }
        },
      ),
    );
  }

  // General Methods:-----------------------------------------------------------
  showErrorMessage(BuildContext context, String message) {
    if(message != null) {
      return FlushbarHelper.createError(
        message: message,
        title: 'Error',
        duration: Duration(seconds: 3),
      )
        ..show(context);
    }
    return Container();
  }

  Widget navigate(BuildContext context) {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool(Constants.is_logged_in, true);
    });

    Future.delayed(Duration(milliseconds: 0), () {
      Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.otp, (Route<dynamic> route) => false);
    });

    return Container();
  }
}
