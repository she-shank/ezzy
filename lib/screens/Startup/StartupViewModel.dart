import 'package:ezzy/ServiceLocator.dart';
import 'package:ezzy/services/AuthenticationService.dart';
import 'package:ezzy/services/NavigationService.dart';
import 'package:stacked/stacked.dart';


class StartupViewModel extends BaseViewModel {

  final AuthenticationService _auth = locator<AuthenticationService>();
  final NavigationService _nav = locator<NavigationService>();

  void handleStartupLogic() async {
    setBusy(true);
    //await Future.delayed(Duration(seconds: 3));
    bool result = await _auth.isUserLoggedIn();
    setBusy(false);

    //await Future.delayed(Duration(seconds: 3));
    if (!result){
      _nav.pushReplacementNamed('/Login');
    } else {
      _nav.pushReplacementNamed('/Homefeed');
    }
  }
}