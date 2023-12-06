import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_anglish_app/presentation/screens/result/results_page.dart';
import 'package:learning_anglish_app/presentation/widgets/button/custom_button.dart';
import 'package:learning_anglish_app/presentation/widgets/text/custom_text.dart';
import 'package:learning_anglish_app/utils/app_constants/app_constants.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:localization/localization.dart';

class ExamsScreen extends StatefulWidget {
  const ExamsScreen({super.key});

  @override
  State<ExamsScreen> createState() => _ExamsScreenState();
}

class _ExamsScreenState extends State<ExamsScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
          seconds: 2), // Animation duration (2 seconds in this example)
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0), // Start position (bottom of the screen)
      end: const Offset(0.0, 0.0), // End position (original position)
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn, // Adjust the curve as needed
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 32.h, left: 8.w, right: 8.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 30.w),
                  const Spacer(),
                  Column(
                    children: [
                      Text(
                        'Exams',
                        style:
                            Theme.of(context).textTheme.displayMedium?.copyWith(
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                      SizedBox(height: 22.h),
                      Text(
                        'Unit 1/ Lesson 1',
                        textAlign: TextAlign.justify,
                        style:
                            Theme.of(context).textTheme.displayMedium?.copyWith(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          color: Theme.of(context)
                              .indicatorColor
                              .withOpacity(0.25),
                        ),
                        borderRadius: BorderRadius.circular(32.r),
                      ),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        size: 20.dg,
                      ), //circle_chevron_left
                    ),
                  ),
                  SizedBox(width: 16.w),
                ],
              ),
              SizedBox(height: 32.h),
              Row(
                children: [Text(
                    '10/10',
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          height: 0.16.h,
                        ),
                  ),
                  LinearPercentIndicator(
                    isRTL: true,
                    width: 285.w,
                    lineHeight: 8.0,
                    percent: 0.9,
                    backgroundColor:
                        Theme.of(context).colorScheme.inverseSurface,
                    progressColor: ColorResources.brownDark,
                  ),
                  
                ],
              ),
              SizedBox(height: 45.h),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(56.r),
                      ),
                    ),
                    //padding: const EdgeInsets.all(8.0),
                    margin:
                        EdgeInsets.only(right: 8.w, left: 8.w), //, top: 45.h),
                    padding:
                        EdgeInsets.only(right: 24.w, left: 24.w, top: 24.h),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  '  the question thar is shown to students and it is a multi line based on the length of the question and to make sure that srolling is working fine',
                                  //textAlign: TextAlign.justify,
                                  textAlign: TextAlign.end,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.h, horizontal: 10.w),
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 1,
                                      color: ColorResources.red,
                                    ),
                                    borderRadius: BorderRadius.circular(50.r),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '100',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.copyWith(
                                            fontSize: 16.sp,
                                            fontFamily: "Inter",
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        // answer one (not selected)
                        SizedBox(height: 10.h),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24.w, vertical: 18.h),
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                color: ColorResources.grey2,
                              ),
                              borderRadius: BorderRadius.circular(32),
                            ),
                          ),
                          child: Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.circleDot,
                                color: ColorResources.brownDark,
                                size: 20.dg,
                              ),
                              SizedBox(width: 20.w),
                              Expanded(
                                child: Text(
                                  'A. Answer One. this is anithe text to make sure it is visable in the entire container',
                                  textAlign: TextAlign.end,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // answer two (selected and right)

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
                              Icon(
                                Icons.check_circle_outline_rounded,
                                color: ColorResources.greenDark,
                                size: 20.dg,
                              ),
                              SizedBox(width: 20.w),
                              Expanded(
                                child: Text(
                                  'B. Answer Two',
                                  textAlign: TextAlign.end,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
                                        color: ColorResources.greenDark,
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
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
                              FaIcon(
                                FontAwesomeIcons.circleXmark,
                                color: ColorResources.redDark,
                                size: 20.dg,
                              ),
                              SizedBox(width: 20.w),
                              Expanded(
                                child: Text(
                                  'C. Answer Three',
                                  textAlign: TextAlign.end,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
                                        color: ColorResources.redDark,
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
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
                              FaIcon(
                                FontAwesomeIcons.circleDot,
                                color: ColorResources.brownDark,
                                size: 20.dg,
                              ),
                              SizedBox(width: 20.w),
                              Expanded(
                                child: Text(
                                  'D. Answer Four',
                                  textAlign: TextAlign.end,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
                                        color: ColorResources.brownDark,
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        /*
fontSize: 16,
fontFamily: 'Roboto',
fontWeight: FontWeight.w500,
                        */

                        SizedBox(height: 32.h),
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
                        SizedBox(height: 62.h),
                        SlideTransition(
                          position: _offsetAnimation,
                          child: CustomButton(
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
                              Navigator.push(context,
                                  SlideTransition1(const ResultsScreen()));
                            },
                          ),
                        ),

                        SizedBox(height: 24.h),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
