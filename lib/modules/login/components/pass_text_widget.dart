import 'package:flutter/material.dart';

class PassTextWidget extends StatefulWidget {
  final String hint;
  final TextEditingController textFieldController;

  const PassTextWidget({
    required this.textFieldController,
    required this.hint,
  });

  @override
  _PassTextWidgetState createState() => _PassTextWidgetState();
}

class _PassTextWidgetState extends State<PassTextWidget> {
  bool isObsecure = true;
  IconData icons = Icons.visibility_off;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
      child: new TextFormField(
        obscureText: isObsecure,
        keyboardType: TextInputType.multiline,
        controller: widget.textFieldController,
        validator: (String? value) {
          if (value == null) {
            return 'Please Enter Password';
          }
          bool found = false;
          for (var i = 0; i < value.length; i++) {
            if (value[i].contains(new RegExp(r'[0-9]'))) {
              found = true;
            }
          }
          if (value.length <= 7) {
            return 'Please Enter Minimum 8 Length';
          } else if (!found) {
            return 'Please Enter AlphaNumeric Password';
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
            suffixIcon: GestureDetector(
                onTap: () {
                  isObsecure = !isObsecure;
                  if (isObsecure) {
                    icons = Icons.visibility_off;
                  } else {
                    icons = Icons.visibility;
                  }
                  setState(() {});
                },
                child:
                    Padding(padding: EdgeInsets.all(0.0), child: Icon(icons))),
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
