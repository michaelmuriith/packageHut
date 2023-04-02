import 'package:shop/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:shop/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:shop/ui/views/home/home_view.dart';
import 'package:shop/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:shop/ui/views/on_boarding/on_boarding_view.dart';
import 'package:shop/ui/views/login/login_view.dart';
import 'package:shop/ui/views/register/register_view.dart';
import 'package:shop/services/authentication_service.dart';
import 'package:shop/ui/views/profile/profile_view.dart';
import 'package:shop/ui/views/main/main_view.dart';
import 'package:shop/ui/views/cart/cart_view.dart';
import 'package:shop/ui/views/favourite/favourite_view.dart';
import 'package:shop/ui/views/vendorshop/vendorshop_view.dart';
import 'package:shop/ui/views/product/product_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: OnBoardingView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: RegisterView),
    MaterialRoute(page: ProfileView),
    MaterialRoute(page: MainView),
    MaterialRoute(page: CartView),
    MaterialRoute(page: FavouriteView),
    MaterialRoute(page: VendorshopView),
    MaterialRoute(page: ProductView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: AuthenticationService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
