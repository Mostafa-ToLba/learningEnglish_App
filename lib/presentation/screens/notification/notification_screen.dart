import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learning_anglish_app/business_logic/view_models/home_vm/home_vm.dart';
import 'package:learning_anglish_app/business_logic/view_models/mainScreen_vm/mainScreen_vm.dart';
import 'package:learning_anglish_app/business_logic/view_models/notification_vm/notification_vm.dart';
import 'package:learning_anglish_app/business_logic/view_models/themes_vm/themes_vm.dart';
import 'package:learning_anglish_app/business_logic/view_models/userProfile_vm/userProfile_vm.dart';
import 'package:learning_anglish_app/data/models/notification/notification_model.dart';
import 'package:learning_anglish_app/data/web_services/end_points.dart';
import 'package:learning_anglish_app/presentation/widgets/appBar/custom_app_bar_with_image_and%20_menu.dart';
import 'package:learning_anglish_app/presentation/widgets/appBar/custom_app_bar_with_menu.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';
import 'package:learning_anglish_app/utils/icons/icons.dart';
import 'package:learning_anglish_app/utils/images/images.dart';
import 'package:provider/provider.dart';
import 'package:time/time.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      context.read<NotificationViewModel>().getNotification();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeVM = Provider.of<ThemesViewModel>(context);
    final profileVm = Provider.of<UserProfileViewModel>(context);
    final homeVm = Provider.of<HomeViewModel>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Consumer<NotificationViewModel>(
          builder: (BuildContext context, model, Widget? child) {
            return model.notificationModel==null?const Center(child: CircularProgressIndicator()):Padding(
              padding: EdgeInsets.only(top: 25.h),
              child: Column(
                children: [
                  /*
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Align(
                      //   alignment: Alignment.topLeft,
                      //   child: InkWell(
                      //     onTap: () {
                      //       Navigator.pop(context);
                      //     },
                      //     child: Container(
                      //       width: 40
                      //           .r, // Set the width and height to your desired size
                      //       height: 40.r,
                      //       padding: EdgeInsets.only(right: 4.w),
                      //       decoration: BoxDecoration(
                      //         shape: BoxShape.circle,
                      //         color: themeVM.isDark == true
                      //             ? Colors.black
                      //             : Colors.white, // White background
                      //         border: Border.all(
                      //           color: Colors.grey, // Grey border color
                      //           width: 1.0, // Border width
                      //         ),
                      //       ),
                      //       child: Center(
                      //           child: SvgPicture.asset(
                      //             IconResources.arrowleft,
                      //             height: 25.h,
                      //             color: Theme.of(context).indicatorColor,
                      //           )),
                      //     ),
                      //   ),
                      // ),
                      Text(
                        'الأشعارات',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),

                   */
                  CustomAppBarWithMenu(
                    onIconPressed: () {
                      final state = Provider.of<MainScreenViewModel>(context,listen: false).sideMenuKey.currentState;
                      if (state!.isOpened) {
                        state.closeSideMenu(); // close side menu
                      } else {
                        state.openSideMenu();
                      }
                    },
                    text: 'الاشعارات',
                  ),

                  ((model.notificationModel?.data != [] &&
                  model.notificationModel?.data != null)
                  ? Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 24.w, right: 24.w),
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount:
                    model.notificationModel!.data!.length,
                    itemBuilder: (context, index) {
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        delay: const Duration(milliseconds: 100),
                        child: SlideAnimation(
                          duration:
                          const Duration(milliseconds: 2500),
                          curve: Curves.fastLinearToSlowEaseIn,
                          child: FadeInAnimation(
                            curve: Curves.fastLinearToSlowEaseIn,
                            duration:
                            const Duration(milliseconds: 2500),
                            child: NotificationWidget(
                              model.colors,
                              index,
                              model.notificationModel!.data![index],
                            ),
                            //child: Container(),
                            // child: NotificationWidget(context, colors, index),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 16.h),
                  ),
                ),
              )
                  : Center(
                child: Image.asset(Images.noNotification),
              )),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class NotificationWidget extends StatelessWidget {
  final List<Color> colors;
  final int index;
  final NotificationDetails data;

  const NotificationWidget(this.colors, this.index, this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    final themeVM = Provider.of<ThemesViewModel>(context);
    final notificatioVm = Provider.of<NotificationViewModel>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: themeVM.isDark == true
                ? ColorResources.black
                : ColorResources.white1,
          ),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20.h,bottom: 10.h),
                child: SizedBox(
                  width: 280.w,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          data.title ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                fontSize: 16.sp,
                                fontFamily: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.fontFamily,
                                fontWeight: FontWeight.w400,
                              ),
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          data.body ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
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
                      ),
                      SizedBox(height: 10.h),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          notificatioVm.formatTimestampForArabic(time: data.createdOn??''),
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
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
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 15.w),
              Container(
                color: index < colors.length ? colors[index] : Colors.black,
                height: 50.h,
                width: 2.w,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
