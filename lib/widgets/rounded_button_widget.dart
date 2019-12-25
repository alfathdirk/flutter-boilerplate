import 'package:flutter/material.dart';

class RoundedButtonWidget extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final Color textColor;
  final VoidCallback onPressed;
  final bool isBold;

  const RoundedButtonWidget({
    Key key,
    this.buttonText,
    this.isBold,
    this.buttonColor,
    this.textColor = Colors.white,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: buttonColor,
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(4.0),
        // side: BorderSide(color: Colors.red)
      ),
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: TextStyle(color: textColor, fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
      ),
    );
  }
}
