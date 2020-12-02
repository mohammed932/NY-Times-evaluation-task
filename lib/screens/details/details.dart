import 'package:backstone_task/models/article.dart';
import 'package:backstone_task/widgets/general.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final Article article;
  DetailsScreen({this.article});
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          padding: EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                General.buildTxt(
                    txt: widget.article.title,
                    isBold: true,
                    lineHeight: 1.1,
                    fontSize: 20.0,
                    isCenter: false),
                General.sizeBoxVerical(10.0),
                FadeInImage.assetNetwork(
                  image: widget.article.media[0].mediaMetadata.last.url ?? "",
                  fit: BoxFit.cover,
                  placeholder: "assets/imgs/placeholder.png",
                  imageScale: 3.0,
                ),
                General.sizeBoxVerical(10.0),
                General.buildTxt(
                    txt: "${widget.article.byline}",
                    isBold: true,
                    lineHeight: 1.1,
                    fontSize: 12.0,
                    isCenter: false),
                General.sizeBoxVerical(10.0),
                General.buildTxt(
                    // txt: widget.article.publishedDate.toString(),
                    txt: formatDate(widget.article.publishedDate,
                        [dd, '/', mm, '/', yy, ' ', HH, ':', nn, ' ', am]),
                    lineHeight: 1.1,
                    fontSize: 12.0,
                    isCenter: false),
                General.sizeBoxVerical(20.0),
                General.buildTxt(
                    txt: widget.article.resultAbstract,
                    isCenter: false,
                    lineHeight: 1.3)
              ],
            ),
          ),
        ));
  }
}
