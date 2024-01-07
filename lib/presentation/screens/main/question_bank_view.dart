import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_anglish_app/business_logic/view_models/home_vm/home_vm.dart';
import 'package:learning_anglish_app/business_logic/view_models/mainScreen_vm/mainScreen_vm.dart';
import 'package:learning_anglish_app/business_logic/view_models/themes_vm/themes_vm.dart';
import 'package:learning_anglish_app/data/cache_helper/cache_helper.dart';
import 'package:learning_anglish_app/data/models/units/units_model.dart';
import 'package:learning_anglish_app/presentation/screens/chooseLesson/choose_lesson_screen.dart';
import 'package:learning_anglish_app/presentation/screens/questionBankPerLesson/question_bank_per_lesson_screen.dart';
import 'package:learning_anglish_app/presentation/widgets/appBar/custom_app_bar_with_menu.dart';
import 'package:learning_anglish_app/presentation/widgets/text/custom_text.dart';
import 'package:learning_anglish_app/utils/app_constants/app_constants.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';
import 'package:learning_anglish_app/utils/icons/icons.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class QuestionBankView extends StatefulWidget {
  const QuestionBankView({super.key});

  @override
  State<QuestionBankView> createState() => _QuestionBankViewState();
}

class _QuestionBankViewState extends State<QuestionBankView> {
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
                child: Padding(
                  padding: EdgeInsets.only(top: 15.h,bottom: 10.h),
                  child: homeVm.unitModel!.data.isEmpty? RefreshIndicator(
                    onRefresh: () async{
                      await Future.delayed(const Duration(seconds: 1));
                      setState(() {
                        homeVm.getUnits(levelId: CacheHelper.getData(key: PrefKeys.educationLevel));
                      });
                    },
                    child: SizedBox(
                      height: 700.h,
                      child: ListView.builder(
                        shrinkWrap: false,
                        itemBuilder: (context,index)=>const NoNotification(),itemCount: 1,),
                    ),
                  ):RefreshIndicator(
                    color: Provider.of<ThemesViewModel>(context).isDark! ?Colors.white:Colors.black,
                    onRefresh: () async{
                      await Future.delayed(const Duration(seconds: 2));
                      setState(() {
                        homeVm.getUnits(levelId: CacheHelper.getData(key: PrefKeys.educationLevel));
                      });
                    },
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
                                    child: QuestionBank(context, homeVm.colors, index,
                                        homeVm.unitModel!.data[index])),
                              ),
                            ),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 16.h),
                        itemCount: homeVm.unitModel!.data.length),
                  ),
                )),
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
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if(context.read<HomeViewModel>().lessonsModel==null)
      {
        context.read<HomeViewModel>().getLessons(unitId: widget.unitDetails.id);
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
//    final homeVm = Provider.of<HomeViewModel>(context);
    final themeVM = Provider.of<ThemesViewModel>(context);
    return GestureDetector(
      onTap: ()
      {
        Navigator.push(context, SlideTransition1(ChooseLessonScreen(widget.unitDetails.id??0,'bank',widget.unitDetails.name!,widget.unitDetails.educationalLevelName!)));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24.w),
        padding: EdgeInsets.only(left: 24.dg,top: 24.dg,),
        height: 118.h,
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
                SizedBox(
                  height: 40.h,
                  width: 40.w,
                  child: Image(color:themeVM.isDark==true?Colors.white:Colors.black,image: const AssetImage('assets/images/exam.png',)),
                ),
                const Spacer(),
                Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      widget.unitDetails.name??'',
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
                    SizedBox(height: 4.h),
                    Text(
                      widget.unitDetails.educationalLevelName??'',
                      style:
                      Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 14.sp,
                        fontFamily: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.fontFamily,
                        // TODO: Edit this
                        color: themeVM.isDark == true
                            ? Colors.grey
                            : Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20.w,
                ),
                Container(
                  color: widget.index < widget.colors.length ? widget.colors[widget.index] : Colors.black,
                  height: 60.h,
                  width: 2.w,
                ),
                /*
                Container(
                  width: 28.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0),
                  ),
                  child: SvgPicture.asset(IconResources.book,
                      color:
                      widget.index < widget.colors.length ? widget.colors[widget.index] : Colors.black),
                ),

                 */
                // Icon(Icons.book, size: 32.dg, color: ColorResources.blue,),
              ],
            ),
            SizedBox(height: 24.h),
            /*
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
                      lineHeight: 6.0,
                      backgroundColor: ColorResources.grey1,
                      percent: 1.toDouble(),
                      barRadius: Radius.circular(4.r),
                      progressColor: ColorResources.grey1,
                    ),

                  ],
                ),
              ],
            ),

             */
          ],
        ),
      ),
      // Container(
      //   margin: EdgeInsets.only(
      //     left: 24.w,
      //     right: 24.w,
      //   ),
      //   padding: EdgeInsets.only(bottom: 24.h),
      //   width: MediaQuery.sizeOf(context).width,
      //   decoration: BoxDecoration(
      //     border: Border.all(
      //         color: themeVm.isDark == true ? Colors.white : Colors.transparent,
      //         width: .3),
      //     borderRadius: BorderRadius.circular(32.r),
      //     color: themeVm.isDark == true ? Colors.black : Colors.white,
      //   ),
      //   child: Column(
      //     children: [
      //       SizedBox(height: 30.h),
      //       Theme(
      //         data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      //         child: Container(
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(32.r),
      //             ),
      //             child: ExpansionTile(
      //               iconColor: themeVm.isDark == true ? Colors.white : Colors.black,
      //               collapsedIconColor:
      //               themeVm.isDark == true ? Colors.white : Colors.black,
      //               //leading: I,
      //               trailing: Container(
      //                 width: 40.w,
      //                 height: 30.h,
      //                 decoration: BoxDecoration(
      //                   color: Colors.black.withOpacity(0),
      //                 ),
      //                 child: SvgPicture.asset(IconResources.book,
      //                     color:
      //                     widget.index < widget.colors.length ? widget.colors[widget.index] : Colors.black),
      //               ),
      //               title: Align(
      //                 alignment: Alignment.centerRight,
      //                 child: Text(
      //                   widget.unitDetails.name??'',
      //                   style: Theme.of(context).textTheme.displayMedium?.copyWith(
      //                     fontFamily: Theme.of(context)
      //                         .textTheme
      //                         .titleSmall
      //                         ?.fontFamily,
      //                     fontSize: 16.sp,
      //
      //                     //color: Theme.of(context).primaryColor,
      //                     // color: ColorResources.black,
      //                     fontWeight: FontWeight.w400,
      //                   ),
      //                 ),
      //               ),
      //               controlAffinity: ListTileControlAffinity.leading,
      //               children: List.generate(homeVm.lessonsModel!.data!.length,
      //                       (index) {
      //
      //                        return const Text('');
      //                       }
      //                   )
      //               // <Widget>[
      //               //   GestureDetector(
      //               //     onTap: () {
      //               //       Navigator.push(
      //               //           context,
      //               //           SlideTransition1(
      //               //               const QuestionBankPerLessonScreen()));
      //               //     },
      //               //     child: Container(
      //               //       margin: EdgeInsets.symmetric(
      //               //           vertical: 16.h, horizontal: 24.w),
      //               //       //height: MediaQuery.sizeOf(context).height * 0.1,
      //               //       //width: 300.w,
      //               //       //height: 56.h,
      //               //       decoration: ShapeDecoration(
      //               //         shape: RoundedRectangleBorder(
      //               //           side: BorderSide(
      //               //             width: 1,
      //               //             color: themeVm.isDark == true
      //               //                 ? ColorResources.expansionBorder
      //               //                 : Colors.black.withOpacity(0.25),
      //               //           ),
      //               //           borderRadius: BorderRadius.circular(32.r),
      //               //         ),
      //               //       ),
      //               //       child: ListTile(
      //               //         contentPadding: const EdgeInsets.symmetric(
      //               //             vertical: 2, horizontal: 12),
      //               //         title: Align(
      //               //           alignment: Alignment.centerRight,
      //               //           child: Text(
      //               //             'الحصة الاولى',
      //               //             style: TextStyle(
      //               //               fontFamily: Theme.of(context)
      //               //                   .textTheme
      //               //                   .titleSmall
      //               //                   ?.fontFamily,
      //               //             ),
      //               //           ),
      //               //         ),
      //               //         leading: Container(
      //               //             width: 23.r,
      //               //             height: 23.r,
      //               //             padding: EdgeInsets.only(right: 3.w),
      //               //             decoration: const ShapeDecoration(
      //               //               color: Color(0xFF49423A),
      //               //               shape: OvalBorder(),
      //               //             ),
      //               //             child: SvgPicture.asset(
      //               //               IconResources.arrowleft,
      //               //               color: Colors.white,
      //               //             )),
      //               //       ),
      //               //     ),
      //               //   ),
      //               //   GestureDetector(
      //               //     onTap: () {
      //               //       Navigator.push(
      //               //           context,
      //               //           SlideTransition1(
      //               //               const QuestionBankPerLessonScreen()));
      //               //     },
      //               //     child: Container(
      //               //       margin: EdgeInsets.symmetric(
      //               //           vertical: 16.h, horizontal: 24.w),
      //               //       //height: MediaQuery.sizeOf(context).height * 0.1,
      //               //       //width: 300.w,
      //               //       //height: 56.h,
      //               //       decoration: ShapeDecoration(
      //               //         shape: RoundedRectangleBorder(
      //               //           side: BorderSide(
      //               //             width: 1,
      //               //             color: themeVm.isDark == true
      //               //                 ? ColorResources.expansionBorder
      //               //                 : Colors.black.withOpacity(0.25),
      //               //           ),
      //               //           borderRadius: BorderRadius.circular(32.r),
      //               //         ),
      //               //       ),
      //               //       child: ListTile(
      //               //         contentPadding: const EdgeInsets.symmetric(
      //               //             vertical: 2, horizontal: 12),
      //               //         title: Align(
      //               //           alignment: Alignment.centerRight,
      //               //           child: Text(
      //               //             'الحصة الاولى',
      //               //             style: TextStyle(
      //               //               fontFamily: Theme.of(context)
      //               //                   .textTheme
      //               //                   .titleSmall
      //               //                   ?.fontFamily,
      //               //             ),
      //               //           ),
      //               //         ),
      //               //         leading: Container(
      //               //             width: 23.r,
      //               //             height: 23.r,
      //               //             padding: EdgeInsets.only(right: 3.w),
      //               //             decoration: const ShapeDecoration(
      //               //               color: Color(0xFF49423A),
      //               //               shape: OvalBorder(),
      //               //             ),
      //               //             child: SvgPicture.asset(
      //               //               IconResources.arrowleft,
      //               //               color: Colors.white,
      //               //             )),
      //               //       ),
      //               //     ),
      //               //   ),
      //               //   GestureDetector(
      //               //     onTap: () {
      //               //       Navigator.push(
      //               //           context,
      //               //           SlideTransition1(
      //               //               const QuestionBankPerLessonScreen()));
      //               //     },
      //               //     child: Container(
      //               //       margin: EdgeInsets.symmetric(
      //               //           vertical: 16.h, horizontal: 24.w),
      //               //       //height: MediaQuery.sizeOf(context).height * 0.1,
      //               //       //width: 300.w,
      //               //       //height: 56.h,
      //               //       decoration: ShapeDecoration(
      //               //         shape: RoundedRectangleBorder(
      //               //           side: BorderSide(
      //               //             width: 1,
      //               //             color: themeVm.isDark == true
      //               //                 ? ColorResources.expansionBorder
      //               //                 : Colors.black.withOpacity(0.25),
      //               //           ),
      //               //           borderRadius: BorderRadius.circular(32.r),
      //               //         ),
      //               //       ),
      //               //       child: ListTile(
      //               //         contentPadding: const EdgeInsets.symmetric(
      //               //             vertical: 2, horizontal: 12),
      //               //         title: Align(
      //               //           alignment: Alignment.centerRight,
      //               //           child: Text(
      //               //             'الحصة الاولى',
      //               //             style: TextStyle(
      //               //               fontFamily: Theme.of(context)
      //               //                   .textTheme
      //               //                   .titleSmall
      //               //                   ?.fontFamily,
      //               //             ),
      //               //           ),
      //               //         ),
      //               //         leading: Container(
      //               //             width: 23.r,
      //               //             height: 23.r,
      //               //             padding: EdgeInsets.only(right: 3.w),
      //               //             decoration: const ShapeDecoration(
      //               //               color: Color(0xFF49423A),
      //               //               shape: OvalBorder(),
      //               //             ),
      //               //             child: SvgPicture.asset(
      //               //               IconResources.arrowleft,
      //               //               color: Colors.white,
      //               //             )),
      //               //       ),
      //               //     ),
      //               //   ),
      //               // ],
      //             ),
      //
      //             ),
      //       ),
      //     ],
      //   ),
      // ),
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


class NoNotification extends StatelessWidget {
  const NoNotification({super.key});

  @override
  Widget build(BuildContext context) {
    final themeVm = Provider.of<ThemesViewModel>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
      [
        SizedBox(height: 70.h),
        Container(
          width: 1.sw,
          color: Colors.transparent,
          child: Lottie.asset('assets/lottieAnimations/bank2.json',fit: BoxFit.cover,),
        ),
        CustomText(text: '! لا يوجد اي أسئلة حتي الان',txtSize: 18.sp,color:themeVm.isDark==true?Colors.white:ColorResources.buttonColor,),
      ],
    );
  }
}
