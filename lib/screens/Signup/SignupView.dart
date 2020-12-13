import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:ezzy/screens/Signup/SignupViewModel.dart';

class SignupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignupViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
            appBar: AppBar(
              title: Text("Signup"),
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
                        controller: model.usernameController,
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
                        onPressed: model.signup,
                        child: Text("Signup")
                    ),
                    FlatButton.icon(
                      onPressed: model.changeObscure,
                      label: Text('obscure'),
                      icon: Icon((model.obscureText) ? Icons.no_encryption_sharp : Icons.remove_red_eye_sharp),
                    )
                  ],
                ),
                FlatButton(
                    onPressed: model.goToLogin,
                    child: Text('already a member, login now'))
              ],
            ),
        ),
        viewModelBuilder: () => SignupViewModel());
  }
}
