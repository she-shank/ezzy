import 'package:ezzy/screens/Login/LoginViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(

      builder: (context, model, child) =>
        Scaffold(
          appBar: AppBar(
            title: Text("Login"),
          ),
          body: Column(
            children: [
              Form(
                key: model.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: model.emailController,
                      validator: model.emailValidator(model.emailController.text),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextFormField(
                      controller: model.passController,
                      validator: model.passValidator(model.passController.text),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: model.obscureText,
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  FlatButton(
                      onPressed: model.login,
                      child: Text("login")
                  ),
                  FlatButton.icon(
                      onPressed: model.changeObscure,
                      label: Text('obscure'),
                      icon: Icon((model.obscureText) ? Icons.no_encryption_sharp : Icons.remove_red_eye_sharp),
                  )
                ],
              ),
              FlatButton(
                  onPressed: model.goToSignup,
                  child: Text('not a member yet, signup now'))
            ],
          ),
        ),
      viewModelBuilder: () => LoginViewModel());
  }
}
