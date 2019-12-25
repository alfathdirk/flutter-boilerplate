import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final IconData icon;
  final String hint;
  final String errorText;
  final bool isObscure;
  final bool isIcon;
  final TextInputType inputType;
  final TextEditingController textController;
  final EdgeInsets padding;
  final Color hintColor;
  final Color iconColor;
  final Color colorInput;
  final FocusNode focusNode;
  final ValueChanged onFieldSubmitted;
  final bool autoFocus;
  final inputAction;
  final bool isSuffixIcon;

  const TextFieldWidget({
    Key key,
    this.icon,
    this.hint,
    this.errorText,
    this.isObscure = false,
    this.inputType,
    this.textController,
    this.isIcon = true,
    this.padding = const EdgeInsets.all(0),
    this.hintColor = Colors.grey,
    this.iconColor = Colors.grey,
    this.focusNode,
    this.onFieldSubmitted,
    this.autoFocus = false,
    this.inputAction,
    this.colorInput = Colors.white,
    this.isSuffixIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
        controller: textController,
        focusNode: focusNode,
        onFieldSubmitted: onFieldSubmitted,
        autofocus: autoFocus,
        textInputAction: inputAction,
        obscureText: this.isObscure,
        keyboardType: this.inputType,
        style: TextStyle(
          color: this.colorInput,
        ),
        decoration: new InputDecoration(
            fillColor: Colors.red,
            // hintText: this.hint,
            labelText: this.hint,
            disabledBorder: InputBorder.none,
            // focusedBorder: InputBorder.none,
            // focusedBorder: OutlineInputBorder(
            //   // borderRadius: BorderRadius.all(Radius.circular(5.0)),
            //   borderSide: BorderSide(color: Colors.blue),
            // ),
            labelStyle:
                Theme.of(context).textTheme.body1.copyWith(color: hintColor),
            errorText: errorText,
            counterText: '',
            icon: this.isIcon ? Icon(this.icon, color: iconColor) : null,
            suffixIcon: this.isSuffixIcon ? Icon(this.icon, color: iconColor) : null,
        ),
      ),
    );
  }

}
