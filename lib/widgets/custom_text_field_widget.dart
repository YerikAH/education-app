// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  String hintText;
  TextEditingController controller;
  bool? isRequired;
  bool isObscure;
  CustomTextFieldWidget(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.isObscure,
      this.isRequired});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.black),
      cursorColor: Colors.blue,
      obscureText: isObscure,
      enableInteractiveSelection: true,
      decoration: InputDecoration(
        labelStyle: const TextStyle(color: Colors.blue),
        errorStyle: const TextStyle(color: Colors.red),
        hoverColor: Colors.black,
        filled: true,
        fillColor: Colors.white,
        focusColor: Colors.blue,
        helperStyle: TextStyle(color: Colors.blue),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black12,
            width: 1.0,
          ),
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
          borderSide: const BorderSide(color: Colors.red, width: 1.0),
          borderRadius: BorderRadius.circular(255.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.0),
          borderRadius: BorderRadius.circular(255.0),
        ),
      ),
      validator: (String? value) {
        if (value != null && value.isEmpty && isRequired == true) {
          return "Este campo es obligatorio";
        }
        return null;
      },
    );
  }
}
