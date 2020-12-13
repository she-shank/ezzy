import 'package:ezzy/screens/Profile/ProfileView.dart';
import 'package:ezzy/screens/Signup/SignupView.dart';
import 'package:flutter/material.dart';
import 'package:ezzy/screens/Homefeed/HomefeedView.dart';
import 'package:ezzy/screens/Login/LoginView.dart';
import 'package:ezzy/screens/Startup/StartupView.dart';

class RouterService {
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case "/":
        return MaterialPageRoute(builder: (_) => StartupView());
      case "/Login":
        return MaterialPageRoute(builder: (_) => LoginView());
      case "/Signup":
        return MaterialPageRoute(builder: (_) => SignupView());
      case "/Homefeed":
        return MaterialPageRoute(builder: (_) => HomefeedView());
      case "/Profile":
        return MaterialPageRoute(builder: (_) => ProfileView(uid: settings.arguments,));
    }
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        body: Center(child: Text('Error 404'),),
      );
    });
  }
}
