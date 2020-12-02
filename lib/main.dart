import 'package:backstone_task/screens/home/home.dart';
import 'package:backstone_task/widgets/general.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'blocs/article-bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Widget _defaultHome = HomeScreen();
  runApp(app(_defaultHome));
}

Widget app(Widget startScreen) {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider<ArticleBloc>.value(
        value: ArticleBloc(),
      ),
    ],
    child: MyApp(
      defaultHome: startScreen,
    ),
  );
}

class MyApp extends StatefulWidget {
  final Widget defaultHome;
  MyApp({this.defaultHome});
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'Swissra',
          primaryColor: Color(General.getColorHexFromStr('#00e8c1')),
          accentColor: Color(General.getColorHexFromStr('#99f1e2')),
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
              brightness: Brightness.light,
              iconTheme: IconThemeData(
                color: Colors.black,
              )),
          brightness: Brightness.light),
      debugShowCheckedModeBanner: false,

      supportedLocales: [
        const Locale('ar', ''), // Arabic
        const Locale('en', ''), // English
      ],
      // home: widget.defaultHome,
      home: widget.defaultHome,
    );
  }
}
