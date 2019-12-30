import 'package:flutter/material.dart';
import 'package:kalaapp/router.dart';
import 'package:kalaapp/ui/absensi/absensi.dart';

class Activity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  // AbsensiStoreState _store = Constants.s();

  @override
  void initState() {
    super.initState();
    // startTimer();
  }

  void navigate(routes) {
    Navigator.of(context).pushNamed(routes);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      child: Container(
        height: size.height,
        padding: const EdgeInsets.only(top: .00),
        child: GridView.count(
            crossAxisCount: 3,
            children: <Widget>[
              GestureDetector(
                onTap: () { 
                  print('anu');
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      width: 24,
                      height: 24,
                      image: AssetImage('assets/icons/mtr_perm_contact_calendar_black.png'),
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text('STATUS', style: TextStyle(fontSize: 12)),
                    )
                  ],
                )
              ),
              GestureDetector(
                onTap: () {
                  navigate(Routes.absensi);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      width: 24,
                      height: 24,
                      image: AssetImage('assets/icons/mtr_assignment_black.png'),
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text('ABSENSI', style: TextStyle(fontSize: 12)),
                    )
                  ],
                )
              ),
              GestureDetector(
                onTap: () {
                  navigate(Routes.taskAbsensi);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      width: 24,
                      height: 24,
                      image: AssetImage('assets/icons/mtr_brightness_low_black.png'),
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text('TUGAS', style: TextStyle(fontSize: 12)),
                    )
                  ],
                )
              ),
              GestureDetector(
                onTap: () {

                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      width: 24,
                      height: 24,
                      image: AssetImage('assets/icons/mtr_gps_fixed_black.png'),
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text('BERITA', style: TextStyle(fontSize: 12)),
                    )
                  ],
                )
              ),
              GestureDetector(
                onTap: () {

                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      width: 24,
                      height: 24,
                      image: AssetImage('assets/icons/mtr_live_tv_black.png'),
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text('FINANSIAL', style: TextStyle(fontSize: 12)),
                    )
                  ],
                )
              ),
              GestureDetector(
                onTap: () {

                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      width: 24,
                      height: 24,
                      image: AssetImage('assets/icons/mtr_saving_black.png'),
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text('CUACA', style: TextStyle(fontSize: 12)),
                    )
                  ],
                )
              ),
              GestureDetector(
                onTap: () {

                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      width: 24,
                      height: 24,
                      image: AssetImage('assets/icons/mtr_stars_black.png'),
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text('PETA', style: TextStyle(fontSize: 12)),
                    )
                  ],
                )
              ),
              GestureDetector(
                onTap: () {

                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      width: 24,
                      height: 24,
                      image: AssetImage('assets/icons/status.png'),
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text('POIN', style: TextStyle(fontSize: 12)),
                    )
                  ],
                )
              ),
            ],
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
        ),
      )
    );
  }
}
