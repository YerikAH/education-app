import "package:flutter/material.dart";

class CustomButtonWidget extends StatelessWidget {
  Function? onPressed;
  String text;
  CustomButtonWidget({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48.0,
      child: ElevatedButton(
        onPressed: () {
          onPressed != null ? onPressed!() : null;
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(255.0))),
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
