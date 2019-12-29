import 'package:flutter/material.dart';
import 'package:loading/loading.dart';
import 'package:loading/indicator/ball_spin_fade_loader_indicator.dart';

class DialogSelectWidget extends StatelessWidget {

  final double height;
  final double width;
  final Key key;
  final onSelect;
  final List<String> data;

  const DialogSelectWidget({
    this.key,
    this.height = 300,
    this.width = 300,
    this.onSelect,
    this.data
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Container(
        padding: EdgeInsets.all(15),
        height: height,
        width: width,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () { 
                        this.onSelect(index);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(data[index]),
                          ),
                          Divider(color: Colors.grey, height: 0.7)
                        ]
                      ),
                    ),
                  );
                }
              ),
            ),
            Container(
              height: 20,
              margin: EdgeInsets.all(5),
              child: Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text('BATAL', textAlign: TextAlign.right, style: TextStyle(color: Colors.purple)),
                )
              )
            )
          ],
        )
            
      ),
    );
  }
}
