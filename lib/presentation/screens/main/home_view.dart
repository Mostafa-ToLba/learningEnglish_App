import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learning_anglish_app/business_logic/view_models/home_vm/home_vm.dart';
import 'package:learning_anglish_app/business_logic/view_models/mainScreen_vm/mainScreen_vm.dart';
import 'package:learning_anglish_app/business_logic/view_models/themes_vm/themes_vm.dart';
import 'package:learning_anglish_app/business_logic/view_models/userProfile_vm/userProfile_vm.dart';
import 'package:learning_anglish_app/data/cache_helper/cache_helper.dart';
import 'package:learning_anglish_app/data/models/units/units_model.dart';
import 'package:learning_anglish_app/data/web_services/end_points.dart';
import 'package:learning_anglish_app/presentation/screens/chooseLesson/choose_lesson_screen.dart';
import 'package:learning_anglish_app/presentation/widgets/appBar/custom_app_bar_with_image_and%20_menu.dart';
import 'package:learning_anglish_app/presentation/widgets/text/custom_text.dart';
import 'package:learning_anglish_app/utils/app_constants/app_constants.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';
import 'package:learning_anglish_app/utils/icons/icons.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  final String id;
  const HomeView({super.key, required this.id});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if(context.read<HomeViewModel>().unitModel==null)
      {
        context.read<HomeViewModel>().getUnits(levelId: CacheHelper.getData(key: PrefKeys.educationLevel));
      }
      if(context.read<UserProfileViewModel>().userProfile==null)
      {
        context.read<UserProfileViewModel>().getUserProfile();
      }
      if(CacheHelper.getData(key: PrefKeys.isDeviceTokenAdded)!=true) {
        context.read<HomeViewModel>().addDeviceToken();
        await FirebaseMessaging.instance
            .setForegroundNotificationPresentationOptions(
          alert: true,
          badge: true,
          sound: true,
        );
        await FirebaseMessaging.instance.requestPermission(
          alert: true,
          announcement: false,
          badge: true,
          carPlay: false,
          criticalAlert: false,
          provisional: false,
          sound: true,
        );
        CacheHelper.putBoolean(key: PrefKeys.isDeviceTokenAdded, value: true);
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final profileVm = Provider.of<UserProfileViewModel>(context);
    final homeVm = Provider.of<HomeViewModel>(context);
    return SafeArea(
      child: profileVm.userProfile!=null && homeVm.unitModel!=null?
      Padding(
        padding: EdgeInsets.only(top: 25.h),
        child: Column(
          children: [
            CustomAppBarWithImageAndMenu(
              menuIcon: true,
              onMenuPressed: () {
              //  homeVm.testFirestore();

       //         mainScreenVm.scaffoldkey.currentState!.openDrawer();
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
              imageURL:profileVm.userProfile!.data!.userImgUrl==null?
                  'https://imgs.search.brave.com/MgKy-1ezKe9DbGOWhODKxIufmmTMUeBT6iWORiLEpKM/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMuYWxsLWZyZWUt/ZG93bmxvYWQuY29t/L2ltYWdlcy9ncmFw/aGljbGFyZ2UvY2F0/X3Byb2ZpbGVfMTk2/ODA2LmpwZw':EndPoints.imagesUrl+profileVm.userProfile!.data!.userImgUrl!,
              name: profileVm.userProfile?.data?.fullName,
            ),
            SizedBox(height: 30.h),
            Expanded(
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
                    shrinkWrap: false,
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
                                child: HomeWidget(context, homeVm.colors, index,homeVm.unitModel!.data)),
                          ),
                        ),
                    separatorBuilder: (context, index) => SizedBox(height: 16.h),
                    itemCount: homeVm.unitModel!.data.length),
              ),
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
  final List<UnitDetails> data;

  const HomeWidget(BuildContext context, this.colors, this.index, this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    final themeVM = Provider.of<ThemesViewModel>(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(context, SlideTransition1(ChooseLessonScreen(data[index].id!,'home',data[index].name!,data[index].educationalLevelName!)));
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
                      data[index].name??'',
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
                      data[index].educationalLevelName??'',
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
                      percent: 1.toDouble(),
                      barRadius: Radius.circular(4.r),
                      progressColor: ColorResources.grey1,
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

class NoNotification extends StatelessWidget {
  const NoNotification({super.key});

  @override
  Widget build(BuildContext context) {
    final themeVm = Provider.of<ThemesViewModel>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
      [
        SizedBox(height: 50.h),
        Container(
          width: 1.sw,
          color: Colors.transparent,
          child: Lottie.asset('assets/lottieAnimations/bank.json',fit: BoxFit.cover,),
        ),
        CustomText(text: '! لا يوجد اي محاضرات حتي الان',txtSize: 18.sp,color:themeVm.isDark==true?Colors.white:ColorResources.buttonColor,),
      ],
    );
  }
}