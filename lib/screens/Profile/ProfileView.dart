import 'package:ezzy/ServiceLocator.dart';
import 'package:ezzy/screens/Profile/ProfileViewModel.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {

  final String uid;

  const ProfileView({Key key, this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.nonReactive(
        builder: (context, model, child) => Scaffold(
          body: Text("lkjhgfdsa"),
        ),
        viewModelBuilder: () => locator<ProfileViewModel>(param1: uid),
        onModelReady: (model) => model.getSecondUserProfile(),
    );
  }
}
