import 'package:ezzy/services/DialogService.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:ezzy/ServiceLocator.dart';
import 'package:ezzy/services/AuthenticationService.dart';
import 'package:ezzy/services/NavigationService.dart';

class SignupViewModel extends BaseViewModel{
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final AuthenticationService _auth =  locator<AuthenticationService>();
  final NavigationService _nav = locator<NavigationService>();
  final DialogService _dialog = locator<DialogService>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
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
      return "Enter vaild email";
    };
  }

  FormFieldValidator<String> passValidator (String value){
    return (value) {
      if(value.length < 8){
        return "Password must be atleast 8 characters length";
      }
      return null;
    };
  }

  void signup() async {
    setBusy(true);
    print('lodu');
    var result = await _auth.signUpWithEmail(
        email: emailController.text,
        password: passController.text,
        username: usernameController.text);
    print('lodu11');
    if(result is bool){
      if(result){
        print('lodulalit');
        _nav.pushReplacementNamed('/homefeed');
      } else {
        _dialog.show("please try again later");
      }
    } else {
      _dialog.show(result);
    }
  }

  void changeObscure () {
    obscureText = !obscureText;
    notifyListeners();
  }


  void goToLogin() {
    _nav.pushReplacementNamed('/Login');
  }
}