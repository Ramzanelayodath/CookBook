// @dart=2.9
import 'package:cookbook/util/app_router.dart';
import 'package:cookbook/util/url.dart';
import 'package:flutter/material.dart';
import 'package:cookbook/util/app_router.dart';
import 'package:renovation_core/core.dart';

Future<void> main() async {
  final renovationInstance = Renovation();
  await renovationInstance.init(base_url,useJWT: true);
  runApp(MyApp(AppRouter(renovationInstance)));
}

class MyApp extends StatelessWidget {
  AppRouter router;

  MyApp(this.router, { Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'cook book',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: router.generateRoute,
    );
  }
}

