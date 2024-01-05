import 'package:cached_network_image/cached_network_image.dart';
import 'package:education/constant/constant.dart';
import 'package:education/helpers/helpers.dart';
import 'package:education/providers/user_provider.dart';
import 'package:education/screen/routing_screen.dart';
import 'package:education/themes/colors.dart';
import 'package:education/widgets/custom_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:skeletons/skeletons.dart';
import 'package:intl/intl.dart';

class LicenseScreen extends StatefulWidget {
  const LicenseScreen({Key? key}) : super(key: key);

  @override
  State<LicenseScreen> createState() => _LicenseScreenState();
}

class _LicenseScreenState extends State<LicenseScreen> {
  String _currentTime = '';

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    _updateTime();
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  void _updateTime() {
    setState(() {
      _currentTime = DateFormat('HH:mm:ss').format(DateTime.now());
    });

    Future.delayed(const Duration(seconds: 1), _updateTime);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width - 60;
    double photoWidth = screenWidth / 2 - 10;
    Helpers help = Helpers();
    String path = context.watch<UserProvider>().user['data']['imagen'];
    String urlImage = "${Constant.serverImagesUser}$path";
    return Scaffold(
        backgroundColor: kBrandWhite,
        appBar: CustomAppBarWidget(
            title: 'Fotocheck',
            beforeWidget: const RoutingScreen(),
            leadingActive: true),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: photoWidth,
                        height: photoWidth,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: CachedNetworkImage(
                            imageUrl: urlImage,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => SkeletonAvatar(
                              style: SkeletonAvatarStyle(
                                  width: photoWidth,
                                  height: photoWidth,
                                  borderRadius:
                                      BorderRadiusDirectional.circular(10.0)),
                            ),
                            errorWidget: (context, url, error) => Image.asset(
                              "assets/error_user.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            width: photoWidth,
                            height: photoWidth / 1.5,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.asset(
                                  'assets/splashx4_invert.png',
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Container(
                            width: photoWidth,
                            height: photoWidth / 3,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10.0)),
                            child: const Center(
                              child: Text(
                                "ESTUDIANTE",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 14.0,
                                    letterSpacing: 2.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      help.toCapitalizeCase(context
                          .watch<UserProvider>()
                          .user['data']['apellido']),
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w800,
                          color: kBrandBlack),
                    ),
                    Text(
                      help.toCapitalizeCase(
                          context.watch<UserProvider>().user['data']['nombre']),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w800,
                          color: kBrandBlack),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "${context.watch<UserProvider>().user['data']['usuario']}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.blueAccent),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          const TextSpan(
                              text: 'Identificación: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16.0,
                                  height: 2.0,
                                  fontFamily: "NunitoSans",
                                  color: kBrandGray)),
                          TextSpan(
                              text:
                                  "${context.watch<UserProvider>().user['data']['dni']}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontFamily: "NunitoSans",
                                  fontSize: 16.0,
                                  height: 2.0,
                                  color: kBrandGray)),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          const TextSpan(
                              text: 'Aula: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16.0,
                                  height: 2.0,
                                  fontFamily: "NunitoSans",
                                  color: kBrandGray)),
                          TextSpan(
                              text:
                                  "${context.watch<UserProvider>().user['data']['aula']} ${context.watch<UserProvider>().user['data']['numero']} ${context.watch<UserProvider>().user['data']['seccion']}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontFamily: "NunitoSans",
                                  height: 2.0,
                                  fontSize: 16.0,
                                  color: kBrandGray)),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          const TextSpan(
                              text: 'Grado: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16.0,
                                  height: 2.0,
                                  fontFamily: "NunitoSans",
                                  color: kBrandGray)),
                          TextSpan(
                              text: help.toFirstCapitalizeCase(
                                  "${context.watch<UserProvider>().user['data']['grado']} de ${context.watch<UserProvider>().user['data']['nivel']}"),
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  height: 2.0,
                                  fontFamily: "NunitoSans",
                                  fontSize: 16.0,
                                  color: kBrandGray)),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          const TextSpan(
                              text: 'Dirección: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16.0,
                                  fontFamily: "NunitoSans",
                                  height: 2.0,
                                  color: kBrandGray)),
                          TextSpan(
                              text:
                                  "${context.watch<UserProvider>().user['data']['direccion']}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontFamily: "NunitoSans",
                                  fontSize: 16.0,
                                  height: 2.0,
                                  color: kBrandGray)),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    Container(
                      width: double.infinity,
                      height: 6.0,
                      decoration: BoxDecoration(
                          color: Colors.blueAccent[200],
                          borderRadius: BorderRadius.circular(255)),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Container(
                      width: double.infinity,
                      height: 8.0,
                      decoration: BoxDecoration(
                          color: Colors.blueAccent[200],
                          borderRadius: BorderRadius.circular(255)),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Container(
                      width: double.infinity,
                      height: 8.5,
                      decoration: BoxDecoration(
                          color: Colors.blueAccent[200],
                          borderRadius: BorderRadius.circular(255)),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        QrImageView(
                          data: context
                              .watch<UserProvider>()
                              .user['data']['dni']
                              .toString(),
                          version: QrVersions.auto,
                          size: 150.0,
                          eyeStyle: const QrEyeStyle(
                              eyeShape: QrEyeShape.square, color: Colors.black),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Text(
                              "Hora actual:",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: kBrandBlack,
                                  fontWeight: FontWeight.normal),
                            ),
                            Text(
                              _currentTime,
                              style: const TextStyle(
                                  fontSize: 24.0,
                                  color: kBrandBlack,
                                  fontWeight: FontWeight.w900,
                                  fontStyle: FontStyle.italic),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Text(
                              "Día actual:",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: kBrandBlack,
                                  fontWeight: FontWeight.normal),
                            ),
                            Text(
                              help.getCurrentDate(),
                              style: const TextStyle(
                                  fontSize: 24.0,
                                  color: kBrandBlack,
                                  fontWeight: FontWeight.w900,
                                  fontStyle: FontStyle.italic),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
