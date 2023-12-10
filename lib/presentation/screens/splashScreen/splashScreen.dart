
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_anglish_app/presentation/screens/onBoarding/onboarding_screen.dart';
import 'package:learning_anglish_app/presentation/widgets/text/custom_text.dart';


class SplashScreen extends StatefulWidget {
   const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
      );
    });
    super.initState();
  }
   @override
   Widget build(BuildContext context) {
     return  SafeArea(
         child: Scaffold(
           body: Stack(
             children: [
               Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisAlignment: MainAxisAlignment.start,
                 children:
                 [
                   Padding(
                     padding:  EdgeInsets.only(top: 380.h,left: 70.w),
                     child: Stack(
                       children: [
                         CustomText(text: 'Extreme Academy',textAlign: TextAlign.center,txtSize: 30.sp,
                         color: Colors.black),
                       ],
                     ),
                   ),
                 ],
               ),
               Positioned(
                 right: 0.w,
                 top: 0.h,
                 child: Container(
                   height: 740.h,
                   width: 30.w,
                   decoration: const BoxDecoration(image:DecorationImage(image:
                   AssetImage('assets/images/graduate.png',),),),
                 ),
               ),
             ],
           ),
         ));
   }
}
