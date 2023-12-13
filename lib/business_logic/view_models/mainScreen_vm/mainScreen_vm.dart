
import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_anglish_app/business_logic/setup/base_notifier.dart';
import 'package:learning_anglish_app/presentation/screens/main/home_view.dart';
import 'package:learning_anglish_app/presentation/screens/main/question_bank_view.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import '../../../presentation/screens/main/profile_settings_view.dart';
import 'dart:developer' as developer;

class MainScreenViewModel extends BaseNotifier
{
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<SideMenuState> sideMenuKey =
  GlobalKey<SideMenuState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey(); // Create a key
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
  GlobalKey<ScaffoldMessengerState>();
  int selectedIndex = 2;
   final List<Widget> widgetOptions = <Widget>[
    const ProfileSettingsView(),
    QuestionBankView(),
    HomeView(),
  ];

  void onItemTapped(int index) {

      selectedIndex = index;
    notifyListeners();
  }

  /// check_network
  ConnectivityResult connectionStatus = ConnectivityResult.none;
  final Connectivity connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> connectivitySubscription;

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      developer.log('Couldn\'t check connectivity status', error: e);
      return;
    }

    if (!mounted) {
      return Future.value(null);
    }

    return updateConnectionStatus(result);
  }

  Future<void> updateConnectionStatus(ConnectivityResult result) async {
      connectionStatus = result;
    notifyListeners();
  }
///
}