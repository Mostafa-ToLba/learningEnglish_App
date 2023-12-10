import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_anglish_app/business_logic/view_models/exams_vm/exams_vm.dart';
import 'package:learning_anglish_app/business_logic/view_models/themes_vm/themes_vm.dart';
import 'package:learning_anglish_app/presentation/screens/result/results_page.dart';
import 'package:learning_anglish_app/presentation/widgets/button/custom_button.dart';
import 'package:learning_anglish_app/presentation/widgets/text/custom_text.dart';
import 'package:learning_anglish_app/utils/app_constants/app_constants.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';
import 'package:learning_anglish_app/utils/icons/icons.dart';
import 'package:localization/localization.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:localization/localization.dart';

class ExamsScreen extends StatefulWidget {
  const ExamsScreen({super.key});

  @override
  State<ExamsScreen> createState() => _ExamsScreenState();
}

class _ExamsScreenState extends State<ExamsScreen> with TickerProviderStateMixin {


  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final examsVM = Provider.of<ExamsViewModel>(context);
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body:PageView.builder(
        controller: examsVM.pageController,
        scrollDirection: Axis.vertical,
        itemCount: 10,
          onPageChanged: (int page) {
            setState(() {
              examsVM.currentPage = page+1;
            });
          },
        itemBuilder: (context, index) {
      return ExamWidgets(context,index);
  }));
}}


class ExamWidgets extends StatefulWidget {
 final int index;
   const ExamWidgets(BuildContext context, this.index, {super.key});

  @override
  State<ExamWidgets> createState() => _ExamWidgetsState();
}

class _ExamWidgetsState extends State<ExamWidgets> {
  @override
  void initState() {
    final examVM = Provider.of<ExamsViewModel>(context, listen: false);
    examVM.selectedIndex=0;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final themeVm = Provider.of<ThemesViewModel>(context);
    return Consumer<ExamsViewModel>(
      builder: (BuildContext contextt, model, Widget? child) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 32.h, left: 8.w, right: 8.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 16.w),
                    Align(
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 40
                              .r, // Set the width and height to your desired size
                          height: 40.r, padding: EdgeInsets.only(right: 4.w),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: themeVm.isDark?Colors.black:Colors.white, // White background
                            border: Border.all(
                              color: Colors.grey, // Grey border color
                              width: 1.0, // Border width
                            ),
                          ),
                          child: Center(
                              child: SvgPicture.asset(
                                IconResources.arrowleft,
                                color: themeVm.isDark?Colors.white:Colors.black,
                                height: 25.h,
                              )),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              'Exams',
                              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 22.h),
                            Text(
                              'Unit 1/ Lesson 1',
                              textAlign: TextAlign.justify,
                              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    SizedBox(width: 30.w),
                  ],
                ),
                SizedBox(height: 32.h),
                Row(
                  children: [
                    LinearPercentIndicator(
                      isRTL: true,
                      barRadius:Radius.circular(8.r) ,
                      width: 305.w,
                      lineHeight: 8.0,
                      percent: (widget.index+1).toDouble() / 10.0,
                      backgroundColor:Colors.grey[300],
                      progressColor: const Color(0xff1c1c1a),
                    ),
                    Text(
                      '10/${widget.index+1}',
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        height: 0.16.h,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 45.h),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      decoration: ShapeDecoration(
                        color: themeVm.isDark?Colors.black:ColorResources.white1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(56.r),
                        ),
                      ),
                      //padding: const EdgeInsets.all(8.0),
                      margin: EdgeInsets.only(right: 8.w, left: 8.w),//, top: 45.h),
                      padding:
                      EdgeInsets.only(right: 20.w, left: 20.w, top: 25.h),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 32.w,
                                  height: 32.h,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 1,
                                        color: ColorResources.red,
                                      ),
                                      borderRadius: BorderRadius.circular(50.dg),
                                    ),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 8.sp),
                                      child: Text(
                                        '${widget.index+1}',
                                        style: Theme.of(context).textTheme.displayMedium?.copyWith(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          height: 0.16.h,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 4.w),
                                Expanded(
                                  child: Text(
                                    '  the question thar is shown to students and it is a multi line based on the length of the question and to make sure that srolling is working fine',
                                    //textAlign: TextAlign.justify,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w400,
                                    )
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // answer one (not selected)
                          SizedBox(height: 10.h),
                          SizedBox(
                            height: 280.h,
                            child: ListView.separated(
                                physics: const ScrollPhysics(),
                                itemBuilder: (context,index)=>question(index,selectedQuestion: model.selectedIndex==index),
                                separatorBuilder: (context,index)=>SizedBox(height: 10.h),
                                itemCount: 4),
                          ),

                          // answer two (selected and right)
                          /*
                      SizedBox(height: 10.h),
                      Container(
                        width: 311.w,
                        height: 56.h,
                        padding: EdgeInsets.symmetric(
                            horizontal: 24.w, vertical: 18.h),
                        decoration: ShapeDecoration(
                          color: ColorResources.greenLight,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              color: ColorResources.greenDark,
                            ),
                            borderRadius: BorderRadius.circular(32),
                          ),
                        ),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                'B. Answer Two',
                                style: TextStyle(
                                  color: ColorResources.greenDark,
                                  fontSize: 17.sp,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(width: 20.w),
                            Icon(
                              Icons.check_circle_outline_rounded,
                              color: ColorResources.greenDark,
                              size: 20.dg,
                            ),
                          ],
                        ),
                      ),
                      // answer three (selected and wrong)
                      SizedBox(height: 10.h),
                      Container(
                        width: 311.w,
                        height: 56.h,
                        padding: EdgeInsets.symmetric(
                            horizontal: 24.w, vertical: 18.h),
                        decoration: ShapeDecoration(
                          color: ColorResources.redLight,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              color: ColorResources.redDark,
                            ),
                            borderRadius: BorderRadius.circular(32),
                          ),
                        ),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                'C. Answer Three',
                                style: TextStyle(
                                  color: ColorResources.redDark,
                                  fontSize: 17,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(width: 20.w),
                            FaIcon(
                              FontAwesomeIcons.circleXmark,
                              color: ColorResources.redDark,
                              size: 20.dg,
                            ),
                          ],
                        ),
                      ),
                      // answer four (selected and not determined yet)

                      SizedBox(height: 10.h),
                      Container(
                        width: 311.w,
                        height: 56.h,
                        padding: EdgeInsets.symmetric(
                            horizontal: 24.w, vertical: 18.h),
                        decoration: ShapeDecoration(
                          color: ColorResources.brownLight,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              color: ColorResources.brownDark,
                            ),
                            borderRadius: BorderRadius.circular(32),
                          ),
                        ),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                'D. Answer Four',
                                style: TextStyle(
                                  color: ColorResources.brownDark,
                                  fontSize: 17.sp,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(width: 20.w),
                            FaIcon(
                              FontAwesomeIcons.circleDot,
                              color: ColorResources.brownDark,
                              size: 20.dg,
                            ),
                          ],
                        ),
                      ),

                      */

                          SizedBox(height: 0.h),
                          ExpansionTile(
                            title: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "explanation".i18n(),
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            controlAffinity: ListTileControlAffinity.trailing,
                            children: const <Widget>[
                              ListTile(
                                  title: Text(
                                      'This is tile number 3aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')),
                            ],
                          ),
                          SizedBox(height: 15.h),
                          CustomButton(
                            widgetInCenter: Align(
                              alignment: Alignment.center,
                              child: CustomText(
                                text: "continue".i18n(),
                                textAlign: TextAlign.center,
                                color: Colors.white,
                                txtSize: 17.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            color: ColorResources.buttonColor,
                            onTap: () {
                              model.pageController.nextPage(duration: const Duration(milliseconds: 500), curve:Curves.ease, );
                              //  Navigator.push(context, SlideTransition1(const ResultsScreen()));
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}


 Widget question(int index,{selectedQuestion = false}) => Consumer<ExamsViewModel>(
   builder: (BuildContext context, model, Widget? child) {
     return InkWell(
       onTap: ()
       {
         model.chooseQuestion(index: index);
       },
       child: Container(
         padding: EdgeInsets.symmetric(
             horizontal: 24.w, vertical: 18.h),
         decoration: ShapeDecoration(
           shape: RoundedRectangleBorder(
             side: BorderSide(
               width: selectedQuestion?2:1,
               color: selectedQuestion?ColorResources.greenDark:ColorResources.grey2,
             ),
             borderRadius: BorderRadius.circular(32),
           ),
         ),
         child: Row(
           //mainAxisAlignment: MainAxisAlignment.spaceBetween,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             Text(
               '${model.questionNums[index]}. ${model.questionList[index]}',
               style: Theme.of(context)
                   .textTheme
                   .displayMedium
                   ?.copyWith(
                 fontSize: 17.sp,
                 fontWeight: FontWeight.w400,
               ),
             ),
             const Spacer(),
             if(selectedQuestion)
             FaIcon(
               FontAwesomeIcons.circleDot,
               color: ColorResources.greenDark,
               size: 20.dg,
             ),
           ],
         ),
       ),
     );
   },
 );