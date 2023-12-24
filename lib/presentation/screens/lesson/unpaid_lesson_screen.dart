import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_anglish_app/business_logic/view_models/exams_vm/exams_vm.dart';
import 'package:learning_anglish_app/business_logic/view_models/home_vm/home_vm.dart';
import 'package:learning_anglish_app/business_logic/view_models/lessonScreen_vm/lessonScreen_vm.dart';
import 'package:learning_anglish_app/business_logic/view_models/themes_vm/themes_vm.dart';
import 'package:learning_anglish_app/data/models/lessons/lessons.dart';
import 'package:learning_anglish_app/presentation/screens/exams/exams_unsolved_screen.dart';
import 'package:learning_anglish_app/presentation/screens/exams/homework_screen.dart';
import 'package:learning_anglish_app/presentation/screens/videoScreen/videoScreen.dart';
import 'package:learning_anglish_app/presentation/widgets/button/custom_button.dart';
import 'package:learning_anglish_app/presentation/widgets/customDialog/customDialog.dart';
import 'package:learning_anglish_app/presentation/widgets/text/custom_text.dart';
import 'package:learning_anglish_app/utils/app_constants/app_constants.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';
import 'package:learning_anglish_app/utils/generalMethods/general_methods.dart';
import 'package:learning_anglish_app/utils/icons/icons.dart';
import 'package:localization/localization.dart';
import 'package:provider/provider.dart';

class UnpaidLessonScreen extends StatefulWidget {
  final bool? studentOwnIt;
  final String? unitName;
  final String? name;
  final String? videoUrl;
  final int? lessonId;
  final int? unitId;

  const UnpaidLessonScreen(this.studentOwnIt, this.unitName, this.name,
      this.videoUrl, this.lessonId, this.unitId,
      {super.key});

  @override
  State<UnpaidLessonScreen> createState() => _UnpaidLessonScreenState();
}

class _UnpaidLessonScreenState extends State<UnpaidLessonScreen> {
  @override
  void initState() {
    final homeVm = Provider.of<HomeViewModel>(context, listen: false);
    homeVm.validCode = widget.studentOwnIt!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeVm = Provider.of<HomeViewModel>(context);
    final themeVm = Provider.of<ThemesViewModel>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 25.h, left: 24.w, right: 24.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'الوحدة الأولى',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  fontSize: 18.sp,
                                  //color: Theme.of(context).primaryColor,
                                  // color: ColorResources.black,
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            'Getting away',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  fontSize: 16.sp,
                                  //color: Theme.of(context).primaryColor,
                                  // color: ColorResources.black,
                                  fontWeight: FontWeight.w400,
                                  height: 0.07.h,
                                ),
                          ),
                        ],
                      ),
                      //SizedBox(width: 10),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 32.h),
              GestureDetector(
                onTap: () {
                  if (homeVm.validCode) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            VideoScreen(widget.videoUrl!),
                      ),
                    );
                  } else {
                    ShowCustomDialog(
                      context: context,
                      content: StatefulBuilder(
                        builder: (BuildContext context,
                            void Function(void Function()) setStatee) {
                          return CodeDialogWidget(
                              widget.lessonId!, widget.unitId!);
                        },
                      ),
                    ).showCustomDialg(context);
                  }
                },
                child: Container(
                  width: 327.w,
                  height: 200.h,
                  decoration: ShapeDecoration(
                    image: const DecorationImage(
                      image: AssetImage("assets/images/lessonTeacherjpg.jpg"),
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  child: Center(
                    child: Container(
                      height: 36.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.dg),
                        color: ColorResources.red,
                      ),
                      child: Icon(Icons.lock, color: ColorResources.white1),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () {
                  if (homeVm.validCode) {
                    homeVm.checkExamsByLesson(widget.lessonId!);
                    homeVm.checkExamsByExamType(context, ExamType.homework);
                    if (homeVm.examId != null) {
                      print("examId");
                      print(homeVm.examId);
                      context.read<ExamsViewModel>().getExams(homeVm.examId!);
                      Navigator.push(
                          context, SlideTransition1(const HomeworkScreen()));
                    } else {
                      General.showToast(
                          message:
                              "No ${examTypeForToast.values.elementAt(ExamType.homework.index)} for this lesson yet");
                    }
                  } else {
                    ShowCustomDialog(
                      context: context,
                      content: StatefulBuilder(
                        builder: (BuildContext context,
                            void Function(void Function()) setStatee) {
                          return CodeDialogWidget(
                              widget.lessonId!, widget.unitId!);
                        },
                      ),
                    ).showCustomDialg(context);
                  }
                },
                child: Container(
                  height: 80.h,
                  width: double.infinity,
                  padding: EdgeInsets.all(24.dg),
                  //margin: EdgeInsets.all(24.dg),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: ColorResources.shadow,
                        blurRadius: 10.r,
                        offset: const Offset(
                          0,
                          8,
                        ),
                        spreadRadius: -8,
                      )
                    ],
                    color: themeVm.isDark == true
                        ? ColorResources.containerColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(32.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          width: 28.r,
                          height: 28.r,
                          padding: EdgeInsets.only(right: 3.w),
                          decoration: const ShapeDecoration(
                            color: Color(0xFF49423A),
                            shape: OvalBorder(),
                          ),
                          child: SvgPicture.asset(
                            IconResources.arrowleft,
                            color: Colors.white,
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'الواجب المنزلي',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  fontSize: 16.sp,
                                  //color: Theme.of(context).primaryColor,
                                  // color: ColorResources.black,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: -0.17.h,
                                ),
                          ),
                          CircleAvatar(
                            radius: 32.r,
                            backgroundImage: const AssetImage(
                              "assets/images/homework.png",
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              InkWell(
                onTap: () {
                  if (homeVm.validCode) {
                    homeVm.checkExamsByLesson(widget.lessonId!);
                    homeVm.checkExamsByExamType(context, ExamType.exam);
                    if (homeVm.examId != null) {
                      context.read<ExamsViewModel>().getExams(homeVm.examId!);
                      context
                          .read<ExamsViewModel>()
                          .isStudentTookExam(context, homeVm.examId!);
                    } else {
                      General.showToast(
                          message:
                              "No ${examTypeForToast.values.elementAt(ExamType.exam.index)} for this lesson yet");
                    }
                  } else {
                    ShowCustomDialog(
                      context: context,
                      content: StatefulBuilder(
                        builder: (BuildContext context,
                            void Function(void Function()) setStatee) {
                          return CodeDialogWidget(
                              widget.lessonId!, widget.unitId!);
                        },
                      ),
                    ).showCustomDialg(context);
                  }
                },
                child: Container(
                  height: 80.h,
                  width: double.infinity,
                  padding: EdgeInsets.all(24.dg),
                  //margin: EdgeInsets.all(24.dg),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: ColorResources.shadow,
                        blurRadius: 10.r,
                        offset: const Offset(
                          0,
                          8,
                        ),
                        spreadRadius: -8,
                      )
                    ],
                    color: themeVm.isDark == true
                        ? ColorResources.containerColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(32.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          width: 28.r,
                          height: 28.r,
                          padding: EdgeInsets.only(right: 3.w),
                          decoration: const ShapeDecoration(
                            color: Color(0xFF49423A),
                            shape: OvalBorder(),
                          ),
                          child: SvgPicture.asset(
                            IconResources.arrowleft,
                            color: Colors.white,
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'امتحان الحصة',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: -0.17.h,
                                ),
                          ),
                          SizedBox(width: 16.w),
                          Container(
                            height: 32.r,
                            width: 32.r,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                image: const DecorationImage(
                                  image: AssetImage(
                                    "assets/images/testYourself.png",
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ],
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

class CodeDialogWidget extends StatefulWidget {
  final int lessonId;
  final int unitId;

  const CodeDialogWidget(this.lessonId, this.unitId, {super.key});

  @override
  State<CodeDialogWidget> createState() => _CodeDialogWidgetState();
}

class _CodeDialogWidgetState extends State<CodeDialogWidget> {
  @override
  void initState() {
    final homeVm = Provider.of<HomeViewModel>(context, listen: false);
    homeVm.codeController.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeVm = Provider.of<ThemesViewModel>(context);
    final homeVm = Provider.of<HomeViewModel>(context);
    return Container(
      height: 550.h,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
              color: themeVm.isDark == true ? Colors.white : Colors.transparent,
              width: .1)),
      child: Padding(
        padding: EdgeInsets.all(25.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 96.w,
              height: 96.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/enterUnitCode.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: 24.h),
            Text(
              "قم بإدخال الكود",
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                  ),
            ),
            SizedBox(height: 15.h),
            Text(
              "كي تتمكن من مشاهده الفيديو ، يجب إدخال الكود. يمكنك الحصول عليه من المعلم",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    //color: Theme.of(context).primaryColor.withOpacity(0.5),
                  ),
            ),
            SizedBox(height: 24.h),
            Container(
              width: 279.w,
              height: 56.h,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: Colors.black.withOpacity(0.25),
                  ),
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
              child: TextFormField(
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                decoration: InputDecoration(
                  hintText: "ادخل الكود",
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 17.h, horizontal: 24.w),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                controller: homeVm.codeController,
              ),
            ),
            SizedBox(height: 24.h),
            CustomButton(
              widgetInCenter: Align(
                alignment: Alignment.center,
                child: CustomText(
                  text: "إدخال".i18n(),
                  textAlign: TextAlign.center,
                  color: Colors.white,
                  txtSize: 17.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              color: ColorResources.buttonColor,
              onTap: () async {
                //    await lessonVM.showVideo();
                //    lessonVM.codeDone? Navigator.pop(context):null;
                homeVm.postLessonCode(
                    lessonId: widget.lessonId,
                    context: context,
                    unitId: widget.unitId);
              },
            ),
            SizedBox(height: 4.h),
            TextButton(
              child: Text(
                "go_back".i18n(),
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      height: 0.12.h,
                    ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
