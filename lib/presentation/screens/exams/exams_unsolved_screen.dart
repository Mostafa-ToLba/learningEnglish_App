import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_anglish_app/business_logic/view_models/exams_vm/exams_vm.dart';
import 'package:learning_anglish_app/business_logic/view_models/themes_vm/themes_vm.dart';
import 'package:learning_anglish_app/data/models/answers/answers_model.dart';
import 'package:learning_anglish_app/presentation/widgets/button/custom_button.dart';
import 'package:learning_anglish_app/presentation/widgets/text/custom_text.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';
import 'package:learning_anglish_app/utils/generalMethods/general_methods.dart';
import 'package:learning_anglish_app/utils/icons/icons.dart';
import 'package:localization/localization.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ExamsUnsolvedScreen extends StatefulWidget {
  final int examId;
  const ExamsUnsolvedScreen({super.key, required this.examId});

  @override
  State<ExamsUnsolvedScreen> createState() => _ExamsUnsolvedScreenState();
}

class _ExamsUnsolvedScreenState extends State<ExamsUnsolvedScreen> {
  @override
  void initState() {
    /*
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      context.read<ExamsViewModel>().getExams(widget.examId);
    });
    */
    super.initState();
  }

  List<Result> answers = List.empty(growable: true);
  static Set<int> questionId = Set();
  int questionIndex = 1;
  @override
  Widget build(BuildContext context) {
    final themeVm = Provider.of<ThemesViewModel>(context);
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
                    body: SafeArea(
                      child: Padding(
                        padding:
                            EdgeInsets.only(top: 32.h, left: 8.w, right: 8.w),
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
                                      height: 40.r,
                                      padding: EdgeInsets.only(right: 4.w),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: themeVm.isDark == true
                                            ? Colors.black
                                            : Colors.white, // White background
                                        border: Border.all(
                                          color:
                                              Colors.grey, // Grey border color
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
                                  percent: (questionIndex).toDouble() /
                                      model.examModel!.data!.questions!.length,
                                  backgroundColor: Colors.grey[300],
                                  progressColor: const Color(0xff1c1c1a),
                                ),
                                Text(
                                  //'10/${index + 1}',
                                  '${model.examModel!.data!.questions!.length}/$questionIndex',
                                  textAlign: TextAlign.justify,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        height: 0.16.h,
                                      ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: ListView(
                                physics: const BouncingScrollPhysics(),
                                children: [
                                  SizedBox(height: 45.h),
                                  Container(
                                    decoration: ShapeDecoration(
                                      color: themeVm.isDark == true
                                          ? Colors.black
                                          : ColorResources.white1,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(56.r),
                                      ),
                                    ),
                                    //padding: const EdgeInsets.all(8.0),
                                    margin: EdgeInsets.only(
                                        right: 8.w, left: 8.w), //, top: 45.h),
                                    padding: EdgeInsets.only(
                                        right: 20.w, left: 20.w, top: 25.h),

                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      physics: const BouncingScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      itemCount: model
                                          .examModel!.data!.questions!.length,
                                      itemBuilder: (context, index) {
                                        return VisibilityDetector(
                                          key: Key(index.toString()),
                                          onVisibilityChanged:
                                              (VisibilityInfo info) {
                                            if (info.visibleFraction == 1) {
                                              setState(() {
                                                questionIndex = index + 1;
                                              });
                                            }
                                          },
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: 32.w,
                                                      height: 32.h,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration:
                                                          ShapeDecoration(
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          side: BorderSide(
                                                            width: 1,
                                                            color:
                                                                ColorResources
                                                                    .red,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50.dg),
                                                        ),
                                                      ),
                                                      child: Center(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 8.sp),
                                                          child: Text(
                                                            '${index + 1}',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .displayMedium
                                                                ?.copyWith(
                                                                  fontSize:
                                                                      14.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  height:
                                                                      0.16.h,
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
                                                            .questions![index]
                                                            .questionBody!,
                                                        //textAlign: TextAlign.justify,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .displayMedium
                                                            ?.copyWith(
                                                              fontSize: 16.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 10.h),
                                              // choicesBody(index),
                                              QuestionWidget(
                                                  index: index,
                                                  questionId: questionId,
                                                  answers: answers),
                                              SizedBox(height: 0.h),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
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
                                      if (answers.length !=
                                          model.examModel!.data!
                                              .numberOfQuestions) {
                                        General.showToast(
                                            message:
                                                "Please answer all questions");
                                      } else {
                                        final examsResult = AnswersModel(
                                          examId: model.examModel!.data!.id,
                                          result: answers,
                                        );

                                        model.saveExamResult(
                                            context, examsResult);
                                      }

                                      /*
                              model.pageController.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                              */
                                      //print(examModelList);
                                      //  Navigator.push(context, SlideTransition1(const ResultsScreen()));
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : Scaffold(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    body: const Center(
                      child: Text("No exams"),
                    ),
                  ));
      },
    );
  }
}

class QuestionWidget extends StatefulWidget {
  final int index;
  final Set<int> questionId;
  final List<Result> answers;
  const QuestionWidget({
    super.key,
    required this.index,
    required this.questionId,
    required this.answers,
  });

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  int? groupValue;
  @override
  Widget build(BuildContext context) {
    return Consumer<ExamsViewModel>(
      builder: (BuildContext context, model, Widget? child) {
        return Wrap(
          children: List<Widget>.generate(
            model.examModel!.data!.questions![widget.index].answers!.length,
            (int answerIndex) {
              return InkWell(
                onTap: () {
                  setState(() {
                    groupValue = answerIndex;
                    int questionId =
                        model.examModel!.data!.questions![widget.index].id!;
                    int answerId = model.examModel!.data!
                        .questions![widget.index].answers![answerIndex].id!;

                    bool exists = widget.answers
                        .any((answer) => answer.questionId == questionId);
                    if (exists) {
                      widget.answers[widget.index].changeAnswerId(answerId);
                    } else {
                      widget.questionId.add(questionId);
                      widget.answers.add(
                          Result(questionId: questionId, answerId: answerId));
                    }
                  });
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 5.h),
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: groupValue == answerIndex ? 2 : 1,
                        color: groupValue == answerIndex
                            ? ColorResources.brownDark
                            : ColorResources.grey2,
                      ),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    color: groupValue == answerIndex
                        ? ColorResources.brownLight
                        : Colors.transparent,
                  ),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        model.examModel!.data!.questions![widget.index]
                            .answers![answerIndex].answerBody!,
                        style:
                            Theme.of(context).textTheme.displayMedium?.copyWith(
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w400,
                                  color: groupValue == answerIndex
                                      ? ColorResources.brownDark
                                      : ColorResources.appGreyColor,
                                ),
                      ),
                      const Spacer(),
                      if (groupValue == answerIndex)
                        FaIcon(
                          FontAwesomeIcons.circleDot,
                          color: ColorResources.brownDark,
                          size: 20.dg,
                        ),
                      /*
                      Radio<int>(
                        activeColor: ColorResources.buttonColor,
                        value: answerIndex,
                        groupValue: groupValue,
                        toggleable: true,
                        */
                    ],
                  ),
                ),
              );
            },
          ).toList(),
        );
      },
    );
  }
}
