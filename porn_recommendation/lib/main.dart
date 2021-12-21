import 'package:flutter/material.dart';
import 'package:porn_recommendation/introduction/introduction.dart';
import 'package:porn_recommendation/search/search1.dart';
import 'package:porn_recommendation/search/search2.dart';
import 'package:porn_recommendation/search/search3.dart';
import 'package:porn_recommendation/style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroductionPage(),
      routes: <String, WidgetBuilder>{
        '/introduction': (BuildContext context) => IntroductionPage(),
        '/search1': (BuildContext context) => const SearchPage1(),
        '/search2': (BuildContext context) => SearchPage2(),
        '/search3': (BuildContext context) => SearchPage3(),
      },
      theme: defaultTheme(),
    );
  }
}
