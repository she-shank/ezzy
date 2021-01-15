import 'package:firebase_core/firebase_core.dart';
import 'package:ezzy/RouterService.dart';
import 'package:ezzy/services/NavigationService.dart';
import 'package:flutter/material.dart';
import 'ServiceLocator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      onGenerateRoute: RouterService.generateRoute,
      navigatorKey: locator<NavigationService>().navigatorKey,
    );
  }
}

class lod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {



    return Container();
  }
}

