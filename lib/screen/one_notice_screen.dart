// ignore_for_file: avoid_print, must_be_immutable
import 'package:cached_network_image/cached_network_image.dart';
import 'package:education/constant/constant.dart';
import 'package:education/screen/notice_screen.dart';
import 'package:education/services/services.dart';
import 'package:education/themes/colors.dart';
import 'package:education/widgets/custom_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:skeletons/skeletons.dart';

import '../helpers/helpers.dart';

class OneNoticeScreen extends StatefulWidget {
  String id;
  String titleNav;
  OneNoticeScreen({Key? key, required this.id, required this.titleNav})
      : super(key: key);

  @override
  State<OneNoticeScreen> createState() => _OneNoticeScreenState();
}

class _OneNoticeScreenState extends State<OneNoticeScreen> {
  Service service = Service();
  Helpers helper = Helpers();
  bool loader = true;
  Map<dynamic, dynamic> notice = {
    "message": "",
    "status": 404,
    "data": {
      "titulo": "",
      "portada": "",
      "descripcion": "",
      "fechaCreacion": "",
      "imagen": "",
      "usu_nombre": ""
    }
  };

  @override
  Widget build(BuildContext context) {
    String urlImage = "${Constant.serverImagesUser}${notice["data"]["imagen"]}";
    String urlPortada = notice["data"]["portada"];
    void getNotice() async {
      Map<dynamic, dynamic> noticeData = await service.getNotice(widget.id);

      setState(() {
        notice = noticeData;
        loader = false;
        urlPortada = "${notice["data"]["portada"]}";
      });
    }

    getNotice();
    return Scaffold(
      backgroundColor: kBrandWhite,
      appBar: CustomAppBarWidget(
        title: widget.titleNav,
        beforeWidget: const NoticeScreen(),
        leadingActive: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Skeleton(
                isLoading: loader,
                skeleton: SkeletonLine(
                    style: SkeletonLineStyle(
                        width: 200.0,
                        height: 16.0,
                        borderRadius: BorderRadius.circular(5.0))),
                child: Text(
                  "${notice["data"]["titulo"]}",
                  style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w900,
                      color: kBrandBlack),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              SizedBox(
                width: double.infinity,
                child: Row(children: [
                  SizedBox(
                    width: 40.0,
                    height: 40.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(200.0),
                      child: CachedNetworkImage(
                        imageUrl: urlImage,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => SkeletonAvatar(
                          style: SkeletonAvatarStyle(
                              width: 40.0,
                              height: 40.0,
                              borderRadius:
                                  BorderRadiusDirectional.circular(200.0)),
                        ),
                        errorWidget: (context, url, error) => Image.asset(
                          "assets/error_user.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Container(
                    child: !loader
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${notice["data"]["usu_nombre"]}",
                                style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w800,
                                    color: kBrandBlack),
                              ),
                              Text(helper.formatOnlyDate(
                                  "${notice["data"]["fechaCreacion"]}"))
                            ],
                          )
                        : const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SkeletonAvatar(
                                style: SkeletonAvatarStyle(
                                    width: 150, height: 10.0),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              SkeletonAvatar(
                                style: SkeletonAvatarStyle(
                                    width: 120, height: 10.0),
                              ),
                            ],
                          ),
                  )
                ]),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: double.infinity,
                height: 250.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: CachedNetworkImage(
                    imageUrl: "${Constant.serverBackgroundNotice}$urlPortada",
                    fit: BoxFit.cover,
                    placeholder: (context, url) => SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                          width: double.infinity,
                          height: 250.0,
                          borderRadius: BorderRadiusDirectional.circular(20.0)),
                    ),
                    errorWidget: (context, url, error) => Image.asset(
                      "assets/error_portada.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Container(
                child: loader
                    ? SkeletonParagraph(
                        style: SkeletonParagraphStyle(
                            lines: 10,
                            spacing: 4,
                            lineStyle: SkeletonLineStyle(
                              randomLength: true,
                              height: 10,
                              borderRadius: BorderRadius.circular(4),
                              minLength:
                                  MediaQuery.of(context).size.width / 1.5,
                            )),
                      )
                    : HtmlWidget(
                        "${notice["data"]["descripcion"]}",
                        customStylesBuilder: (element) {
                          if (element.classes.contains('foo')) {
                            return {'color': 'red'};
                          }

                          return null;
                        },
                        onTapUrl: (url) {
                          print("the url is $url");
                          return false;
                        },
                        renderMode: RenderMode.column,
                        textStyle: const TextStyle(fontSize: 14),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
