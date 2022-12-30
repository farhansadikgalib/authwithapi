import 'package:flutter/material.dart';

class InputFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;

  InputFieldWidget(this.textEditingController, this.hintText);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.cyan),
          ),
          fillColor: Colors.white60,
          hintText: hintText,
          contentPadding: EdgeInsets.only(bottom: 15),
        ),
      ),
    );
  }
}
