import 'package:get_it/get_it.dart';
import 'package:learning_anglish_app/business_logic/http_api.dart';
import 'package:learning_anglish_app/business_logic/view_models/choosingclassdone_vm/choosingclass_vm.dart';
import 'package:learning_anglish_app/business_logic/view_models/exams_vm/exams_vm.dart';
import 'package:learning_anglish_app/business_logic/view_models/forgetPassword_vm/forgetPassword_vm.dart';
import 'package:learning_anglish_app/business_logic/view_models/lessonScreen_vm/lessonScreen_vm.dart';
import 'package:learning_anglish_app/business_logic/view_models/login_vm/login_vm.dart';
import 'package:learning_anglish_app/business_logic/view_models/mainScreen_vm/mainScreen_vm.dart';
import 'package:learning_anglish_app/business_logic/view_models/notification_vm/notification_vm.dart';
import 'package:learning_anglish_app/business_logic/view_models/register_vm/register_vm.dart';
import 'package:learning_anglish_app/business_logic/view_models/themes_vm/themes_vm.dart';
import 'package:learning_anglish_app/business_logic/view_models/unit_vm/unit_vm.dart';
import 'package:learning_anglish_app/business_logic/view_models/userProfile_vm/userProfile_vm.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => HttpApi());

  // locator.registerLazySingleton(() => AuthenticationService());
}

List<SingleChildWidget> providers = [
  ...independentServices,
];

List<SingleChildWidget> independentServices = [
  ChangeNotifierProvider<ExamsViewModel>(create: (_) => ExamsViewModel()),
  ChangeNotifierProvider<ThemesViewModel>(create: (_) => ThemesViewModel()),
  ChangeNotifierProvider<LessonScreenViewModel>(
      create: (_) => LessonScreenViewModel()),
  ChangeNotifierProvider<MainScreenViewModel>(
      create: (_) => MainScreenViewModel()),
  ChangeNotifierProvider<RegisterViewModel>(create: (_) => RegisterViewModel()),
  ChangeNotifierProvider<LoginViewModel>(create: (_) => LoginViewModel()),
  ChangeNotifierProvider<ForgetPasswordViewModel>(
      create: (_) => ForgetPasswordViewModel()),
  ChangeNotifierProvider<ChoosingClassViewModel>(
      create: (_) => ChoosingClassViewModel()),
  ChangeNotifierProvider<UnitViewModel>(create: (_) => UnitViewModel()),
  ChangeNotifierProvider<UserProfileViewModel>(
      create: (_) => UserProfileViewModel()),
  ChangeNotifierProvider<NotificationViewModel>(
      create: (_) => NotificationViewModel())
];
