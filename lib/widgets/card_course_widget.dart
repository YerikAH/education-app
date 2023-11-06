import 'package:education/themes/colors.dart';
import 'package:flutter/material.dart';

class CardCourseWidget extends StatefulWidget {
  String title;
  String text;
  String image;
  String date;
  String hour;
  String? rol;
  CardCourseWidget(
      {super.key,
      required this.title,
      required this.text,
      required this.image,
      required this.date,
      required this.hour,
      this.rol});

  @override
  State<CardCourseWidget> createState() => _CardCourseWidgetState();
}

class _CardCourseWidgetState extends State<CardCourseWidget> {
  List<Color> selectColorByRol() {
    Color colorStrong = Colors.pink;
    Color colorLight = Colors.pink[300]!;
    switch (widget.rol) {
      case "ciencias":
        colorStrong = Colors.orange;
        colorLight = Colors.orange[300]!;
        break;
      case "matematicas":
        colorStrong = Colors.red;
        colorLight = Colors.red[300]!;
        break;
      case "pensamiento":
        colorStrong = Colors.blue;
        colorLight = Colors.blue[300]!;
        break;
      case "general":
        colorStrong = Colors.purple;
        colorLight = Colors.purple[300]!;
        break;
      case "arte":
        colorStrong = Colors.yellow;
        colorLight = Colors.yellow[300]!;
        break;
      case "lectura":
        colorStrong = Colors.green;
        colorLight = Colors.green[300]!;
        break;
      default:
    }
    setState(() {});
    return [colorStrong, colorLight];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270.0,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: selectColorByRol()[0],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 70,
              height: 70,
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(255.0),
                color: kBrandWhite,
              ),
              child: Image.asset(
                widget.image,
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Row(
              children: [
                SizedBox(
                  width: 55.0,
                  child: Badge(
                    backgroundColor: selectColorByRol()[1],
                    label: Text(widget.date, overflow: TextOverflow.ellipsis),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                SizedBox(
                  width: 55.0,
                  child: Badge(
                    backgroundColor: selectColorByRol()[1],
                    label: Text(
                      widget.hour,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          widget.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.w800, color: kBrandWhite),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Text(
          widget.text,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.normal,
            color: kBrandWhite,
          ),
        )
      ]),
    );
  }
}
