import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_anglish_app/presentation/screens/splash/splash_screen.dart';
import 'package:learning_anglish_app/utils/theme/theme.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
//  await ScreenUtil.ensureScreenSize();
  runApp(
      const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          locale: Locale('ar', 'EG'), // Set the default locale to Arabic Egypt
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('ar', 'EG'), // Arabic Egypt
          ],
          showSemanticsDebugger: false,
          theme: themeData,
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
        );
      },
    );
  }
}




