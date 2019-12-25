import 'package:flutter/material.dart';

class OtpWidget extends StatefulWidget {
  final double width;
  final int pinLength;
  final onSubmit;

  OtpWidget({
    Key key,
    this.width,
    this.pinLength = 4,
    this.onSubmit
  }) : super(key: key);
  
  @override
  _OtpWidgetState createState() => _OtpWidgetState();
}

class _OtpWidgetState extends State<OtpWidget> {
  //text controllers
  
  List _pin = [];
  List<FocusNode> _focusNodes = [];
  List<TextEditingController> _textControllers = [];

  @override
  void initState() {
    super.initState();

  }

  Widget _buildBoxInput(BuildContext context, int i) {

    FocusNode focusNode = new FocusNode();
    TextEditingController textEditingController = new TextEditingController();

    _textControllers.add(textEditingController);
    _focusNodes.add(focusNode);


    _focusNodes[i].addListener(() {
      if (_focusNodes[i].hasFocus) {
        _textControllers[i].clear();
      }
    });

    return Container(
      width: 40,
      margin: EdgeInsets.only(right: 10.0),
      child: TextField(
        controller: _textControllers[i],
        focusNode: _focusNodes[i],
        textAlignVertical: TextAlignVertical.center,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.left,
        obscureText: false,
        maxLength: 1,
        maxLines: 1,
        style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
          counter: Offstage()
          // border: OutlineInputBorder(
          //   borderSide: BorderSide(
          //     color: Colors.black,
          //   ),
          //   borderRadius: BorderRadius.all(Radius.circular(15)),
          // )
        ),
        onChanged: (String str) {
          _pin.add(str);
          if (i + 1 != widget.pinLength) {
            FocusScope.of(context).requestFocus(_focusNodes[i + 1]);
          } else {
            if(_pin.length == 4) {
              widget.onSubmit(_pin.join());
            }
            _pin = [];
            // widget.onSubmit();
          }
        },
      )
    );
  }

  Widget _buildBox(BuildContext context) {

    List<Widget> textFields = List.generate(widget.pinLength, (int i) {
      return _buildBoxInput(context, i);
    });

    FocusScope.of(context).requestFocus(_focusNodes[0]);
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        verticalDirection: VerticalDirection.down,
        children: textFields);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: _buildBox(context),
    );
  }
  
}