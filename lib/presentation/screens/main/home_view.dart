import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learning_anglish_app/presentation/screens/chooseLesson/choose_lesson_screen.dart';
import 'package:learning_anglish_app/presentation/screens/main/main_screen.dart';
import 'package:learning_anglish_app/presentation/widgets/appBar/custom_app_bar_with_image_and%20_menu.dart';
import 'package:learning_anglish_app/utils/app_constants/app_constants.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';
import 'package:learning_anglish_app/utils/icons/icons.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 25.h),
        child: Column(
          children: [
            CustomAppBarWithImageAndMenu(
              onMenuPressed: () {
                final _state = MainScreen.sideMenuKey.currentState;
                if (_state!.isOpened)
                  _state.closeSideMenu(); // close side menu
                else
                  _state.openSideMenu();
              },
              imageURL:
                  'https://images.unsplash.com/photo-1508184964240-ee96bb9677a7?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              name: 'Mostafa Mahmoud',
            ),
            SizedBox(height: 30.h),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context,index)=>AnimationConfiguration.staggeredList(
                    position: index,
                    delay: const Duration(milliseconds: 100),
                    child: SlideAnimation(
                      duration: const Duration(milliseconds: 2500),
                      curve: Curves.fastLinearToSlowEaseIn,
                      child: FadeInAnimation(
                          curve: Curves.fastLinearToSlowEaseIn,
                          duration: const Duration(milliseconds: 2500),
                          child: homeWidget(context)),
                    ),
                  ),
                  separatorBuilder: (context,index)=>SizedBox(height: 16.h),
                  itemCount: 10),
            )
          ],
        ),
      ),
    );
  }
}

 Widget homeWidget(context)=> GestureDetector(
   onTap: () {
     Navigator.push(
         context, SlideTransition1(const ChooseLessonScreen()));
   },
   child: Container(
     margin: EdgeInsets.symmetric(horizontal: 24.w),
     padding: EdgeInsets.all(24.dg),
     height: 170.h,
     //height: MediaQuery.sizeOf(context).height * 0.2,
     width: double.infinity,
     decoration: BoxDecoration(
       borderRadius: BorderRadius.all(
         Radius.circular(32.r),
       ),
       color: ColorResources.white1,
     ),
     child: Column(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
         Row(
           mainAxisAlignment: MainAxisAlignment.end,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             Column(
               //mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.end,
               children: [
                 Text(
                   'Getting away الوحدة الأولى',
                   style: TextStyle(
                     color: ColorResources.black,
                     fontSize: 16.sp,
                     fontFamily: Theme.of(context).textTheme.titleSmall?.fontFamily,
                     fontWeight: FontWeight.w400,
                   ),
                 ),
                 SizedBox(height: 4.h),
                 Text(
                   'عدد الدروس : 8',
                   style: TextStyle(
                     color: ColorResources.black.withOpacity(0.5),
                     fontSize: 14.sp,
                     fontFamily: Theme.of(context).textTheme.titleSmall?.fontFamily,
                     fontWeight: FontWeight.w400,
                   ),
                 ),
               ],
             ),
             SizedBox(width: 10.w,),
             Container(
               width: 28.w,
               height: 30.h,
               decoration: BoxDecoration(
                 color: Colors.black.withOpacity(0),
               ),
               child: SvgPicture.asset(IconResources.book),
             ),
             // Icon(Icons.book, size: 32.dg, color: ColorResources.blue,),
           ],
         ),
         SizedBox(height: 24.h),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Container(
               width: 28.r,
               height: 28.r,
               padding: EdgeInsets.only(right: 3.w),
               margin: EdgeInsets.only(left: 10.w),
               decoration: const ShapeDecoration(
                 color: Color(0xFF49423A),
                 shape: OvalBorder(),
               ),
               child: SvgPicture.asset(IconResources.arrowleft,color: Colors.white,)
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 LinearPercentIndicator(
                   isRTL: true,
                   width: 200.w,
                   lineHeight: 6.0,
                   percent: 0.52,barRadius:Radius.circular(4.r) ,
                   progressColor: ColorResources.brownDark,
                 ),
                 Text(
                   '52 %',
                   textAlign: TextAlign.center,
                   style: TextStyle(
                     color: ColorResources.black,
                     fontSize: 12.sp,
                     fontFamily: 'Roboto',
                     fontWeight: FontWeight.w400,
                   ),
                 ),
               ],
             ),
           ],
         ),
       ],
     ),
   ),
 );