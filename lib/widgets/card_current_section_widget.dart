// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:education/helpers/helpers.dart';
import 'package:education/model/rating_model.dart';
import 'package:education/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class CardCurrentSectionWidget extends StatelessWidget {
  String section;
  String student;
  String number;
  String qualification;
  String image;
  String grade;
  CardCurrentSectionWidget(
      {Key? key,
      required this.grade,
      required this.section,
      required this.student,
      required this.qualification,
      required this.number,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Helpers helper = Helpers();
    RatingModel ratingModel = RatingModel();
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      decoration: BoxDecoration(
        color: const Color(0xFF242627),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Colegio Orion",
              style: TextStyle(
                  color: kBrandWhite,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              helper.getCurrentDate(),
              style: const TextStyle(
                  color: kBrandGray,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w700),
            )
          ],
        ),
        const SizedBox(
          height: 20.0,
        ),
        SizedBox(
          width: 200.0,
          child: Text(
            helper.toCapitalizeCase(grade),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                color: kBrandWhite,
                fontSize: 20.0,
                fontWeight: FontWeight.w900),
          ),
        ),
        Text(
          "$section $number",
          style: const TextStyle(
              color: kBrandGray, fontSize: 16.0, fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.00),
                  color: ratingModel
                      .getStateByQualification(qualification)["color"]
                      .withOpacity(0.3)),
              child: Text(
                ratingModel.getStateByQualification(qualification)["state"],
                style: TextStyle(
                    color: ratingModel
                        .getStateByQualification(qualification)["color"],
                    fontSize: 10.0,
                    fontWeight: FontWeight.w900),
              ),
            ),
            SizedBox(
              width: 150,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 80.0,
                        child: Text(
                          helper.toCapitalizeCase(student),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.end,
                          maxLines: 1,
                          style: const TextStyle(
                              color: kBrandWhite,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      const Text(
                        "Estudiante",
                        style: TextStyle(
                            color: kBrandGray,
                            fontSize: 10.0,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  SizedBox(
                    width: 40.0,
                    height: 40.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(255.0),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        fit: BoxFit.cover,
                        width: 40.0,
                        height: 40.0,
                        placeholder: (context, url) => SkeletonAvatar(
                          style: SkeletonAvatarStyle(
                              width: 40.0,
                              height: 40.0,
                              borderRadius:
                                  BorderRadiusDirectional.circular(255.0)),
                        ),
                        errorWidget: (context, url, error) => Image.asset(
                          "assets/error_user.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ]),
    );
  }
}
