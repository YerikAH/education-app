import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  String hintText;
  CustomTextFieldWidget({
    super.key,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.black),
      cursorColor: Colors.blue,
      decoration: InputDecoration(
        hoverColor: Colors.black,
        filled: true,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black12, width: 1.0),
          borderRadius: BorderRadius.circular(255.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black12, width: 1.0),
          borderRadius: BorderRadius.circular(255.0),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black38, fontSize: 14.0),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(255.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
