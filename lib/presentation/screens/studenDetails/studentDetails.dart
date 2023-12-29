
 import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_anglish_app/business_logic/view_models/exams_vm/exams_vm.dart';
import 'package:learning_anglish_app/business_logic/view_models/mainScreen_vm/mainScreen_vm.dart';
import 'package:learning_anglish_app/business_logic/view_models/studentExams_vm/studentExams_vm.dart';
import 'package:learning_anglish_app/business_logic/view_models/themes_vm/themes_vm.dart';
import 'package:learning_anglish_app/data/models/studentExams/student_exams_model.dart';
import 'package:learning_anglish_app/presentation/screens/exams/exams_solved_screen.dart';
import 'package:learning_anglish_app/presentation/widgets/appBar/custom_app_bar_with_menu.dart';
import 'package:learning_anglish_app/presentation/widgets/text/custom_text.dart';
import 'package:learning_anglish_app/utils/app_constants/app_constants.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';
import 'package:learning_anglish_app/utils/icons/icons.dart';
import 'package:learning_anglish_app/utils/images/images.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

 class StudentDetails extends StatefulWidget {
   const StudentDetails({super.key,});

   @override
   State<StudentDetails> createState() => _StudentDetailsState();
 }

 class _StudentDetailsState extends State<StudentDetails> {

   @override
   void initState() {
     SchedulerBinding.instance.addPostFrameCallback((_) async {
       context.read<StudentExamsViewModel>().getStudentExams();
     });
     super.initState();
   }
   @override
   Widget build(BuildContext context) {
    final studentExamsVm = Provider.of<StudentExamsViewModel>(context);
     return SafeArea(
       child: studentExamsVm.studentExamsModel!=null? Padding(
         padding: EdgeInsets.only(top: 25.h),
         child: Column(
           children: [
             CustomAppBarWithMenu(
               onIconPressed: () {
                 final state =
                     Provider.of<MainScreenViewModel>(context, listen: false)
                         .sideMenuKey
                         .currentState;
                 if (state!.isOpened) {
                   state.closeSideMenu(); // close side menu
                 } else {
                   state.openSideMenu();
                 }
               },
               text: 'نتائج الامتحانات',
             ),
             SizedBox(height: 30.h),
             studentExamsVm.studentExamsModel!.data!.isEmpty?
             const NoExams()
                 :Expanded(
               child: ListView.separated(
                   physics:const BouncingScrollPhysics(),
                   shrinkWrap: true,
                   itemBuilder: (context, index) =>
                       AnimationConfiguration.staggeredList(
                         position: index,
                         delay: const Duration(milliseconds: 100),
                         child: SlideAnimation(
                           duration: const Duration(milliseconds: 2500),
                           curve: Curves.fastLinearToSlowEaseIn,
                           child: FadeInAnimation(
                               curve: Curves.fastLinearToSlowEaseIn,
                               duration: const Duration(milliseconds: 2500),
                               child: StudentDetailsWidget(context, index,studentExamsVm.studentExamsModel!.data![index])),
                         ),
                       ),
                   separatorBuilder: (context, index) => SizedBox(height: 16.h),
                   itemCount: studentExamsVm.studentExamsModel!.data!.length),
             ),

           ],
         ),
       ):const Center(child: CircularProgressIndicator()),
     );
   }
 }
 class StudentDetailsWidget extends StatelessWidget {
   final int index;

  final Datum data;

   const StudentDetailsWidget(BuildContext context, this.index, Datum this.data, {super.key});

   @override
   Widget build(BuildContext context) {
     final examVM = Provider.of<ExamsViewModel>(context, listen: false);

     final themeVM = Provider.of<ThemesViewModel>(context);
     return GestureDetector(
       onTap: () {
         examVM.examResultId = data.examResultId;
          Navigator.push(context, SlideTransition1( const ExamsSolvedScreen(isComingFromHome: true,)));
       },
       child: Container(
         margin: EdgeInsets.symmetric(horizontal: 24.w),
         padding: EdgeInsets.only(left: 20.w,right: 20.w,top: 20.h,bottom: 20.h),
         height: 200.h,
         //height: MediaQuery.sizeOf(context).height * 0.2,
         width: double.infinity,
         decoration: BoxDecoration(
           border: Border.all(
             color: themeVM.isDark == true ? Colors.white : Colors.transparent,
             width: .3,
           ),
           borderRadius: BorderRadius.all(
             Radius.circular(32.r),
           ),
           color: themeVM.isDark == true
               ? ColorResources.black
               : ColorResources.white1,
         ),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.end,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 Container(
                   height: 40.r,
                   width: 40.r,
                   decoration: BoxDecoration(
                       image: DecorationImage(image: AssetImage(data.isPassed! ?Images.succeeded:Images.failed),)
                   ),
                 ),
                 const Spacer(),
                 Column(
                   //mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.end,
                   children: [
                     Text(
                       data.examName??'',
                       style:
                       Theme.of(context).textTheme.displayMedium?.copyWith(
                         fontSize: 16.sp,
                         fontFamily: Theme.of(context)
                             .textTheme
                             .titleSmall
                             ?.fontFamily,
                         fontWeight: FontWeight.w500,
                       ),
                     ),
                     SizedBox(height: 6.h),
                     Text(
                       data.isPassed! ?'ناجح':'غير ناجح',
                       style:
                       Theme.of(context).textTheme.displayMedium?.copyWith(
                         fontSize: 15.sp,
                         fontFamily: Theme.of(context)
                             .textTheme
                             .titleSmall
                             ?.fontFamily,
                         // TODO: Edit this
                         color: themeVM.isDark == true
                             ? Colors.grey
                             : Colors.black,
                         fontWeight: FontWeight.w500,
                       ),
                     ),
                     SizedBox(height: 6.h),
                     Row(
                       children: [
                         Text(
                           data.degree.toString(),
                           style:
                           Theme.of(context).textTheme.displayMedium?.copyWith(
                             fontSize: 15.sp,
                             fontFamily: Theme.of(context)
                                 .textTheme
                                 .titleSmall
                                 ?.fontFamily,
                             // TODO: Edit this
                             color: themeVM.isDark == true
                                 ? Colors.grey
                                 : Colors.black,
                             fontWeight: FontWeight.w500,
                           ),
                         ),
                         Text(
                           ' : درجة الأمتحان',
                           style:
                           Theme.of(context).textTheme.displayMedium?.copyWith(
                             fontSize: 15.sp,
                             fontFamily: Theme.of(context)
                                 .textTheme
                                 .titleSmall
                                 ?.fontFamily,
                             // TODO: Edit this
                             color: themeVM.isDark == true
                                 ? Colors.grey
                                 : Colors.black,
                             fontWeight: FontWeight.w500,
                           ),
                         ),
                       ],
                     ),
                     SizedBox(height: 6.h),
                     Row(
                       children: [
                         Text(
                           data.score.toString(),
                           style:
                           Theme.of(context).textTheme.displayMedium?.copyWith(
                             fontSize: 15.sp,
                             fontFamily: Theme.of(context)
                                 .textTheme
                                 .titleSmall
                                 ?.fontFamily,
                             // TODO: Edit this
                             color: themeVM.isDark == true
                                 ? Colors.grey
                                 : Colors.black,
                             fontWeight: FontWeight.w500,
                           ),
                         ),
                         Text(
                           ' : الدرجة ',
                           style:
                           Theme.of(context).textTheme.displayMedium?.copyWith(
                             fontSize: 15.sp,
                             fontFamily: Theme.of(context)
                                 .textTheme
                                 .titleSmall
                                 ?.fontFamily,
                             // TODO: Edit this
                             color: themeVM.isDark == true
                                 ? Colors.grey
                                 : Colors.black,
                             fontWeight: FontWeight.w500,
                           ),
                         ),
                       ],
                     ),
                   ],
                 ),
                 SizedBox(
                   width: 10.w,
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
                   child: SvgPicture.asset(
                     IconResources.arrowleft,
                     color: Colors.white,
                   ),
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                     LinearPercentIndicator(
                       isRTL: true,
                       width: 200.w,
                       lineHeight: 6.h,
                       backgroundColor: ColorResources.grey1,
                       percent: data.score!.toDouble() / data.degree!.toDouble(),
                       barRadius: Radius.circular(4.r),
                       progressColor: ColorResources.brownDark,
                     ),
                     Text(
                       '${data.score!.toDouble() / data.degree!.toDouble()*100} %',
                       textAlign: TextAlign.center,
                       style:
                       Theme.of(context).textTheme.displayMedium?.copyWith(
                         fontSize: 13.sp,
                         //color: Theme.of(context).primaryColor,
                         // color: ColorResources.black,
                         fontWeight: FontWeight.w500,
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
   }
 }

 class NoExams extends StatelessWidget {
   const NoExams({super.key});

   @override
   Widget build(BuildContext context) {
     final themeVm = Provider.of<ThemesViewModel>(context);
     return Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children:
       [
         SizedBox(height: 80.h),
         Container(
           width: 1.sw-50.w,
           color: Colors.transparent,
           child: Lottie.asset('assets/lottieAnimations/noData1.json',fit: BoxFit.cover,),
         ),
         CustomText(text: '! ليس لديك أي نتائج حتي الان ',txtSize: 18.sp,color:themeVm.isDark==true?Colors.white:ColorResources.buttonColor),
       ],
     );
   }
 }