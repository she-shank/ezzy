import 'package:ezzy/ServiceLocator.dart';
import 'package:ezzy/services/AuthenticationService.dart';
import 'package:ezzy/services/DialogService.dart';
import 'package:ezzy/services/NavigationService.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final AuthenticationService _auth =  locator<AuthenticationService>();
  final NavigationService _nav = locator<NavigationService>();
  final DialogService _dialog = locator<DialogService>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final RegExp emailVerifier = RegExp('^[a-z0-9]+@[a-z]+.[a-z]+');
  bool obscureText = true;

  FormFieldValidator<String> emailValidator (String value){
    return (value) {
      if(value == null){
        return "Email cannot be left blank";
      }
      if(emailVerifier.hasMatch(value)){
        return null;
      }
      return "Enter valid email";
    };
  }

  FormFieldValidator<String> passValidator (String value){
    return (value) {
      if(value.length < 8){
        return "Password must be at least 8 characters length";
      }
      return null;
    };
  }

  void login() async {
    if(formKey.currentState.validate()){
      setBusy(true);
      var result = await _auth.loginWithEmail(
          email: emailController.text, password: passController.text);
      if (result is bool) {
        if (result) {
          _nav.pushReplacementNamed('/Homefeed');
        } else {
          _dialog.show("please try again later");
        }
      } else {
        _dialog.show(result);
      }
      setBusy(false);
    }
  }

  void changeObscure () {
    obscureText = !obscureText;
    notifyListeners();
  }


  void goToSignup() {
    _nav.pushReplacementNamed('/Signup');
  }
}