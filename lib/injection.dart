import 'package:get_it/get_it.dart';
import 'package:learning_anglish_app/blocs/settings_bloc/settings_bloc.dart';
import 'package:learning_anglish_app/business_logic/view_models/choosingclassdone_vm/choosingclass_vm.dart';
import 'package:learning_anglish_app/business_logic/view_models/onboarding_vm/onboarding_vm.dart';
import 'package:learning_anglish_app/business_logic/view_models/themes_vm/themes_vm.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt getIt = GetIt.instance;
Future<void> configureInjection(/*String env*/) async {  
  final sharedPreferences = await SharedPreferences.getInstance();

  getIt.registerFactory(
    () => SettingsBloc(
      sharedPreferences: getIt() 
    ),
  );
  getIt.registerFactory(
    () => ThemesViewModel(
      sharedPreferences: getIt() 
    ),
  );
  getIt.registerFactory(
    () => ChoosingClassViewModel(
      sharedPreferences: getIt() 
    ),
  );
  getIt.registerFactory(
    () => OnboardingViewModel(
      sharedPreferences: getIt() 
    ),
  );

  getIt.registerLazySingleton(() => sharedPreferences);
}