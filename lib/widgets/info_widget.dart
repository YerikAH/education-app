import 'package:education/themes/colors.dart';
import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  String clave;
  String value;
  IconData icon;
  InfoWidget(
      {Key? key, required this.clave, required this.value, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            clave,
            style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(color: kBrandGray)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 200.0,
                  child: Text(
                    value,
                    style: TextStyle(fontSize: 14.0, color: kBrandGray),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                Icon(
                  icon,
                  color: kBrandGray,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20.0,
          )
        ],
      ),
    );
  }
}
