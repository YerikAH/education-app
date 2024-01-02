import 'package:education/helpers/helpers.dart';
import 'package:education/model/rating_model.dart';
import 'package:education/themes/colors.dart';
import 'package:flutter/material.dart';

class CardRatingWidget extends StatelessWidget {
  String course;
  String teacher;
  String qualification;
  String type;
  CardRatingWidget(
      {Key? key,
      required this.course,
      required this.teacher,
      required this.qualification,
      required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Helpers helper = Helpers();
    RatingModel ratingModel = RatingModel();
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blueGrey.withOpacity(0.05),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 125.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  helper.toCapitalizeCase(course),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 18.0,
                      color: kBrandBlack),
                ),
                Text(
                  type.toUpperCase(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: kBrandGray,
                      fontSize: 14.0),
                ),
                const SizedBox(
                  height: 20.0,
                ),
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
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                qualification,
                style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    color: kBrandBlack,
                    fontSize: 20.0),
              ),
              const Text(
                "Nota Final",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: kBrandGray,
                    fontSize: 12.0),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        helper.toCapitalizeCase(teacher),
                        style: const TextStyle(
                            color: kBrandBlack,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600),
                      ),
                      const Text(
                        "Profesor",
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
                  const SizedBox(
                    width: 40.0,
                    height: 40.0,
                    child: CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage("assets/avatar_test.jpeg"),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
