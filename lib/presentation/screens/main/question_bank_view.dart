import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                Scaffold.of(context).openDrawer();
              },
              icon: Icons.menu,
              text: "question_bank".i18n(),
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                // physics: AlwaysScrollableScrollPhysics(),
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: 24.w, right: 24.w, top: 16.h, bottom: 24.h),
                    padding: EdgeInsets.only(bottom: 24.h),
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32.r),
                  
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 16.h),
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
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
