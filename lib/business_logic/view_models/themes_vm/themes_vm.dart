import 'package:learning_anglish_app/business_logic/setup/base_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

String modePrefKey = 'mode';

class ThemesViewModel extends BaseNotifier {
  final SharedPreferences sharedPreferences;
  bool? isDark;
  ThemesViewModel({required this.sharedPreferences});
  void setTheme(bool value) {
    isDark = value;
    sharedPreferences.setBool(modePrefKey, value);
    notifyListeners();
  }

  void getTheme() {
    isDark = sharedPreferences.getBool(modePrefKey) ?? false;
    switch (isDark) {
      case true:
        break;
      default:
        sharedPreferences.setBool(modePrefKey, false);
    }

    // isDark = Preference.getBool(PrefKeys.themeStatus)??false;
  }
}
