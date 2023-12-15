// ignore_for_file: avoid_print

import 'package:cached_network_image/cached_network_image.dart';
import 'package:education/themes/colors.dart';
import 'package:education/widgets/custom_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class OneNoticeScreen extends StatelessWidget {
  const OneNoticeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBrandWhite,
      appBar: CustomAppBarWidget(title: "Una increible noticia"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Una increible noticia",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w900,
                    color: kBrandBlack),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const SizedBox(
                width: double.infinity,
                child: Row(children: [
                  SizedBox(
                    width: 40.0,
                    height: 40.0,
                    child: CircleAvatar(
                      radius: 55,
                      backgroundImage: NetworkImage(""),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Jose Vargas",
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w800,
                            color: kBrandBlack),
                      ),
                      Text("15-11-23")
                    ],
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
                    imageUrl:
                        'http://images.pexels.com/photos/19011374/pexels-photo-19011374/free-photo-of-nieve-casas-edificio-montana.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              HtmlWidget(
                '''
                  <div id="content" class="mt-5 mb-5"><p class="ql-align-justify">Lorem ipsum dolor sit amet, consectetur adipiscing elit. In ullamcorper lacus iaculis tortor efficitur, vel luctus lorem pharetra. Duis elit odio, rutrum sed justo vitae, volutpat lobortis tellus. Sed eget justo posuere, tincidunt purus ut, rutrum libero. Pellentesque purus eros, sagittis vel interdum nec, efficitur vitae lectus. Praesent nec lectus convallis, placerat sem at, tempus nulla. Aenean pharetra mi a sapien porta aliquam. Cras lorem ante, venenatis vitae enim ultricies, dignissim aliquam urna. Curabitur nec nunc ac ante sollicitudin efficitur vel ac tortor. Ut consectetur dui nec imperdiet consequat. Nunc interdum arcu non venenatis maximus. Aliquam ornare viverra turpis, eu placerat nisl semper ut. Mauris iaculis mi velit, nec egestas mi lacinia id.</p><p class="ql-align-justify">Integer blandit placerat sem, vel venenatis risus suscipit a. Etiam dignissim suscipit arcu, ac suscipit eros scelerisque vitae. Suspendisse mollis tortor vitae magna facilisis scelerisque. Duis dapibus dignissim erat sed ullamcorper. Nulla facilisi. Vestibulum tempus facilisis nisl ut porttitor. Curabitur eget lobortis lorem. Interdum et malesuada fames ac ante ipsum primis in faucibus. Etiam ut tristique nibh, sed vehicula sapien.</p><p><br></p></div>
                ''',
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
            ],
          ),
        ),
      ),
    );
  }
}
