// ignore_for_file: must_be_immutable

import 'package:education/themes/colors.dart';
import 'package:flutter/material.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  String title;
  Widget beforeWidget;
  bool leadingActive;
  CustomAppBarWidget(
      {Key? key,
      required this.title,
      required this.beforeWidget,
      required this.leadingActive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: kBrandBlack,
      backgroundColor: kBrandWhite,
      shadowColor: Colors.black38,
      surfaceTintColor: kBrandWhite,
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 20.0),
      ),
      leading: leadingActive == true
          ? IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => beforeWidget));
              },
              icon: const Icon(Icons.arrow_back_ios_new_rounded))
          : const SizedBox(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
