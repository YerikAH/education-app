// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class NoDataWidget extends StatelessWidget {
  String message;
  NoDataWidget({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          const Icon(
            Icons.library_books_rounded,
            size: 100,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.grey,
                fontSize: 18.0,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 30.0,
          ),
        ],
      ),
    );
  }
}
