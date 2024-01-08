// ignore_for_file: unused_element, prefer_iterable_wheretype

import 'package:education/helpers/helpers.dart';
import 'package:education/screen/routing_screen.dart';
import 'package:education/services/services.dart';
import 'package:education/themes/colors.dart';
import 'package:education/widgets/card_notice_widget.dart';
import 'package:education/widgets/custom_app_bar_widget.dart';
import 'package:education/widgets/no_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class NoticeScreen extends StatefulWidget {
  const NoticeScreen({Key? key}) : super(key: key);

  @override
  State<NoticeScreen> createState() => _NoticeScreenState();
}

class _NoticeScreenState extends State<NoticeScreen> {
  Service service = Service();
  Helpers helper = Helpers();
  bool loader = true;
  Map<dynamic, dynamic> notices = {};
  @override
  Widget build(BuildContext context) {
    void getNotices() async {
      Map<dynamic, dynamic> noticesData = await service.getNotices();

      setState(() {
        notices = noticesData;
        loader = false;
      });
    }

    List<Widget> listToWidget() {
      List<dynamic> noticesData = notices["data"];
      List<Widget> noticeWidget = noticesData
          .where((item) => item is Map<String, dynamic>)
          .map((item) => Column(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  CardNoticeWidget(
                    text: item["descripcion"],
                    title: item["titulo"],
                    categoria: item["nombre"],
                    id: "${item['id']}",
                    date: helper.formatOnlyDate("${item["fechaCreacion"]}"),
                  ),
                ],
              ))
          .toList();
      return noticeWidget;
    }

    getNotices();
    return Scaffold(
      backgroundColor: kBrandWhite,
      appBar: CustomAppBarWidget(
        title: "Comunicados",
        beforeWidget: RoutingScreen(),
        leadingActive: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: loader
              ? SkeletonAvatar(
                  style: SkeletonAvatarStyle(
                      width: double.infinity,
                      height: 70.0,
                      borderRadius: BorderRadiusDirectional.circular(15)),
                )
              : Column(
                  children: notices["data"].length == 0
                      ? [
                          NoDataWidget(
                              message:
                                  "Aún no se subieron noticias, evento o comunidados.")
                        ]
                      : listToWidget()),
        ),
      ),
    );
  }
}
