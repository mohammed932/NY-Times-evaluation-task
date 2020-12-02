import 'package:backstone_task/blocs/article-bloc.dart';
import 'package:backstone_task/components/article-component.dart';
import 'package:backstone_task/screens/details/details.dart';
import 'package:backstone_task/widgets/general.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ArticleBloc _articleBloc;
  void initState() {
    super.initState();
    _init();
  }

  _init() async {
    await Future.delayed(Duration(milliseconds: 200));
    _articleBloc = Provider.of<ArticleBloc>(context, listen: false);
    _articleBloc.getArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: General.buildTxt(txt: "NY Times Most Popular"),
        ),
        body: Consumer<ArticleBloc>(builder: (BuildContext context, state, __) {
          if (state.error != null) {
            return Center(child: General.buildTxt(txt: state.error));
          } else if (state.hasData) {
            return Container(
              child: ListView.builder(
                itemCount: 10,
                padding: EdgeInsets.all(15.0),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                    article: state.articles[index],
                                  )));
                    },
                    child: ArticleComponent(
                      article: state.articles[index],
                    ),
                  );
                },
              ),
            );
          } else {
            return Shimmer.fromColors(
              baseColor: Colors.grey[300],
              highlightColor: Colors.grey[100],
              enabled: true,
              child: Container(
                child: ListView.builder(
                    itemCount: 6,
                    padding: EdgeInsets.all(15.0),
                    shrinkWrap: true,
                    itemBuilder: (_, __) {
                      return Container(
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(5.0)),
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: 10.0),
                        height: 350.0,
                      );
                    }),
              ),
            );
          }
        }));
  }
}
