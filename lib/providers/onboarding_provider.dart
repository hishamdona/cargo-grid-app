import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingProvider extends ChangeNotifier {
  static const String _onboardingCompleteKey = 'onboarding_complete';
  bool _isFirstTime = true;
  bool _isLoading = true;

  bool get isFirstTime => _isFirstTime;
  bool get isLoading => _isLoading;

  OnboardingProvider() {
    checkOnboardingStatus();
  }

  Future<void> checkOnboardingStatus() async {
    _isLoading = true;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    _isFirstTime = !(prefs.getBool(_onboardingCompleteKey) ?? false);
    
    _isLoading = false;
    notifyListeners();
  }

  Future<void> completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_onboardingCompleteKey, true);
    _isFirstTime = false;
    notifyListeners();
  }
}
