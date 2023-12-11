import 'package:learning_anglish_app/business_logic/setup/base_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

String boardingScreensPrefKey = 'boarding_screens';

class OnboardingViewModel extends BaseNotifier {
  final SharedPreferences sharedPreferences;
  bool? hasShownBefore;

  OnboardingViewModel({required this.sharedPreferences});

  void boardingScreensWatched() {
    hasShownBefore = true;
    sharedPreferences.setBool(boardingScreensPrefKey, true);
    notifyListeners();
  }

  void areBoardingScreensWatched() {
    hasShownBefore =
        sharedPreferences.getBool(boardingScreensPrefKey) ?? false;
    notifyListeners();
  }
}
