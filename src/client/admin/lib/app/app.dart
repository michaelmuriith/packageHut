import 'package:admin/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:admin/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:admin/ui/views/home/home_view.dart';
import 'package:admin/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:admin/ui/views/dashboard/dashboard_view.dart';
import 'package:admin/ui/views/category/category_view.dart';
import 'package:admin/ui/views/maincategory/maincategory_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    CustomRoute(page: StartupView, initial: true),
    CustomRoute(page: HomeView),
    MaterialRoute(page: DashboardView),
    MaterialRoute(page: CategoryView),
    MaterialRoute(page: MaincategoryView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: RouterService),
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
