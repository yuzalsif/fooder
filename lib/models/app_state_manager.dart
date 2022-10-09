import 'dart:async';

import 'package:flutter/material.dart';

class AppStateManager extends ChangeNotifier {
  int currentTab = 0;

  final String _userName = 'Yusuf';
  final String _password = 'testpass1';

  bool _isInitialized = false;
  bool _isLoggedIn = false;
  bool _isOnboardingComplete = false;
  bool _darkMode = false;
  bool _refreshFromLogout =
      false; //The bool value that allow us to launch splash screen from logut only.

  bool get isInitialized => _isInitialized;
  bool get isLoggedIn => _isLoggedIn;
  bool get isOnboardingComplete => _isOnboardingComplete;
  bool get darkMode => _darkMode;
  bool get refreshFromLogout => _refreshFromLogout;

  void initialize() {
    Timer(const Duration(milliseconds: 3000), () {
      _isInitialized = true;
      notifyListeners();
    });
  }

  void completeOnboarding() {
    _isOnboardingComplete = true;
    notifyListeners();
  }

  void login(String name, String passcode) {
    if (name == _userName && passcode == _password) {
      _isLoggedIn = true;
      notifyListeners();
    }
  }

  void logout() {
    _isInitialized = false;
    _isLoggedIn = false;
    _isOnboardingComplete = false;
    _refreshFromLogout = true;

    initialize();
    notifyListeners();
  }

  set darkMode(bool change) {
    _darkMode = change;
    notifyListeners();
  }

  void goToTab(int index) {
    currentTab = index;
    notifyListeners();
  }

  void goToRecipe() {
    currentTab = 1;
    notifyListeners();
  }
}
