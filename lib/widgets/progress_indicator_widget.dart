import 'package:flutter/material.dart';
import 'package:loading/loading.dart';
import 'package:loading/indicator/ball_spin_fade_loader_indicator.dart';

class CustomProgressIndicatorWidget extends StatelessWidget {
  const CustomProgressIndicatorWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(0, 0, 0, 0.5),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      alignment: Alignment(0.0, 0.0),
      child: Container(
        width: 180,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          // border: Border.all(
          //     color: Colors.purple,
          //     width: 1.0
          // )
        ),
        // decoration: ,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            children: <Widget>[
              Loading(indicator: BallSpinFadeLoaderIndicator(), size: 20.0, color: Colors.purple),
              Text('  Please Wait ...')
            ],
          ) 
        )
      )
    );
  }
}
