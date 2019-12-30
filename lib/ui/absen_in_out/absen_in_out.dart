import 'package:flutter/material.dart';
import 'package:kalaapp/injector/modules/store_component.dart';
import 'package:kalaapp/widgets/textfield_widget.dart';

class Todo {
  final title;
  Todo(this.title);
}

class AbsenInOut extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AbsenInOutState();
}

class _AbsenInOutState extends State<AbsenInOut> {
  final _store = StoreComponents.absensiState;

  @override
  void initState() {
    super.initState();
    print(_store.getAbsen());
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      flexibleSpace: Image(
        image: AssetImage('assets/images/background_login.png'),
        fit: BoxFit.cover,
      ),
      backgroundColor: Colors.transparent,
      title: Text(_store.getTitle()),
    );
  }

  Widget _buildBody(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      margin: EdgeInsets.all(10),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Silakan mengambil foto selfie saat ini'),
          GestureDetector(
            onTap: () {
              print('camera aktif');
            },
            child: Container(
              margin: EdgeInsets.all(20),
              width: 125,
              height: 125,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/images/background_login.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: TextFieldWidget(
              isSuffixIcon: true,
              isIcon: false,
              hint: "Emosi saat ini",
              hintColor: Colors.black,
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
              hint: "Lokasi saat ini",
              hintColor: Colors.black,
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
                onTap: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(144, 17, 254, 1),
                  ),
                  child: Text('PILIH', textAlign: TextAlign.center, style: TextStyle(color: Colors.white)),
                ),
              )
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }
 
}
