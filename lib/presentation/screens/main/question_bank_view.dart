import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:learning_anglish_app/business_logic/view_models/themes_vm/themes_vm.dart';
import 'package:learning_anglish_app/presentation/screens/main/main_screen.dart';
import 'package:learning_anglish_app/presentation/screens/questionBankPerLesson/question_bank_per_lesson_screen.dart';
import 'package:learning_anglish_app/presentation/widgets/appBar/custom_app_bar_with_menu.dart';
import 'package:learning_anglish_app/utils/app_constants/app_constants.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';
import 'package:learning_anglish_app/utils/icons/icons.dart';
import 'package:localization/localization.dart';
import 'package:provider/provider.dart';

class QuestionBankView extends StatelessWidget {
   QuestionBankView({super.key});
  final List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.teal,
    Colors.pink,
    Colors.indigo,
    Colors.cyan,
    // Added 10 colors
  ];
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
                if (_state!.isOpened) {
                  _state.closeSideMenu(); // close side menu
                } else {
                  _state.openSideMenu();
                }
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
                          child: QuestionBank(context,colors,index)),
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

 class QuestionBank extends StatelessWidget {
  final List<Color> colors;
  final int index;
   const QuestionBank(BuildContext context, this.colors,this.index, {super.key});
   @override
   Widget build(BuildContext context) {
     final themeVM = Provider.of<ThemesViewModel>(context);
     return  Container(
       margin: EdgeInsets.only(
         left: 24.w, right: 24.w,),
       padding: EdgeInsets.only(bottom: 24.h),
       width: MediaQuery.sizeOf(context).width,
       decoration: BoxDecoration(
         border: Border.all(
             color: themeVM.isDark?Colors.white:Colors.transparent,
             width: .3
         ),
         borderRadius: BorderRadius.circular(32.r),
         color: Theme.of(context).scaffoldBackgroundColor,
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
                 iconColor: themeVM.isDark?Colors.white:Colors.black,
                 collapsedIconColor:themeVM.isDark?Colors.white:Colors.black,
                 //leading: I,
                 trailing: Container(
                   width: 40.w,
                   height: 30.h,
                   decoration: BoxDecoration(
                     color: Colors.black.withOpacity(0),
                   ),
                   child: SvgPicture.asset(IconResources.book,color: index < colors.length? colors[index]:Colors.black),
                 ),
                 title: Align(
                   alignment: Alignment.centerRight,
                   child: Text(
                     'الوحدة الثانية: Supporting the community ',
                     style: Theme.of(context)
                         .textTheme
                         .displayMedium
                         ?.copyWith(
                       fontFamily: Theme.of(context).textTheme.titleSmall?.fontFamily,
                       fontSize: 16.sp,

                       //color: Theme.of(context).primaryColor,
                       // color: ColorResources.black,
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
                             color: themeVM.isDark?ColorResources.expansionBorder:Colors.black.withOpacity(0.25),
                           ),
                           borderRadius:
                           BorderRadius.circular(32.r),
                         ),
                       ),
                       child: ListTile(
                         contentPadding:
                         const EdgeInsets.symmetric(
                             vertical: 2, horizontal: 12),
                         title:  Align(
                           alignment: Alignment.centerRight,
                           child: Text('الحصة الاولى',style: TextStyle(fontFamily: Theme.of(context).textTheme.titleSmall?.fontFamily,),),
                         ),
                         leading: Container(
                             width: 23.r,
                             height: 23.r,
                             padding: EdgeInsets.only(right: 3.w),

                             decoration: const ShapeDecoration(
                               color: Color(0xFF49423A),
                               shape: OvalBorder(),
                             ),
                             child: SvgPicture.asset(IconResources.arrowleft,color: Colors.white,)
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
                             color: themeVM.isDark?ColorResources.expansionBorder:Colors.black.withOpacity(0.25),
                           ),
                           borderRadius:
                           BorderRadius.circular(32.r),
                         ),
                       ),
                       child: ListTile(
                         contentPadding:
                         const EdgeInsets.symmetric(
                             vertical: 2, horizontal: 12),
                         title:  Align(
                           alignment: Alignment.centerRight,
                           child: Text('الحصة الاولى',style: TextStyle(fontFamily: Theme.of(context).textTheme.titleSmall?.fontFamily,),),
                         ),
                         leading: Container(
                             width: 23.r,
                             height: 23.r,
                             padding: EdgeInsets.only(right: 3.w),

                             decoration: const ShapeDecoration(
                               color: Color(0xFF49423A),
                               shape: OvalBorder(),
                             ),
                             child: SvgPicture.asset(IconResources.arrowleft,color: Colors.white,)
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
                             color: themeVM.isDark?ColorResources.expansionBorder:Colors.black.withOpacity(0.25),
                           ),
                           borderRadius:
                           BorderRadius.circular(32.r),
                         ),
                       ),
                       child: ListTile(
                         contentPadding:
                         const EdgeInsets.symmetric(
                             vertical: 2, horizontal: 12),
                         title:  Align(
                           alignment: Alignment.centerRight,
                           child: Text('الحصة الاولى',style: TextStyle(fontFamily: Theme.of(context).textTheme.titleSmall?.fontFamily,),),
                         ),
                         leading:  Container(
                             width: 23.r,
                             height: 23.r,
                             padding: EdgeInsets.only(right: 3.w),

                             decoration: const ShapeDecoration(
                               color: Color(0xFF49423A),
                               shape: OvalBorder(),
                             ),
                             child: SvgPicture.asset(IconResources.arrowleft,color: Colors.white,)
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
   }
 }
