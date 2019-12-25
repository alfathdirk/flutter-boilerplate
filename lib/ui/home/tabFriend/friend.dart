import 'package:flutter/material.dart';
import 'package:kalaapp/ui/profile/profile.dart';


class TabFriend extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TabFriendState();
}

class _TabFriendState extends State<TabFriend> {

  List<Entry> policies = [
    new Entry('Daftar Teman (1)', [
      'git',
      'flutter',
    ]),
    new Entry('Daftar Kelompok (2)', ['google', 'swift']),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profile()),
                  );
                },
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image(
                        width: 50,
                        height: 50,
                        image: AssetImage('assets/images/background_login.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Alfath Dirk', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                          Text('Statusku', style: TextStyle(fontStyle: FontStyle.italic)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: new ListView.builder(
              itemCount: policies.length,
              itemBuilder: (context, i) {
                return new ExpansionTile(
                  title: new Text(
                    policies[i].title,
                    style: new TextStyle(
                      fontSize: 14,
                      color: Colors.black
                    ),
                  ),
                  children: <Widget>[
                    new Column(
                      children: _buildExpandableContent(policies[i]),
                    ),
                  ],
                );
              }),
            ),
          ],
        )
      ) 
    );
  }

  _buildExpandableContent(Entry policies) {
    List<Widget> columnContent = [];
    for (String content in policies.contents)
      columnContent.add(
        Container(
          child: GestureDetector(
            onTap: () {
              // print(content);
            },
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image(
                    width: 50,
                    height: 50,
                    image: AssetImage('assets/images/background_login.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                Text(content)
              ],
            ),
          ),
        )
        // new ListTile(
        //   title: new Text(
        //     content,
        //     style: new TextStyle(fontSize: 14.0, color: Colors.black),
        //   ),
        //   onTap: () {

        //   }),
      );

    return columnContent;
  }
}

class Entry {
  final String title;
  List<String> contents = [];

  static final Map<String, String> endpoints = const {
    "git": "https://github.com/",
    "google": "https://www.google.com/",
    "flutter": "https://flutter.dev/docs/get-started/install",
    "swift": "https://developer.apple.com/swift/"
  };

  Entry(this.title, this.contents);
}

