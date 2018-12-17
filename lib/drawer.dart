import 'package:flutter/material.dart';
import 'search.dart';

class SideBarDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Text('Drawer Header'),
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
        ListTile(
          title: Text('Profile'),
          onTap: () {
            
          },
        ),
        ListTile(
          title: Text('Search'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SearchScreen()
              ),
            );
          },
        ),
      ],
    );
  }
}