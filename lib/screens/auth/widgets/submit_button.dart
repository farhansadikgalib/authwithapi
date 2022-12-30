import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final VoidCallback onPress;
  final String title;

  const SubmitButton({Key? key, required this.title, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 50,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: [
        BoxShadow(
            color: Colors.cyan.withOpacity(0.25),
            offset: Offset(0, 0),
            blurRadius: 2,
            spreadRadius: 1)
      ]),
      child: ElevatedButton(onPressed: onPress, child: Text(title)),
    );
  }
}
