
import 'package:learning_anglish_app/business_logic/setup/base_notifier.dart';

class ThemesViewModel extends BaseNotifier
{
  bool isDark = true;

  setTheme(bool value) {
    isDark = value;
 //   Preference.setBool(PrefKeys.themeStatus, value);
    print("THEME IS CHANGED !!!!!!!!!!!!!!!!!!!!!!!!!!");
    notifyListeners();
  }

  void getTheme(){

  //  isDark = Preference.getBool(PrefKeys.themeStatus)??false;
  }
}