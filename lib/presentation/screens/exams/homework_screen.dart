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

class HomeworkScreen extends StatefulWidget {
  const HomeworkScreen({super.key});

  @override
  State<HomeworkScreen> createState() => _HomeworkScreenState();
}

class _HomeworkScreenState extends State<HomeworkScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExamsViewModel>(
        builder: (BuildContext contextt, model, Widget? child) {
      return model.busy == true
          ? Scaffold(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              body: const Center(
                child: CircularProgressIndicator(),
              ),
            ) //: Text(model.notificationModel!.data.toString());
          : ((model.examModel?.data != null)
              ? Scaffold(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  body: PageView.builder(
                    controller: model.pageController,
                    scrollDirection: Axis.vertical,
                    itemCount: model.examModel!.data!.questions!.length,
                    onPageChanged: (int page) {
                      setState(() {
                        model.isShowAnswerChecked = false;
                        model.selectedIndex = null;
                        model.currentPage = page + 1;
                      });
                    },
                    itemBuilder: (context, index) {
                      print("index");
                      print(index);
                      return HomeworkWidgets(context, index);
                    },
                  ),
                )
              : Scaffold(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  body: const Center(
                    child: Text("No exams"),
                  ),
                ));
    });
  }
}

class HomeworkWidgets extends StatefulWidget {
  final int index;
  const HomeworkWidgets(BuildContext context, this.index, {super.key});

  @override
  State<HomeworkWidgets> createState() => _HomeworkWidgetsState();
}

class _HomeworkWidgetsState extends State<HomeworkWidgets> {
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
                          model.isShowAnswerChecked = false;
                          model.selectedIndex = null;
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
                SizedBox(height: 32.h),
                Row(
                  children: [
                    LinearPercentIndicator(
                      isRTL: true,
                      barRadius: Radius.circular(8.r),
                      width: 305.w,
                      lineHeight: 8.0,
                      percent: (widget.index + 1).toDouble() /
                          model.examModel!.data!.questions!.length,
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
                SizedBox(height: 45.h),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      decoration: ShapeDecoration(
                        color: themeVm.isDark == true
                            ? Colors.black
                            : ColorResources.white1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(56.r),
                        ),
                      ),
                      //padding: const EdgeInsets.all(8.0),
                      margin: EdgeInsets.only(
                          right: 8.w, left: 8.w), //, top: 45.h),
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
                                SizedBox(width: 4.w),
                                Expanded(
                                  child: Text(
                                      model
                                          .examModel!
                                          .data!
                                          .questions![widget.index]
                                          .questionBody!,
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
                          ),

                          // answer one (not selected)
                          SizedBox(height: 10.h),
                          model.isShowAnswerChecked
                              ? QuestionWidget(index: widget.index)
                              : SizedBox(
                                  height: 280.h,
                                  child: ListView.separated(
                                      physics: const BouncingScrollPhysics(),
                                      itemBuilder: (context, answerIndex) =>
                                          question(widget.index, answerIndex,
                                              selectedQuestion:
                                                  model.selectedIndex ==
                                                      answerIndex),
                                      separatorBuilder: (context, index) =>
                                          SizedBox(height: 10.h),
                                      itemCount: 4),
                                ),
                          SizedBox(height: 0.h),
                          model.isShowAnswerChecked
                              ? ExpansionTile(
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
                                  controlAffinity:
                                      ListTileControlAffinity.trailing,
                                  children: <Widget>[
                                    ListTile(
                                      title: Text(model
                                          .examModel!
                                          .data!
                                          .questions![widget.index]
                                          .answerReview!),
                                    ),
                                  ],
                                )
                              : const Card(),
                          SizedBox(height: 15.h),
                          CustomButton(
                            widgetInCenter: Align(
                              alignment: Alignment.center,
                              child: CustomText(
                                text: "Check answer",
                                textAlign: TextAlign.center,
                                color: Colors.white,
                                txtSize: 17.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            color: ColorResources.buttonColor,
                            onTap: () {
                              model.checkAnswer();
                              //  Navigator.push(context, SlideTransition1(const ResultsScreen()));
                            },
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
                              model.pageController.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
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

class QuestionWidget extends StatefulWidget {
  final int index;

  const QuestionWidget({
    super.key,
    required this.index,
  });

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ExamsViewModel>(
      builder: (BuildContext context, model, Widget? child) {
        return Wrap(
          children: List<Widget>.generate(
            model.examModel!.data!.questions![widget.index].answers!.length,
            (int answerIndex) {
              print(answerIndex);
              final isCorrect = model.examModel!.data!.questions![widget.index]
                  .answers![answerIndex].isCorrect!;


                   print("isCorrectanswers ${model.examModel!.data!.questions![widget.index]
                  .answers![answerIndex].isCorrect!}"); 
                print("isCorrect $isCorrect"); 
              final studentSelectedIndex = model.selectedIndex;
              print("studentSelectedIndex $studentSelectedIndex"); 
              final studentAnswer = (studentSelectedIndex != null)
                  ? model.examModel!.data!.questions![widget.index]
                      .answers![studentSelectedIndex].isCorrect 
                  : null;
              print("studentAnswer $studentAnswer"); 
              print("studentAnswer ${model.examModel!.data!.questions![widget.index]
                      .answers![studentSelectedIndex!]}"); 
              print( isCorrect || (studentAnswer != null));
              return Container(
                margin: EdgeInsets.symmetric(vertical: 5.h),
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: isCorrect || (studentAnswer != null)
                          ? 2
                          : 1,
                      color: isCorrect || (studentAnswer != null)
                          ? isCorrect
                              ? ColorResources.greenDark
                              : ColorResources.redDark
                          : ColorResources.grey2,
                    ),
                    borderRadius: BorderRadius.circular(32),
                  ),
                  color: isCorrect || (studentAnswer != null)
                      ? isCorrect
                          ? ColorResources.greenLight
                          : ColorResources.redLight
                      : Colors.transparent,
                ),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      model.examModel!.data!.questions![widget.index]
                          .answers![answerIndex].answerBody!,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w400,
                            color:
                                isCorrect || (studentAnswer != null)
                                    ? isCorrect
                                        ? ColorResources.greenDark
                                        : ColorResources.redDark
                                    : ColorResources.brownDark,
                          ),
                    ),
                    const Spacer(),
                    isCorrect || (studentAnswer != null)
                        ? isCorrect
                            ? FaIcon(
                                FontAwesomeIcons.check,
                                color: ColorResources.greenDark,
                                size: 20.dg,
                              )
                            : FaIcon(
                                FontAwesomeIcons.x,
                                color: ColorResources.redDark,
                                size: 20.dg,
                              )
                        : Card(),
                  ],
                ),
              );
            },
          ).toList(),
        );
      },
    );
  }
}

Widget question(int quesionIndex, int answerIndex,
        {selectedQuestion = false}) =>
    Consumer<ExamsViewModel>(
      builder: (BuildContext context, model, Widget? child) {
        return InkWell(
          onTap: () {
            model.chooseAnswerInHomeworkAndExams(answerIndex);
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 5.h),
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: model.selectedIndex == answerIndex ? 2 : 1,
                  color: model.selectedIndex == answerIndex
                      ? ColorResources.brownDark
                      : ColorResources.grey2,
                ),
                borderRadius: BorderRadius.circular(32),
              ),
              color: model.selectedIndex == answerIndex
                  ? ColorResources.brownLight
                  : Colors.transparent,
            ),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  model.examModel!.data!.questions![quesionIndex]
                      .answers![answerIndex].answerBody!,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w400,
                        color: model.selectedIndex == answerIndex
                            ? ColorResources.brownDark
                            : ColorResources.appGreyColor,
                      ),
                ),
                const Spacer(),
                if (model.selectedIndex == answerIndex)
                  FaIcon(
                    FontAwesomeIcons.circleDot,
                    color: ColorResources.brownDark,
                    size: 20.dg,
                  ),
              ],
            ),
          ),
        );
      },
    );
