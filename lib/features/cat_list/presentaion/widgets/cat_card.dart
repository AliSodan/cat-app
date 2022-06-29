import 'package:cats_app/core/constants/app_colors.dart';
import 'package:cats_app/core/global_widgets/text_widget.dart';
import 'package:cats_app/core/utils/responsive_controlers.dart/responsive_controller.dart';
import 'package:flutter/material.dart';

class CatCard extends StatelessWidget {
  const CatCard({
    Key? key,
    required this.imgUrl,
    required this.cardContent,
    required this.description,
    required this.id,
    required this.imperial,
    required this.origin,
    required this.wikiUrl
  }) : super(key: key);
  final String imgUrl;
  final String cardContent;
  final String description;
  final String id;
  final String imperial;
  final String origin;
  final String wikiUrl;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Ratio.h(context) * 0.55,
      width: Ratio.w(context) * 0.4,
      child: Card(
        elevation: 6,
        child: GridTile(
            header: GridTileBar(
                backgroundColor: Colorful.mainColor.withOpacity(0.5),
                title: Center(
                  child: TextWidget(
                    text: cardContent,
                    textColor: Colors.white,
                    textFontSize: 18,
                    textFontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Center(
                  child: TextWidget(
                    text: id,
                    textColor: Colors.white,
                    textFontSize: 12,
                    textFontWeight: FontWeight.bold,
                  ),
                ),
                leading: TextWidget(
                  text: imperial,
                  textColor: Colors.white,
                  textFontSize: 18,
                  textFontWeight: FontWeight.bold,
                )),
            child: Image.network(
              imgUrl,
              fit: BoxFit.cover,
            ),
            footer: Container(
              height: Ratio.h(context) * 0.27,
              color: Colorful.lightPrime.withOpacity(0.4),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                     const   TextWidget(
                          text: 'origin :',
                          textColor: Colors.white,
                          textFontSize: 18,
                          textFontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          width: Ratio.w(context) * 0.15,
                        ),
                        TextWidget(
                          text: origin,
                          textColor: Colors.white,
                          textFontSize: 18,
                          textFontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Ratio.h(context) * 0.03,
                    ),
                    Row(
                      children: [
                   const     TextWidget(
                          text: 'description : ',
                          textColor: Colors.white,
                          textFontSize: 18,
                          textFontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          width: Ratio.w(context) * 0.03,
                        ),
                        Flexible(
                          child: TextWidget(
                            text: description,
                            textColor: Colors.white,
                            textFontSize: 14,
                            textFontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Ratio.h(context) * 0.03,
                    ), Row(
                      children: [
                     const   TextWidget(
                          text: 'Wikipedia Link :',
                          textColor: Colors.white,
                          textFontSize: 18,
                          textFontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          width: Ratio.w(context) * 0.15,
                        ),
                        Expanded(child: Text(wikiUrl,style: TextStyle(color: Colors.white,decoration: TextDecoration.underline),))
                        /* TextWidget(
                          text: origin,
                          textColor: Colors.white,
                          textFontSize: 18,
                          textFontWeight: FontWeight.bold,
                        ), */
                      ],
                    ),
                  ],
                ),
              ),
            )

            /*  GridTileBar(
            backgroundColor: Colorful.lightPrime,
            title: Center(
              child: TextWidget(
                text: origin,
                textColor: Colorful.darkPrime,
                textFontSize: 18,
                textFontWeight: FontWeight.bold,
              ),
            ),
            // leading:
          ), */
            ),
      ),
    );
  }
}
