import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final onTap;
  final String text;
  const MyButton({Key? key, required this.onTap, this.text = 'Hello'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.black,
          ),
          width: double.infinity,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(text, style: const TextStyle(color: Colors.white)),
            ),
          )),
    );
  }
}
