import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:learning_anglish_app/presentation/screens/main/main_screen.dart';
import 'package:learning_anglish_app/presentation/screens/questionBankPerLesson/question_bank_per_lesson_screen.dart';
import 'package:learning_anglish_app/presentation/widgets/appBar/custom_app_bar_with_menu.dart';
import 'package:learning_anglish_app/utils/app_constants/app_constants.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';
import 'package:localization/localization.dart';

class QuestionBankView extends StatelessWidget {
  const QuestionBankView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 25.h),
        child: Column(
          children: [
            CustomAppBarWithMenu(
              onIconPressed: () {
                final _state = MainScreen.sideMenuKey.currentState;
                if (_state!.isOpened)
                  _state.closeSideMenu(); // close side menu
                else
                  _state.openSideMenu();
              },
              text: 'بنك الأسئلة',
            ),
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
                          child: questionBank(context)),
                    ),
                  ),
                  separatorBuilder: (context,index)=>SizedBox(height: 16.h),
                  itemCount: 10)
            ),
          ],
        ),
      ),
    );
  }
}

 Widget questionBank(context)=> Container(
   margin: EdgeInsets.only(
       left: 24.w, right: 24.w,),
   padding: EdgeInsets.only(bottom: 24.h),
   width: MediaQuery.sizeOf(context).width,
   decoration: BoxDecoration(
     borderRadius: BorderRadius.circular(32.r),
     color: ColorResources.white1,
   ),
   child: Column(
     children: [
       SizedBox(height: 30.h),
       Theme(
         data: Theme.of(context)
             .copyWith(dividerColor: Colors.transparent),
         child: Container(
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(32.r),
           ),
           child: ExpansionTile(
             iconColor: ColorResources.brownDark,
             collapsedIconColor: ColorResources.brownDark,
             //leading: I,
             trailing: Container(
               width: 40.w,
               height: 40.h,
               decoration: BoxDecoration(
                 color: Colors.black.withOpacity(0),
                 image: const DecorationImage(
                   image: AssetImage("assets/icons/book.jpg"),
                 ),
               ),
             ),
             title: Align(
               alignment: Alignment.centerRight,
               child: Text(
                 'الوحدة الثانية: Supporting the community ',
                 style: TextStyle(
                   color: ColorResources.black,
                   fontSize: 16,
                   fontFamily: 'Roboto',
                   fontWeight: FontWeight.w400,
                 ),
               ),
             ),
             controlAffinity: ListTileControlAffinity.leading,
             children: <Widget>[
               GestureDetector(
                 onTap: () {
                   Navigator.push(
                       context,
                       SlideTransition1(
                           const QuestionBankPerLessonScreen()));
                 },
                 child: Container(
                   margin: EdgeInsets.symmetric(
                       vertical: 16.h, horizontal: 24.w),
                   //height: MediaQuery.sizeOf(context).height * 0.1,
                   //width: 300.w,
                   //height: 56.h,
                   decoration: ShapeDecoration(
                     shape: RoundedRectangleBorder(
                       side: BorderSide(
                         width: 1,
                         color: Colors.black.withOpacity(0.25),
                       ),
                       borderRadius:
                       BorderRadius.circular(32.r),
                     ),
                   ),
                   child: ListTile(
                     contentPadding:
                     const EdgeInsets.symmetric(
                         vertical: 2, horizontal: 12),
                     title: const Align(
                       alignment: Alignment.centerRight,
                       child: Text('الحصة الاولى'),
                     ),
                     leading: Container(
                       height: 24.h,
                       width: 24.w,
                       decoration: BoxDecoration(
                         borderRadius:
                         BorderRadius.circular(24.r),
                         color: ColorResources.buttonColor,
                       ),
                       child: Icon(
                         Icons.keyboard_arrow_left,
                         color: ColorResources.white1,
                         size: 20.dm,
                       ),
                     ),
                   ),
                 ),
               ),
               GestureDetector(
                 onTap: () {
                   Navigator.push(
                       context,
                       SlideTransition1(
                           const QuestionBankPerLessonScreen()));
                 },
                 child: Container(
                   margin: EdgeInsets.symmetric(
                       vertical: 16.h, horizontal: 24.w),
                   //height: MediaQuery.sizeOf(context).height * 0.1,
                   //width: 300.w,
                   //height: 56.h,
                   decoration: ShapeDecoration(
                     shape: RoundedRectangleBorder(
                       side: BorderSide(
                         width: 1,
                         color: Colors.black.withOpacity(0.25),
                       ),
                       borderRadius:
                       BorderRadius.circular(32.r),
                     ),
                   ),
                   child: ListTile(
                     contentPadding:
                     const EdgeInsets.symmetric(
                         vertical: 2, horizontal: 12),
                     title: const Align(
                       alignment: Alignment.centerRight,
                       child: Text('الحصة الاولى'),
                     ),
                     leading: Container(
                       height: 24.h,
                       width: 24.w,
                       decoration: BoxDecoration(
                         borderRadius:
                         BorderRadius.circular(24.r),
                         color: ColorResources.buttonColor,
                       ),
                       child: Icon(
                         Icons.keyboard_arrow_left,
                         color: ColorResources.white1,
                         size: 20.dm,
                       ),
                     ),
                   ),
                 ),
               ),
               GestureDetector(
                 onTap: () {
                   Navigator.push(
                       context,
                       SlideTransition1(
                           const QuestionBankPerLessonScreen()));
                 },
                 child: Container(
                   margin: EdgeInsets.symmetric(
                       vertical: 16.h, horizontal: 24.w),
                   //height: MediaQuery.sizeOf(context).height * 0.1,
                   //width: 300.w,
                   //height: 56.h,
                   decoration: ShapeDecoration(
                     shape: RoundedRectangleBorder(
                       side: BorderSide(
                         width: 1,
                         color: Colors.black.withOpacity(0.25),
                       ),
                       borderRadius:
                       BorderRadius.circular(32.r),
                     ),
                   ),
                   child: ListTile(
                     contentPadding:
                     const EdgeInsets.symmetric(
                         vertical: 2, horizontal: 12),
                     title: const Align(
                       alignment: Alignment.centerRight,
                       child: Text('الحصة الاولى'),
                     ),
                     leading: Container(
                       height: 24.h,
                       width: 24.w,
                       decoration: BoxDecoration(
                         borderRadius:
                         BorderRadius.circular(24.r),
                         color: ColorResources.buttonColor,
                       ),
                       child: Icon(
                         Icons.keyboard_arrow_left,
                         color: ColorResources.white1,
                         size: 20.dm,
                       ),
                     ),
                   ),
                 ),
               ),
             ],
           ),
         ),
       ),
     ],
   ),
 );