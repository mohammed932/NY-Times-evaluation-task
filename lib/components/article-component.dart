import 'package:backstone_task/models/article.dart';
import 'package:backstone_task/widgets/general.dart';
import 'package:flutter/material.dart';

class ArticleComponent extends StatelessWidget {
  final Article article;
  ArticleComponent({this.article});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          General.buildTxt(
              txt: article.title,
              isBold: true,
              lineHeight: 1.1,
              fontSize: 20.0,
              isCenter: false),
          General.sizeBoxVerical(10.0),
          General.buildTxt(
              txt: article.resultAbstract, isCenter: false, lineHeight: 1.3),
          General.sizeBoxVerical(10.0),
          FadeInImage.assetNetwork(
            image: article.media[0].mediaMetadata.last.url ?? "",
            fit: BoxFit.cover,
            placeholder: "assets/imgs/placeholder.png",
            imageScale: 3.0,
          ),
          Divider(
            height: 50.0,
            thickness: 2.0,
            color: Colors.black26,
          )
        ],
      ),
    );
  }
}
