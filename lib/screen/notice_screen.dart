import 'package:education/themes/colors.dart';
import 'package:education/widgets/card_notice_widget.dart';
import 'package:education/widgets/custom_app_bar_widget.dart';
import 'package:flutter/material.dart';

class NoticeScreen extends StatelessWidget {
  const NoticeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBrandWhite,
        appBar: CustomAppBarWidget(
          title: "Comunicados",
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(children: [
              const SizedBox(
                height: 20.0,
              ),
              CardNoticeWidget(
                text: 'Descripción de una noticia',
                title: 'Titulo de una noticia',
              ),
              const SizedBox(
                height: 20.0,
              ),
              CardNoticeWidget(
                text:
                    'Descripción de una noticiaDescripción de una noticiaDescripción de una noticiaDescripción de una noticiaDescripción de una noticia',
                title: 'Titulo de una noticia',
              ),
              const SizedBox(
                height: 20.0,
              ),
              CardNoticeWidget(
                text: 'Descripción de una noticia',
                title: 'Titulo de una noticia',
              ),
              const SizedBox(
                height: 20.0,
              ),
              CardNoticeWidget(
                text: 'Descripción de una noticia',
                title: 'Titulo de una noticia',
              ),
              const SizedBox(
                height: 20.0,
              ),
              CardNoticeWidget(
                text: 'Descripción de una noticia',
                title: 'Titulo de una noticia',
              ),
              const SizedBox(
                height: 20.0,
              ),
              CardNoticeWidget(
                text: 'Descripción de una noticia',
                title: 'Titulo de una noticia',
              ),
              const SizedBox(
                height: 20.0,
              ),
              CardNoticeWidget(
                text: 'Descripción de una noticia',
                title: 'Titulo de una noticia',
              ),
              const SizedBox(
                height: 20.0,
              ),
              CardNoticeWidget(
                text: 'Descripción de una noticia',
                title: 'Titulo de una noticia',
              ),
              const SizedBox(
                height: 20.0,
              ),
              CardNoticeWidget(
                text: 'Descripción de una noticia',
                title: 'Titulo de una noticia',
              ),
              const SizedBox(
                height: 20.0,
              ),
              CardNoticeWidget(
                text: 'Descripción de una noticia',
                title: 'Titulo de una noticia',
              ),
              const SizedBox(
                height: 20.0,
              ),
              CardNoticeWidget(
                text: 'Descripción de una noticia',
                title: 'Titulo de una noticia',
              ),
              const SizedBox(
                height: 20.0,
              ),
            ]),
          ),
        ));
  }
}
