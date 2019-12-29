// import 'package:kalaapp/data/sharedpref/constants/preferences.dart';
import 'package:kalaapp/constants/constant.dart';
import 'package:kalaapp/router.dart';
import 'package:kalaapp/store/login/login.dart';

import 'package:kalaapp/widgets/progress_indicator_widget.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:kalaapp/ui/home/tabFriend/friend.dart';
import 'package:kalaapp/ui/home/tabActivity/activity.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //store
  final _store = FormLoginStore();
  int _menuIndex = 0;

  List<Widget> bodyWidget = <Widget>[
    TabFriend(),
    Text('2'),
    Activity(),
    Text('3'),
    Text('4'),
  ];

  @override
  void initState() {
    super.initState();
    // _store.loading = false;
    //get all posts
    // _store.getPosts(url: '/auth/testget');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            _menuIndex = index;
          });
        },
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: 0, // this will be set when a new tab is tapped
        type: BottomNavigationBarType.fixed,
       items: [
         BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(250, 250, 250, 1),
            icon: new Icon(Icons.person, color: Colors.grey),
            title: new Text('Teman', style: TextStyle(color: Colors.grey)),
         ),
         BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(250, 250, 250, 1),
            icon: new Icon(Icons.chat_bubble_outline, color: Colors.grey),
            title: new Text('Obrolan', style: TextStyle(color: Colors.grey)),
         ),
         BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(250, 250, 250, 1),
            icon: new Icon(Icons.adjust, color: Colors.grey),
            title: new Text('Aktifitas', style: TextStyle(color: Colors.grey)),
         ),
         BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(250, 250, 250, 1),
            icon: new Icon(Icons.ondemand_video, color: Colors.grey),
            title: new Text('OlahOtak', style: TextStyle(color: Colors.grey)),
         ),
         BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(250, 250, 250, 1),
            icon: new Icon(Icons.settings, color: Colors.grey),
            title: new Text('Aturan', style: TextStyle(color: Colors.grey)),
         ),
       ],
     ),
      body: _buildBody(),
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
      backgroundColor: Colors.transparent,
      leading:IconButton(
        color: Colors.white,
        onPressed: () {
          SharedPreferences.getInstance().then((preference) {
            preference.setBool(Constants.is_logged_in, false);
            preference.setString(Constants.auth_token, '');
            Navigator.of(context).pushReplacementNamed(Routes.login);
          });
        },
        icon: Icon(
          Icons.create,
        ),
      ),
      title: Container(
        child: Image.asset('assets/images/logo_white.png', height: 20 ),
      ),
      actions: <Widget>[
        IconButton(
          color: Colors.white,
          onPressed: () {
            SharedPreferences.getInstance().then((preference) {
              preference.setString(Constants.auth_token, '');
              preference.setBool(Constants.is_logged_in, false);
              Navigator.of(context).pushReplacementNamed(Routes.login);
            });
          },
          icon: Icon(
            Icons.person_add,
          ),
        )
      ],
    );
  }

  Widget _buildBody() {
    return Stack(
      children: <Widget>[
        Observer(
          builder: (context) {
            return _store.loading
                ? CustomProgressIndicatorWidget()
                : Material(child: _buildListView());
          },
        ),
      ],
    );
  }

  Widget _buildListView() {
    return bodyWidget[_menuIndex];
    // return _store.dataList != null
    //     ? ListView.separated(
    //         itemCount: _store.dataList.posts.length,
    //         separatorBuilder: (context, position) {
    //           return Divider();
    //         },
    //         itemBuilder: (context, position) {
    //           return ListTile(
    //             leading: Icon(Icons.cloud_circle),
    //             title: Text(
    //               '${_store.dataList.posts[position].id}',
    //               maxLines: 1,
    //               overflow: TextOverflow.ellipsis,
    //               softWrap: false,
    //               style: Theme.of(context).textTheme.title,
    //             ),
    //             subtitle: Text(
    //               '${_store.dataList.posts[position].body}',
    //               maxLines: 1,
    //               overflow: TextOverflow.ellipsis,
    //               softWrap: false,
    //             ),
    //           );
    //         },
    //       )
    //     : Center(child: Text('No posts found'));
  }

  // General Methods:-----------------------------------------------------------
  showErrorMessage(BuildContext context, String message) {
    Future.delayed(Duration(milliseconds: 0), () {
      if (message != null) {
        FlushbarHelper.createError(
          message: message,
          title: 'Error',
          duration: Duration(seconds: 3),
        )..show(context);
      }
    });

    return Container();
  }
}
