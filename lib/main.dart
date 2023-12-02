import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_anglish_app/blocs/settings_bloc/settings_bloc.dart';
import 'package:learning_anglish_app/injection.dart';
import 'package:learning_anglish_app/presentation/screens/main/main_screen.dart';
import 'package:learning_anglish_app/presentation/screens/onBoarding/onboarding_screen.dart';
import 'package:learning_anglish_app/presentation/screens/registration/login_screen/login_screen.dart';
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
      child: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (BuildContext context, SettingsState state) {
        return ScreenUtilInit(
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
                Locale('en'),
                Locale('ar'),
              ],

              showSemanticsDebugger: false,
              //theme: themeData,
              debugShowCheckedModeBanner: false,
              theme: appThemeData[state.mode],
              home: const MainAppWidget(),
            );
          },
        );
      }),
    );
  }
}

class MainAppWidget extends StatelessWidget {
  const MainAppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bool areBoardingScreensWatched =
        context.watch<SettingsBloc>().state.areBoardingScreensWatched;
    final bool isChoosingClassDone =
        context.watch<SettingsBloc>().state.isChoosingClassDone;
    if (isChoosingClassDone) {
      // TODO: Add this condition after you check to user logged in
      return const MainScreen();
    } else if (areBoardingScreensWatched) {
      return const LoginScreen();
    } else {
      return const OnBoardingScreen();
    }

    /*
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("welcome".i18n(),
                  style: Theme.of(context).textTheme.displaySmall),
              TextButton(
                onPressed: () {
                  BlocProvider.of<SettingsBloc>(context)
                      .add(const SettingsEvent.changeMode(AppTheme.dark));
                },
                child: const Text("Dark"),
              ),
              TextButton(
                onPressed: () {
                  BlocProvider.of<SettingsBloc>(context)
                      .add(const SettingsEvent.changeMode(AppTheme.light));
                },
                child: const Text("Light"),
              ),
              TextButton(
                onPressed: () {
                  BlocProvider.of<SettingsBloc>(context)
                      .add(const SettingsEvent.changeLanguage('en'));
                },
                child: const Text("En"),
              ),
              TextButton(
                onPressed: () {
                  BlocProvider.of<SettingsBloc>(context)
                      .add(const SettingsEvent.changeLanguage('ar'));
                },
                child: const Text("Ar"),
              ),
            ]),
      ),
    );
    */
  }
}
