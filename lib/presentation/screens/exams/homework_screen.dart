import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_anglish_app/business_logic/view_models/exams_vm/exams_vm.dart';
import 'package:learning_anglish_app/business_logic/view_models/home_vm/home_vm.dart';
import 'package:learning_anglish_app/business_logic/view_models/themes_vm/themes_vm.dart';
import 'package:learning_anglish_app/presentation/widgets/button/custom_button.dart';
import 'package:learning_anglish_app/presentation/widgets/text/custom_text.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';
import 'package:learning_anglish_app/utils/generalMethods/general_methods.dart';
import 'package:learning_anglish_app/utils/icons/icons.dart';
import 'package:localization/localization.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class HomeworkScreen extends StatefulWidget {
  final int lessonId;
  final String screenType;
  const HomeworkScreen(this.lessonId, this.screenType, {super.key});

  @override
  State<HomeworkScreen> createState() => _HomeworkScreenState();
}

class _HomeworkScreenState extends State<HomeworkScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
 //   SchedulerBinding.instance.addPostFrameCallback((_) async {
      final homeVm = Provider.of<HomeViewModel>(context, listen: false);
      final examVm = Provider.of<ExamsViewModel>(context, listen: false);
      examVm.examModel=null;
      context.read<HomeViewModel>().checkExamsByLessonn(widget.lessonId);
      context.read<HomeViewModel>().checkExamsByExamTypee(context,
          widget.screenType == 'home' ? ExamType.homework : ExamType
              .questionbank);
      if (homeVm.examId != null) {
        print("examId");
        print(homeVm.examId);
        context.read<ExamsViewModel>().getExams(homeVm.examId!);
      } else {
        examVm.examModel=null;
        General.showToast(
            message:
            "No ${examTypeForToast.values.elementAt(
                widget.screenType == 'home' ? ExamType.homework.index : ExamType
                    .questionbank.index)} for this lesson yet");
        Navigator.of(context);
      }
  //  });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExamsViewModel>(
        builder: (BuildContext contextt, model, Widget? child) {
   //       print('***************examModellllll ${model.examModel}');
      return model.busy
          ? Scaffold(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              body: const Center(
                child: CircularProgressIndicator(),
              ),
            ) //: Text(model.notificationModel!.data.toString());
          : model.examModel!=null
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
                  appBar: AppBar(backgroundColor: ColorResources.buttonColor,
                      title:CustomText(text:widget.screenType=='home'?'الواجب المنزلي':'بنك الأسئلة',txtSize:20.sp,color: Colors.white,)),
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  body: Column(
                    mainAxisAlignment:MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:
                    [
                      Container(
                        width: 1.sw,
                        color: Colors.transparent,
                        child: Lottie.asset('assets/lottieAnimations/noData2.json',fit: BoxFit.cover,),
                      ),
                      CustomText(text:widget.screenType=='home'?'الحصة ليس بها واجب منزلي': 'الحصة ليس بها بنك اسئلة',txtSize: 17.sp,color:Provider.of<ThemesViewModel>(context).isDark==true?Colors.white:ColorResources.buttonColor),
                      SizedBox(height: 120.h),
                    ],
                  ),
                );
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
                            SizedBox(height: 12.h),
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
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LinearPercentIndicator(
                      isRTL: false,
                      barRadius: Radius.circular(8.r),
                      width: 305.w,
                      lineHeight: 7.h,
                      percent: (widget.index + 1).toDouble() /
                          model.examModel!.data!.questions!.length,
                      backgroundColor: Colors.grey[300],
                      progressColor: const Color(0xff1c1c1a),
                    ),
                    Text(
                      '${widget.index + 1} / ${model.examModel!.data!.questions!.length}',
                      textAlign: TextAlign.justify,
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
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
                          right: 3.w, left: 3.w), //, top: 45.h),
                      padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 25.h),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
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
                              SizedBox(width: 6.w),
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
                                      fontWeight:
                                      FontWeight
                                          .w500,
                                        )),
                              ),
                            ],
                          ),
                          // answer one (not selected)
                          SizedBox(height: 12.h),
                          model.isShowAnswerChecked
                              ? QuestionWidget(index: widget.index)
                              :
                          SizedBox(
                                  height: 300.h,
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
                                          .answerReview!,style: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.copyWith(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),),
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

                          // SizedBox(height: 15.h),
                          // CustomButton(
                          //   widgetInCenter: Align(
                          //     alignment: Alignment.center,
                          //     child: CustomText(
                          //       text: "continue".i18n(),
                          //       textAlign: TextAlign.center,
                          //       color: Colors.white,
                          //       txtSize: 17.sp,
                          //       fontWeight: FontWeight.w600,
                          //     ),
                          //   ),
                          //   color: ColorResources.buttonColor,
                          //   onTap: () {
                          //     model.pageController.nextPage(
                          //       duration: const Duration(milliseconds: 500),
                          //       curve: Curves.ease,
                          //     );
                          //     //  Navigator.push(context, SlideTransition1(const ResultsScreen()));
                          //   },
                          // ),
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
    final themeVm = Provider.of<ThemesViewModel>(context);
    return Consumer<ExamsViewModel>(
      builder: (BuildContext context, model, Widget? child) {
        return Wrap(runSpacing: 10.h,
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
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 17.h),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: isCorrect || (studentAnswer != null)
                          ? 2
                          : 1,
                      color:
                      isCorrect?ColorResources.greenDark:(answerIndex==model.selectedIndex && studentAnswer!)?ColorResources.greenLight:
                    (answerIndex==model.selectedIndex && studentAnswer==false)?ColorResources.redDark:ColorResources.grey2,
                      // isCorrect || (studentAnswer != null)
                      //     ? isCorrect
                      //         ? ColorResources.greenDark
                      //         : ColorResources.redDark
                      //     : ColorResources.grey2,
                    ),
                    borderRadius: BorderRadius.circular(32),
                  ),
                  color:isCorrect?ColorResources.greenLight:(answerIndex==model.selectedIndex && studentAnswer!)?ColorResources.greenLight:
                  (answerIndex==model.selectedIndex && studentAnswer==false)?ColorResources.redLight:Colors.transparent,

                  // isCorrect || (studentAnswer != null)
                  //     ? isCorrect
                  //         ? ColorResources.greenLight
                  //         : ColorResources.redLight
                  //     : Colors.transparent,
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
                            fontWeight: FontWeight.w500,
                            color:
                                // isCorrect || (studentAnswer != null)
                                //     ? isCorrect
                                //         ? ColorResources.greenDark
                                //         : ColorResources.redDark
                                //     : ColorResources.brownDark,
                            isCorrect?ColorResources.greenDark:(answerIndex==model.selectedIndex && studentAnswer!)?ColorResources.greenLight:
                            (answerIndex==model.selectedIndex && studentAnswer==false)?ColorResources.redDark:themeVm.isDark==true?Colors.white:ColorResources.brownDark,
                          ),
                    ),
                    const Spacer(),
                    /*
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

                     */
                    isCorrect?FaIcon(
                      FontAwesomeIcons.check,
                      color: ColorResources.greenDark,
                      size: 20.dg,
                    ):(answerIndex==model.selectedIndex && studentAnswer!)?FaIcon(
                      FontAwesomeIcons.check,
                      color: ColorResources.greenDark,
                      size: 20.dg,
                    ):
                    (answerIndex==model.selectedIndex && studentAnswer==false)?FaIcon(
                      FontAwesomeIcons.x,
                      color: ColorResources.redDark,
                      size: 20.dg,
                    ):const Card(),
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

Widget questionn(int quesionIndex, int answerIndex,
        {selectedQuestion = false}) =>
    Consumer<ExamsViewModel>(
      builder: (BuildContext context, model, Widget? child) {
        Color containerColor = Colors.transparent;
        return InkWell(
          onTap: () {
            model.chooseAnswerInHomeworkAndExams(answerIndex);






          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 5.h),
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 17.h),
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
              color: containerColor
              // model.selectedIndex == answerIndex
              //     ? ColorResources.brownLight
              //     : Colors.transparent,
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

class question extends StatefulWidget {
  final int quesionIndex;
  final int answerIndex;
  final bool selectedQuestion;

  const question(this.quesionIndex, this.answerIndex, {super.key, this.selectedQuestion=false});

  @override
  State<question> createState() => _questionState();
}

class _questionState extends State<question> {
  @override
  Widget build(BuildContext context) {
    final themeVm = Provider.of<ThemesViewModel>(context);
    return Consumer<ExamsViewModel>(
      builder: (BuildContext context, model, Widget? child) {
        return InkWell(
          onTap: () {
            model.chooseAnswerInHomeworkAndExams(widget.answerIndex);
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 5.h),
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 17.h),
            decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: model.selectedIndex == widget.answerIndex ? 2 : 1,
                    color: model.selectedIndex == widget.answerIndex
                        ? ColorResources.brownDark
                        : ColorResources.grey2,
                  ),
                  borderRadius: BorderRadius.circular(32),
                ),
                color: model.selectedIndex == widget.answerIndex
                  ? ColorResources.brownLight
                  : Colors.transparent,
            ),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  model.examModel!.data!.questions![widget.quesionIndex]
                      .answers![widget.answerIndex].answerBody!,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w500,
                    color: model.selectedIndex == widget.answerIndex
                        ? themeVm.isDark==true?Colors.white:ColorResources.brownDark
                        : themeVm.isDark==false?ColorResources.black:Colors.white,
                  ),
                ),
                const Spacer(),
                if (model.selectedIndex == widget.answerIndex)
                  FaIcon(
                    FontAwesomeIcons.circleDot,
                    color: themeVm.isDark==true?Colors.white:ColorResources.brownDark,
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

