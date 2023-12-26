import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_anglish_app/business_logic/view_models/home_vm/home_vm.dart';
import 'package:learning_anglish_app/business_logic/view_models/mainScreen_vm/mainScreen_vm.dart';
import 'package:learning_anglish_app/business_logic/view_models/themes_vm/themes_vm.dart';
import 'package:learning_anglish_app/data/models/lessons/lessons.dart';
import 'package:learning_anglish_app/data/models/units/units_model.dart';
import 'package:learning_anglish_app/presentation/screens/chooseLesson/choose_lesson_screen.dart';
import 'package:learning_anglish_app/presentation/screens/main/main_screen.dart';
import 'package:learning_anglish_app/presentation/screens/questionBankPerLesson/question_bank_per_lesson_screen.dart';
import 'package:learning_anglish_app/presentation/widgets/appBar/custom_app_bar_with_menu.dart';
import 'package:learning_anglish_app/utils/app_constants/app_constants.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';
import 'package:learning_anglish_app/utils/icons/icons.dart';
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
    final homeVm = Provider.of<HomeViewModel>(context);
    return SafeArea(
      child: homeVm.unitModel==null?const Center(child: CircularProgressIndicator()):Padding(
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
              text: 'بنك الأسئلة',
            ),
            Expanded(
                child: ListView.separated(
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
                                child: QuestionBank(context, colors, index,
                                    homeVm.unitModel!.data[index])),
                          ),
                        ),
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 16.h),
                    itemCount: homeVm.unitModel!.data.length)),
          ],
        ),
      ),
    );
  }
}

class QuestionBank extends StatefulWidget {
  final List<Color> colors;
  final int index;
  final UnitDetails unitDetails;
  const QuestionBank(
      BuildContext context, this.colors, this.index, this.unitDetails,
      {super.key});

  @override
  State<QuestionBank> createState() => _QuestionBankState();
}

class _QuestionBankState extends State<QuestionBank> {
  @override
  void initState() {
    final homeVm = Provider.of<HomeViewModel>(context,listen: false);
    homeVm.getLessons(unitId: widget.unitDetails.id);
    print('*************************** ${widget.unitDetails.id} *************');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final homeVm = Provider.of<HomeViewModel>(context);
    final themeVm = Provider.of<ThemesViewModel>(context);
    return GestureDetector(
      onTap: ()
      {
        Navigator.push(context, SlideTransition1(ChooseLessonScreen(widget.unitDetails.id??0,'bank',widget.unitDetails.name!,widget.unitDetails.educationalLevelName!)));
      },
      child: Container(
        margin: EdgeInsets.only(
          left: 24.w,
          right: 24.w,
        ),
        padding: EdgeInsets.only(bottom: 24.h),
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          border: Border.all(
              color: themeVm.isDark == true ? Colors.white : Colors.transparent,
              width: .3),
          borderRadius: BorderRadius.circular(32.r),
          color: themeVm.isDark == true ? Colors.black : Colors.white,
        ),
        child: Column(
          children: [
            SizedBox(height: 30.h),
            Theme(
              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.r),
                  ),
                  child: ExpansionTile(
                    iconColor: themeVm.isDark == true ? Colors.white : Colors.black,
                    collapsedIconColor:
                    themeVm.isDark == true ? Colors.white : Colors.black,
                    //leading: I,
                    trailing: Container(
                      width: 40.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0),
                      ),
                      child: SvgPicture.asset(IconResources.book,
                          color:
                          widget.index < widget.colors.length ? widget.colors[widget.index] : Colors.black),
                    ),
                    title: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        widget.unitDetails.name??'',
                        style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontFamily: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.fontFamily,
                          fontSize: 16.sp,

                          //color: Theme.of(context).primaryColor,
                          // color: ColorResources.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    children: List.generate(homeVm.lessonsModel!.data!.length,
                            (index) {

                             return const Text(';,,,,,');
                            }
                        )
                    // <Widget>[
                    //   GestureDetector(
                    //     onTap: () {
                    //       Navigator.push(
                    //           context,
                    //           SlideTransition1(
                    //               const QuestionBankPerLessonScreen()));
                    //     },
                    //     child: Container(
                    //       margin: EdgeInsets.symmetric(
                    //           vertical: 16.h, horizontal: 24.w),
                    //       //height: MediaQuery.sizeOf(context).height * 0.1,
                    //       //width: 300.w,
                    //       //height: 56.h,
                    //       decoration: ShapeDecoration(
                    //         shape: RoundedRectangleBorder(
                    //           side: BorderSide(
                    //             width: 1,
                    //             color: themeVm.isDark == true
                    //                 ? ColorResources.expansionBorder
                    //                 : Colors.black.withOpacity(0.25),
                    //           ),
                    //           borderRadius: BorderRadius.circular(32.r),
                    //         ),
                    //       ),
                    //       child: ListTile(
                    //         contentPadding: const EdgeInsets.symmetric(
                    //             vertical: 2, horizontal: 12),
                    //         title: Align(
                    //           alignment: Alignment.centerRight,
                    //           child: Text(
                    //             'الحصة الاولى',
                    //             style: TextStyle(
                    //               fontFamily: Theme.of(context)
                    //                   .textTheme
                    //                   .titleSmall
                    //                   ?.fontFamily,
                    //             ),
                    //           ),
                    //         ),
                    //         leading: Container(
                    //             width: 23.r,
                    //             height: 23.r,
                    //             padding: EdgeInsets.only(right: 3.w),
                    //             decoration: const ShapeDecoration(
                    //               color: Color(0xFF49423A),
                    //               shape: OvalBorder(),
                    //             ),
                    //             child: SvgPicture.asset(
                    //               IconResources.arrowleft,
                    //               color: Colors.white,
                    //             )),
                    //       ),
                    //     ),
                    //   ),
                    //   GestureDetector(
                    //     onTap: () {
                    //       Navigator.push(
                    //           context,
                    //           SlideTransition1(
                    //               const QuestionBankPerLessonScreen()));
                    //     },
                    //     child: Container(
                    //       margin: EdgeInsets.symmetric(
                    //           vertical: 16.h, horizontal: 24.w),
                    //       //height: MediaQuery.sizeOf(context).height * 0.1,
                    //       //width: 300.w,
                    //       //height: 56.h,
                    //       decoration: ShapeDecoration(
                    //         shape: RoundedRectangleBorder(
                    //           side: BorderSide(
                    //             width: 1,
                    //             color: themeVm.isDark == true
                    //                 ? ColorResources.expansionBorder
                    //                 : Colors.black.withOpacity(0.25),
                    //           ),
                    //           borderRadius: BorderRadius.circular(32.r),
                    //         ),
                    //       ),
                    //       child: ListTile(
                    //         contentPadding: const EdgeInsets.symmetric(
                    //             vertical: 2, horizontal: 12),
                    //         title: Align(
                    //           alignment: Alignment.centerRight,
                    //           child: Text(
                    //             'الحصة الاولى',
                    //             style: TextStyle(
                    //               fontFamily: Theme.of(context)
                    //                   .textTheme
                    //                   .titleSmall
                    //                   ?.fontFamily,
                    //             ),
                    //           ),
                    //         ),
                    //         leading: Container(
                    //             width: 23.r,
                    //             height: 23.r,
                    //             padding: EdgeInsets.only(right: 3.w),
                    //             decoration: const ShapeDecoration(
                    //               color: Color(0xFF49423A),
                    //               shape: OvalBorder(),
                    //             ),
                    //             child: SvgPicture.asset(
                    //               IconResources.arrowleft,
                    //               color: Colors.white,
                    //             )),
                    //       ),
                    //     ),
                    //   ),
                    //   GestureDetector(
                    //     onTap: () {
                    //       Navigator.push(
                    //           context,
                    //           SlideTransition1(
                    //               const QuestionBankPerLessonScreen()));
                    //     },
                    //     child: Container(
                    //       margin: EdgeInsets.symmetric(
                    //           vertical: 16.h, horizontal: 24.w),
                    //       //height: MediaQuery.sizeOf(context).height * 0.1,
                    //       //width: 300.w,
                    //       //height: 56.h,
                    //       decoration: ShapeDecoration(
                    //         shape: RoundedRectangleBorder(
                    //           side: BorderSide(
                    //             width: 1,
                    //             color: themeVm.isDark == true
                    //                 ? ColorResources.expansionBorder
                    //                 : Colors.black.withOpacity(0.25),
                    //           ),
                    //           borderRadius: BorderRadius.circular(32.r),
                    //         ),
                    //       ),
                    //       child: ListTile(
                    //         contentPadding: const EdgeInsets.symmetric(
                    //             vertical: 2, horizontal: 12),
                    //         title: Align(
                    //           alignment: Alignment.centerRight,
                    //           child: Text(
                    //             'الحصة الاولى',
                    //             style: TextStyle(
                    //               fontFamily: Theme.of(context)
                    //                   .textTheme
                    //                   .titleSmall
                    //                   ?.fontFamily,
                    //             ),
                    //           ),
                    //         ),
                    //         leading: Container(
                    //             width: 23.r,
                    //             height: 23.r,
                    //             padding: EdgeInsets.only(right: 3.w),
                    //             decoration: const ShapeDecoration(
                    //               color: Color(0xFF49423A),
                    //               shape: OvalBorder(),
                    //             ),
                    //             child: SvgPicture.asset(
                    //               IconResources.arrowleft,
                    //               color: Colors.white,
                    //             )),
                    //       ),
                    //     ),
                    //   ),
                    // ],
                  ),

                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExpansionWidget extends StatefulWidget {
  final int index;
  final List<Color> colors;
  final UnitDetails unitDetails;

  const ExpansionWidget(this.index, this.colors, UnitDetails this.unitDetails,
      {super.key});

  @override
  State<ExpansionWidget> createState() => _ExpansionWidgetState();
}

class _ExpansionWidgetState extends State<ExpansionWidget> {
  @override
  void initState() {
    final homeVm = Provider.of<HomeViewModel>(context,listen: false);
    homeVm.getLessons(unitId:widget.unitDetails.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final homeVm = Provider.of<HomeViewModel>(context);
    final themeVm = Provider.of<ThemesViewModel>(context);
    return ExpansionTile(
      iconColor: themeVm.isDark == true ? Colors.white : Colors.black,
      collapsedIconColor: themeVm.isDark == true ? Colors.white : Colors.black,
      //leading: I,
      trailing: Container(
        width: 40.w,
        height: 30.h,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0),
        ),
        child: SvgPicture.asset(IconResources.book,
            color: widget.index < widget.colors.length ? widget.colors[widget.index] : Colors.black),
      ),
      title: Align(
        alignment: Alignment.centerRight,
        child: Text(
          widget.unitDetails.name ?? '',
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontFamily: Theme.of(context).textTheme.titleSmall?.fontFamily,
                fontSize: 16.sp,

                //color: Theme.of(context).primaryColor,
                // color: ColorResources.black,
                fontWeight: FontWeight.w400,
              ),
        ),
      ),
      controlAffinity: ListTileControlAffinity.leading,
      children: List<Widget>.generate(
        homeVm.lessonsModel!.data!.length,
        (int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context,
                  SlideTransition1(const QuestionBankPerLessonScreen()));
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
              //height: MediaQuery.sizeOf(context).height * 0.1,
              //width: 300.w,
              //height: 56.h,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: themeVm.isDark == true
                        ? ColorResources.expansionBorder
                        : Colors.black.withOpacity(0.25),
                  ),
                  borderRadius: BorderRadius.circular(32.r),
                ),
              ),
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 2, horizontal: 12),
                title: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                      homeVm.lessonsModel!.data![index].name??'',
                    style: TextStyle(
                      fontFamily:
                          Theme.of(context).textTheme.titleSmall?.fontFamily,
                    ),
                  ),
                ),
                leading: Container(
                    width: 23.r,
                    height: 23.r,
                    padding: EdgeInsets.only(right: 3.w),
                    decoration: const ShapeDecoration(
                      color: Color(0xFF49423A),
                      shape: OvalBorder(),
                    ),
                    child: SvgPicture.asset(
                      IconResources.arrowleft,
                      color: Colors.white,
                    )),
              ),
            ),
          );
        },
      ),
      /*
      <Widget>[
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
                  color: themeVm.isDark == true
                      ? ColorResources.expansionBorder
                      : Colors.black.withOpacity(0.25),
                ),
                borderRadius: BorderRadius.circular(32.r),
              ),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                  vertical: 2, horizontal: 12),
              title: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'الحصة الاولى',
                  style: TextStyle(
                    fontFamily: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.fontFamily,
                  ),
                ),
              ),
              leading: Container(
                  width: 23.r,
                  height: 23.r,
                  padding: EdgeInsets.only(right: 3.w),
                  decoration: const ShapeDecoration(
                    color: Color(0xFF49423A),
                    shape: OvalBorder(),
                  ),
                  child: SvgPicture.asset(
                    IconResources.arrowleft,
                    color: Colors.white,
                  )),
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
                  color: themeVm.isDark == true
                      ? ColorResources.expansionBorder
                      : Colors.black.withOpacity(0.25),
                ),
                borderRadius: BorderRadius.circular(32.r),
              ),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                  vertical: 2, horizontal: 12),
              title: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'الحصة الاولى',
                  style: TextStyle(
                    fontFamily: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.fontFamily,
                  ),
                ),
              ),
              leading: Container(
                  width: 23.r,
                  height: 23.r,
                  padding: EdgeInsets.only(right: 3.w),
                  decoration: const ShapeDecoration(
                    color: Color(0xFF49423A),
                    shape: OvalBorder(),
                  ),
                  child: SvgPicture.asset(
                    IconResources.arrowleft,
                    color: Colors.white,
                  )),
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
                  color: themeVm.isDark == true
                      ? ColorResources.expansionBorder
                      : Colors.black.withOpacity(0.25),
                ),
                borderRadius: BorderRadius.circular(32.r),
              ),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                  vertical: 2, horizontal: 12),
              title: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'الحصة الاولى',
                  style: TextStyle(
                    fontFamily: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.fontFamily,
                  ),
                ),
              ),
              leading: Container(
                  width: 23.r,
                  height: 23.r,
                  padding: EdgeInsets.only(right: 3.w),
                  decoration: const ShapeDecoration(
                    color: Color(0xFF49423A),
                    shape: OvalBorder(),
                  ),
                  child: SvgPicture.asset(
                    IconResources.arrowleft,
                    color: Colors.white,
                  )),
            ),
          ),
        ),
      ],

       */
    );
  }
}
