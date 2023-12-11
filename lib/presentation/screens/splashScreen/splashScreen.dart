
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_anglish_app/presentation/screens/onBoarding/onboarding_screen.dart';
import 'package:learning_anglish_app/presentation/widgets/text/custom_text.dart';


class SplashScreen extends StatefulWidget {
   const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    // Initialize animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    // Define the tween for the animation
    _animation = Tween<Offset>(
      begin: const Offset(0, -1.5), // Off-screen top
      end: const Offset(0, 0), // On-screen
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // Start the animation after a delay
    Future.delayed(const Duration(milliseconds: 20), () {
      _controller.forward();
    });

    // Navigate to the next screen after the animation completes
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
          );
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
                 child: SlideTransition(
                   position: _animation,
                   child: Container(
                     height: 740.h,
                     width: 30.w,
                     decoration: const BoxDecoration(image:DecorationImage(image:
                     AssetImage('assets/images/graduate.png',),),),
                   ),
                 ),
               ),
             ],
           ),
         ));
   }
}
