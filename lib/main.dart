import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_anglish_app/business_logic/setup/provider_setup.dart';
import 'package:learning_anglish_app/business_logic/view_models/themes_vm/themes_vm.dart';
import 'package:learning_anglish_app/data/cache_helper/cache_helper.dart';
import 'package:learning_anglish_app/presentation/screens/exams/exams_with_radio.dart';
import 'package:learning_anglish_app/presentation/screens/notification/notification_screen.dart';
import 'package:learning_anglish_app/presentation/screens/registration/forget_password_code/forget_password_code.dart';
import 'package:learning_anglish_app/presentation/screens/splashScreen/splashScreen.dart';
import 'package:learning_anglish_app/utils/app_constants/app_constants.dart';
import 'package:learning_anglish_app/utils/theme/theme.dart';
import 'package:localization/localization.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  setupLocator();
  runApp(const AppScreen());
}

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  @override
  Widget build(BuildContext context) {
    LocalJsonLocalization.delegate.directories = ['lib/i18n'];
    return MultiProvider(
      providers: providers,
      child: Consumer<ThemesViewModel>(
        builder: (BuildContext context, model, Widget? child) {
          model.isDark =
              CacheHelper.getData(key: AppConstants.darkPreferences) ?? false;
          model.setSystemChrome();
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (BuildContext context, Widget? child) {
              return MaterialApp(
                title: 'Extreme Academy',
                locale: const Locale('en'),
                localizationsDelegates: [
                  // delegate from flutter_localization
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  // delegate from localization package.
                  //json-file
                  LocalJsonLocalization.delegate,
                ],

                supportedLocales: const [
                  Locale('en'),
                  Locale('ar'),
                ],

                showSemanticsDebugger: false,
                //theme: themeData,
                debugShowCheckedModeBanner: false,
                theme: model.isDark == false
                    ? appThemeData[AppTheme.light]
                    : appThemeData[AppTheme.dark],
                home: const SplashScreen(),
              );
            },
          );
        },
      ),
    );
  }
}
