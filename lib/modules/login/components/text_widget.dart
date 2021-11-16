import 'package:flutter/material.dart';

class TextWidget extends StatefulWidget {
  final Icon icon;
  final String hint;
  final TextEditingController textFieldController;

  const TextWidget({
    required this.textFieldController,
    required this.icon,
    required this.hint,
  });

  @override
  _TextWidgetState createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
      child: new TextFormField(
        keyboardType: TextInputType.multiline,
        controller: widget.textFieldController,
        validator: (String? value) {
          if (value == null) {
            return 'Please Enter Username';
          }
          if (value.length <= 3) {
            return 'Please Enter Minimum 4 Length';
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
            suffixIcon:
                Padding(padding: EdgeInsets.all(0.0), child: widget.icon),
            labelText: widget.hint,
            labelStyle: TextStyle(
              color: Colors.black,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
            )),
      ),
    );
  }
}
