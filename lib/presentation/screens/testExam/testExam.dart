
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_anglish_app/business_logic/view_models/exams_vm/exams_vm.dart';
import 'package:learning_anglish_app/business_logic/view_models/themes_vm/themes_vm.dart';
import 'package:learning_anglish_app/presentation/widgets/button/custom_button.dart';
import 'package:learning_anglish_app/presentation/widgets/text/custom_text.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';
import 'package:learning_anglish_app/utils/icons/icons.dart';
import 'package:localization/localization.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';


class TestExam extends StatefulWidget {
  const TestExam({super.key});

  @override
  State<TestExam> createState() => _TestExamState();
}

class _TestExamState extends State<TestExam>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final examsVM = Provider.of<ExamsViewModel>(context);
    final themeVm = Provider.of<ThemesViewModel>(context);
    return SafeArea(
      child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body:Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 32.h, left: 8.w, right: 8.w),
                child: SizedBox(
                  height: 1.sh-62.h,
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
                                  color: themeVm.isDark == true
                                      ? Colors.black
                                      : Colors.white, // White background
                                  border: Border.all(
                                    color: Colors.grey, // Grey border color
                                    width: 1.0, // Border width
                                  ),
                                ),
                                child: Center(
                                    child: SvgPicture.asset(
                                      IconResources.arrowleft,
                                      color: themeVm.isDark == true
                                          ? Colors.white
                                          : Colors.black,
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
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 22.h),
                                  Text(
                                    'Unit 1/ Lesson 1',
                                    textAlign: TextAlign.justify,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(
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
                      SizedBox(height: 10.h),
                      /*
                      Row(
                        children: [
                          LinearPercentIndicator(
                            isRTL: true,
                            barRadius: Radius.circular(8.r),
                            width: 305.w,
                            lineHeight: 8.0,
                            percent: (widget.index + 1).toDouble() / 10.0,
                            backgroundColor: Colors.grey[300],
                            progressColor: const Color(0xff1c1c1a),
                          ),
                          Text(
                            '10/${widget.index + 1}',
                            textAlign: TextAlign.justify,
                            style:
                            Theme.of(context).textTheme.displayMedium?.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              height: 0.16.h,
                            ),
                          ),
                        ],
                      ),

                       */
                      SizedBox(height: 20.h),
                      Expanded(
                        child: ListView.separated(
                            itemBuilder: (context,index)=>ExamWidgets(context, index),
                            separatorBuilder: (context,index)=>SizedBox(height: 30.h),
                            itemCount: 10),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
          /*
          PageView.builder(
              controller: examsVM.pageController,
              scrollDirection: Axis.vertical,
              itemCount: 10,
              onPageChanged: (int page) {
                setState(() {
                  examsVM.currentPage = page + 1;
                });
              },
              itemBuilder: (context, index) {
                return ExamWidgets(context, index);
              })

           */

      ),
    );
  }
}

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
    examVM.selectedIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeVm = Provider.of<ThemesViewModel>(context);
    return Consumer<ExamsViewModel>(
      builder: (BuildContext contextt, model, Widget? child) {
        return Container(
          decoration: ShapeDecoration(
            color: themeVm.isDark == true
                ? Colors.black
                : ColorResources.white1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(56.r),
            ),
          ),
          margin: EdgeInsets.only(
              right: 8.w, left: 8.w), //, top: 45.h),
          padding:
          EdgeInsets.only(right: 15.w, left: 15.w, top: 10.h),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                          borderRadius:
                          BorderRadius.circular(50.dg),
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 8.sp),
                          child: Text(
                            '${widget.index + 1}',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              height: 0.16.h,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 4.w),
                        Expanded(
                          child: Text(
                              '${widget.index+1} - Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum ___________ the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                              //textAlign: TextAlign.justify,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400,
                              )),
                        ),
                      ],
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
                    itemBuilder: (context, index) =>  Question(index),
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 10.h),
                    itemCount: 4),
              ),
            ],
          ),
        );
      },
    );
  }
}

Widget question(int index, {selectedQuestion = false}) =>
    Consumer<ExamsViewModel>(
      builder: (BuildContext context, model, Widget? child) {
        return InkWell(
          onTap: () {
            model.chooseQuestion(index: index);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 18.h),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: selectedQuestion ? 2 : 1,
                  color: selectedQuestion
                      ? ColorResources.greenDark
                      : ColorResources.grey2,
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
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                if (selectedQuestion)
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

class Question extends StatefulWidget {
  final int index;
  const Question( this.index, {super.key});

  @override
  State<Question> createState() => _QuestionState();
}
int? selectedContainer = 0;
class _QuestionState extends State<Question> {
  @override
  Widget build(BuildContext context) {

    return  Consumer<ExamsViewModel>(
      builder: (BuildContext context, model, Widget? child) {
        return InkWell(
          onTap: () {
            selectedContainer = widget.index;
            model.chooseQuestion();
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 18.h),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: selectedContainer ==widget.index ? 2 : 1,
                  color: selectedContainer ==widget.index
                      ? ColorResources.greenDark
                      : ColorResources.grey2,
                ),
                borderRadius: BorderRadius.circular(32),
              ),
            ),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${model.questionNums[widget.index]}. ${model.questionList[widget.index]}',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                if (selectedContainer ==widget.index)
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
  }
}
