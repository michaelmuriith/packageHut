// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i8;
import 'package:stacked/stacked.dart' as _i7;
import 'package:stacked_services/stacked_services.dart' as _i1;

import '../ui/views/category/category_view.dart' as _i5;
import '../ui/views/dashboard/dashboard_view.dart' as _i4;
import '../ui/views/home/home_view.dart' as _i3;
import '../ui/views/maincategory/maincategory_view.dart' as _i6;
import '../ui/views/startup/startup_view.dart' as _i2;

final stackedRouter = StackedRouterWeb(_i1.StackedService.navigatorKey);

class StackedRouterWeb extends _i7.RootStackRouter {
  StackedRouterWeb([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    StartupViewRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.StartupView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeViewRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    DashboardViewRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.DashboardView(),
        maintainState: false,
      );
    },
    CategoryViewRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.CategoryView(),
        maintainState: false,
      );
    },
    MaincategoryViewRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.MaincategoryView(),
        maintainState: false,
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          StartupViewRoute.name,
          path: '/',
        ),
        _i7.RouteConfig(
          HomeViewRoute.name,
          path: '/home-view',
        ),
        _i7.RouteConfig(
          DashboardViewRoute.name,
          path: '/dashboard-view',
        ),
        _i7.RouteConfig(
          CategoryViewRoute.name,
          path: '/category-view',
        ),
        _i7.RouteConfig(
          MaincategoryViewRoute.name,
          path: '/maincategory-view',
        ),
      ];
}

/// generated route for
/// [_i2.StartupView]
class StartupViewRoute extends _i7.PageRouteInfo<void> {
  const StartupViewRoute()
      : super(
          StartupViewRoute.name,
          path: '/',
        );

  static const String name = 'StartupView';
}

/// generated route for
/// [_i3.HomeView]
class HomeViewRoute extends _i7.PageRouteInfo<void> {
  const HomeViewRoute()
      : super(
          HomeViewRoute.name,
          path: '/home-view',
        );

  static const String name = 'HomeView';
}

/// generated route for
/// [_i4.DashboardView]
class DashboardViewRoute extends _i7.PageRouteInfo<void> {
  const DashboardViewRoute()
      : super(
          DashboardViewRoute.name,
          path: '/dashboard-view',
        );

  static const String name = 'DashboardView';
}

/// generated route for
/// [_i5.CategoryView]
class CategoryViewRoute extends _i7.PageRouteInfo<void> {
  const CategoryViewRoute()
      : super(
          CategoryViewRoute.name,
          path: '/category-view',
        );

  static const String name = 'CategoryView';
}

/// generated route for
/// [_i6.MaincategoryView]
class MaincategoryViewRoute extends _i7.PageRouteInfo<void> {
  const MaincategoryViewRoute()
      : super(
          MaincategoryViewRoute.name,
          path: '/maincategory-view',
        );

  static const String name = 'MaincategoryView';
}
