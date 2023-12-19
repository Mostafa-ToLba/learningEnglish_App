import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learning_anglish_app/business_logic/view_models/mainScreen_vm/mainScreen_vm.dart';
import 'package:learning_anglish_app/business_logic/view_models/themes_vm/themes_vm.dart';
import 'package:learning_anglish_app/business_logic/view_models/unit_vm/unit_vm.dart';
import 'package:learning_anglish_app/presentation/screens/chooseLesson/choose_lesson_screen.dart';
import 'package:learning_anglish_app/presentation/widgets/appBar/custom_app_bar_with_image_and%20_menu.dart';
import 'package:learning_anglish_app/utils/app_constants/app_constants.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';
import 'package:learning_anglish_app/utils/icons/icons.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  final String id;
  const HomeView({super.key, required this.id});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      context.read<UnitViewModel>().getUnits(widget.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 25.h),
        child: Column(
          children: [
            CustomAppBarWithImageAndMenu(
              menuIcon: true,
              onMenuPressed: () {
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
              imageURL:
                  'https://images.unsplash.com/photo-1508184964240-ee96bb9677a7?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              name: 'Mostafa Mahmoud',
            ),
            SizedBox(height: 30.h),
            Consumer<UnitViewModel>(
              builder:
                  (BuildContext context, UnitViewModel model, Widget? child) {
                return model.busy == true
                    ? const Center(
                        child: CircularProgressIndicator(),
                      ) //: Text(model.notificationModel!.data.toString());
                    : ((model.unitModel?.data != [] &&
                            model.unitModel?.data != null)
                        ? Expanded(
                            child: ListView.separated(
                                shrinkWrap: true,
                                itemBuilder: (context, index) =>
                                    AnimationConfiguration.staggeredList(
                                      position: index,
                                      delay: const Duration(milliseconds: 100),
                                      child: SlideAnimation(
                                        duration:
                                            const Duration(milliseconds: 2500),
                                        curve: Curves.fastLinearToSlowEaseIn,
                                        child: FadeInAnimation(
                                            curve:
                                                Curves.fastLinearToSlowEaseIn,
                                            duration: const Duration(
                                                milliseconds: 2500),
                                            child: HomeWidget(
                                                context, colors, index)),
                                      ),
                                    ),
                                separatorBuilder: (context, index) =>
                                    SizedBox(height: 16.h),
                                itemCount: model.unitModel!.data!.length),
                          )
                        : const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Text('No units'),
                              ),
                            ],
                          ));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HomeWidget extends StatelessWidget {
  final List<Color> colors;
  final int index;

  const HomeWidget(BuildContext context, this.colors, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    final themeVM = Provider.of<ThemesViewModel>(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(context, SlideTransition1(ChooseLessonScreen()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24.w),
        padding: EdgeInsets.all(24.dg),
        height: 170.h,
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
                Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Getting away الوحدة الأولى',
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                                fontSize: 16.sp,
                                fontFamily: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.fontFamily,
                                fontWeight: FontWeight.w400,
                              ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'عدد الدروس : 8',
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
                  width: 10.w,
                ),
                Container(
                  width: 28.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0),
                  ),
                  child: SvgPicture.asset(IconResources.book,
                      color:
                          index < colors.length ? colors[index] : Colors.black),
                ),
                // Icon(Icons.book, size: 32.dg, color: ColorResources.blue,),
              ],
            ),
            SizedBox(height: 24.h),
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
                      percent: 0.52,
                      barRadius: Radius.circular(4.r),
                      progressColor: ColorResources.brownDark,
                    ),
                    Text(
                      '52 %',
                      textAlign: TextAlign.center,
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                                fontSize: 13.sp,
                                //color: Theme.of(context).primaryColor,
                                // color: ColorResources.black,
                                fontWeight: FontWeight.w500,
                              ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
