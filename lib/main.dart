import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marvel_app/Locator_service.dart';
import 'package:marvel_app/ui/Views/DetailCharcterView.dart';
import 'package:marvel_app/ui/Views/HomeView.dart';
import 'package:marvel_app/ui/Views/SearchView.dart';

void main() {
  //get it dependeny injection
  SetupLoctor();
  runApp(MyApp());
  // make the oreientation vertical
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marvel App',
      theme: ThemeData(
        fontFamily: 'JannaLT',
        primarySwatch: Colors.grey,
      ),
      home: HomeVieww(),
      routes: {
        SearchView.routname: (context) => SearchView(),
        DetailCharcter.routname: (context) => DetailCharcter()
      },
    );
  }
}
