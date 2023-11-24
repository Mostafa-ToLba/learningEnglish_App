import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_anglish_app/blocs/settings_bloc/settings_bloc.dart';
import 'package:learning_anglish_app/injection.dart';
import 'package:learning_anglish_app/presentation/screens/splash/splash_screen.dart';
import 'package:learning_anglish_app/utils/theme/theme.dart';
import 'package:localization/localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
//  await ScreenUtil.ensureScreenSize();

  await configureInjection();
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

    return MultiBlocProvider(
      providers: [
        /*
        BlocProvider(
          create: (context) => getIt<AuthBloc>()
            ..add(
              const AuthEvent.authCheckRequested(),
            ),
        ),
        */

        BlocProvider(
          create: (context) => getIt<SettingsBloc>()
            ..add(
              const SettingsEvent.checkOnSettings(),
            ),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            locale: context.watch<SettingsBloc>().state.locale,
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
              Locale('ar'),
              Locale('en'),
            ],
            showSemanticsDebugger: false,
            theme: themeData,
            debugShowCheckedModeBanner: false,
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
