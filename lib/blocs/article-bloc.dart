import 'package:backstone_task/blocs/bloc-state.dart';
import 'package:backstone_task/models/article.dart';
import 'package:backstone_task/services/api.dart';

class ArticleBloc extends GeneralBlocState {
  List<Article> _articles;

  List<Article> get articles => _articles;
  getArticles() async {
    try {
      setWaiting();
      _articles = await Api().getArticles();
      dismissWaiting();
      setError(null);
    } catch (e) {
      dismissWatingWithError();
      setError(e.toString());
      print("get articles error :$e");
    }
  }
}
