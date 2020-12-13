import 'package:ezzy/ServiceLocator.dart';
import 'package:ezzy/services/NavigationService.dart';
import 'package:flutter/material.dart';

class DialogService{
  
  final DialogKey = locator<NavigationService>().navigatorKey;
  
  dynamic show(String message){
    return showDialog(
      context: DialogKey.currentContext,
      builder: (BuildContext context){
        return Dialog(
          child: Container(
            color: Colors.indigo[400],
            padding: EdgeInsets.all(50),
            child: Text(
                message,
              style: TextStyle(
                color: Colors.white
              ),
            ),
          ),
        );
      }
    );
  }
  
}