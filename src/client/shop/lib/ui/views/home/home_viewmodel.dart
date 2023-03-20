import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_text.dart';
import '../cart/cart_view.dart';
import '../favourite/favourite_view.dart';
import '../main/main_view.dart';
import '../profile/profile_view.dart';

class HomeViewModel extends BaseViewModel {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  get onItemTapped => _onItemTapped;

  Widget get widgetOptions => _widgetOptions.elementAt(_selectedIndex);

  static const List<Widget> _widgetOptions = <Widget>[
    MainView(),
    CartView(),
    FavouriteView(),
    ProfileView(),
  ];

  void _onItemTapped(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
