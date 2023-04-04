import 'package:shop/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class OnBoardingViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  int _currentPage = 0;

  int get currentPage => _currentPage;

  void pageChanged(val) {
    _currentPage = val;
    notifyListeners();
  }

  navigateToHome() {
    _navigationService.replaceWith(Routes.loginView);
  }
}
