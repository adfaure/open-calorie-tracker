import 'package:flutter/material.dart';

class CheckBox extends StatefulWidget {
  CheckBox({Key key, @required this.initialValue, @required this.onChanged})
      : super(key: key);
  var onChanged;
  bool initialValue;

  @override
  _CheckBoxState createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  bool checked;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checked = widget.initialValue;
    checked = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        child: GestureDetector(
          child: Checkbox(
            value: checked,
            onChanged: (bool value) {
              this.setState(() {
                checked = !checked;
              });
              widget.onChanged(value);
            },
          ),
        ));
  }
}
