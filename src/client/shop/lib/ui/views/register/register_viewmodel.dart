import 'package:shop/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../models/user.dart';
import '../../../services/authentication_service.dart';

class RegisterViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authenticationService = locator<AuthenticationService>();

  late final User _user = User(
    fullName: '',
    email: '',
    password: '',
    imageUrl: '',
  );

  void setFirstName(String value) {
    _user.fullName = value;
    notifyListeners();
  }

  void setEmail(String value) {
    _user.email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    _user.password = value;
    notifyListeners();
  }

  void register() async {
    setBusy(true);
    var result = await _authenticationService.signUpWithEmail(
      email: _user.email,
      password: _user.password,
      fullName: _user.fullName,
      imageUrl: _user.imageUrl,
    );
    setBusy(false);

    if (result is bool) {
      if (result) {
        _navigationService.navigateTo(Routes.homeView);
      } else {
        // show error
        
      }
    } else {
      // show error
    }
  }

  void navigateToLogin() {
    _navigationService.navigateTo(Routes.loginView);
  }
}

