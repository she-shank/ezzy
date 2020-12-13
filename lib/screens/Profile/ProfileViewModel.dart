import 'package:ezzy/ServiceLocator.dart';
import 'package:ezzy/datamodel/SecondUser.dart';
import 'package:ezzy/services/DatabaseService.dart';
import 'package:ezzy/services/NavigationService.dart';
import 'package:stacked/stacked.dart';
import 'dart:async';

class ProfileViewModel extends BaseViewModel {
  final _db = locator<DatabaseService>();
  final _nav = locator<NavigationService>();
  final String uid;
  SecondUser user;

  ProfileViewModel({this.uid});

  void getSecondUserProfile() async {
    setBusy(true);
    user = await _db.getSecondUser(uid);
    setBusy(false);
  }
}