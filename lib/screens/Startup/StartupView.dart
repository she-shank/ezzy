import 'package:ezzy/screens/Startup/StartupViewModel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class StartupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
          body: Center(
            child: (model.isBusy)? CircularProgressIndicator() : Text('Welcomm'),
          ),
        ),
        viewModelBuilder: () => StartupViewModel(),
        onModelReady: (model) => model.handleStartupLogic(),);
  }
}
