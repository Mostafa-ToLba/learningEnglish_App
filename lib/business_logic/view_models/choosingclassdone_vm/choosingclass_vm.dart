import 'package:learning_anglish_app/business_logic/setup/base_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

String choosingClassPrefKey = 'choosing_class';

class ChoosingClassViewModel extends BaseNotifier {
  final SharedPreferences sharedPreferences;
  bool? hasShownBefore;

  ChoosingClassViewModel({required this.sharedPreferences});

  void choosingClassDone() {
    hasShownBefore = true;
    sharedPreferences.setBool(choosingClassPrefKey, true);
    notifyListeners();
  }

  void areChoosingClassDone() {
    hasShownBefore = sharedPreferences.getBool(choosingClassPrefKey) ?? false;
    notifyListeners();
  }
}
