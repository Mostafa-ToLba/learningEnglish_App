import 'package:get_it/get_it.dart';
import 'package:learning_anglish_app/blocs/settings_bloc/settings_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt getIt = GetIt.instance;
Future<void> configureInjection(/*String env*/) async {  
  final sharedPreferences = await SharedPreferences.getInstance();

  getIt.registerFactory(
    () => SettingsBloc(
      sharedPreferences: getIt() 
    ),
  );

  getIt.registerLazySingleton(() => sharedPreferences);
}