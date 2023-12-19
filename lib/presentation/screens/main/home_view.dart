import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learning_anglish_app/business_logic/view_models/mainScreen_vm/mainScreen_vm.dart';
import 'package:learning_anglish_app/business_logic/view_models/themes_vm/themes_vm.dart';
import 'package:learning_anglish_app/business_logic/view_models/userProfile_vm/userProfile_vm.dart';
import 'package:learning_anglish_app/data/web_services/end_points.dart';
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
      context.read<UserProfileViewModel>().getUserProfile();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final profileVm = Provider.of<UserProfileViewModel>(context);
    return SafeArea(
      child: profileVm.userProfile!=null?Padding(
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
              imageURL:EndPoints.imagesUrl+profileVm.userProfile!.data!.userImgUrl!,
              name: profileVm.userProfile?.data?.fullName,
            ),
            SizedBox(height: 30.h),
            Expanded(
              child: ListView.separated(
                  shrinkWrap: true,
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
                              child: HomeWidget(context, colors, index)),
                        ),
                      ),
                  separatorBuilder: (context, index) => SizedBox(height: 16.h),
                  itemCount: 10),
            ),
          ],
        ),
      ):const Center(child: CircularProgressIndicator()),
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