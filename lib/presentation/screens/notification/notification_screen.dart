import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learning_anglish_app/business_logic/view_models/notification_vm/notification_vm.dart';
import 'package:learning_anglish_app/business_logic/view_models/themes_vm/themes_vm.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';
import 'package:learning_anglish_app/utils/icons/icons.dart';
import 'package:learning_anglish_app/utils/images/images.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final List<Color> colors = const [
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
      context.read<NotificationViewModel>().getNotification();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final notificationVM = Provider.of<NotificationViewModel>(context);
    final themeVM = Provider.of<ThemesViewModel>(context);
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
                        height: 40.r,
                        padding: EdgeInsets.only(right: 4.w),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: themeVM.isDark == true
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
                          height: 25.h,
                          color: Theme.of(context).indicatorColor,
                        )),
                      ),
                    ),
                  ),
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
              SizedBox(height: 30.h),
              Consumer<NotificationViewModel>(
                builder: (BuildContext context, NotificationViewModel model,
                    Widget? child) {
                  return notificationVM.busy == true
                      ? const Center(
                          child: CircularProgressIndicator(),
                        ) //: Text(model.notificationModel!.data.toString());
                      : ((model.notificationModel?.data != [] &&
                              model.notificationModel?.data != null)
                          ? Expanded(
                              child: ListView.separated(
                                shrinkWrap: true,
                                itemCount:
                                    model.notificationModel!.data!.length,
                                itemBuilder: (context, index) {
                                  print(index);
                                  return  AnimationConfiguration.staggeredList(
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
                                      child: NotificationWidget(colors, index),
                                      //child: Container(),
                                      // child: NotificationWidget(context, colors, index),
                                    ),
                                  ),
                                );},
                                separatorBuilder: (context, index) =>
                                    SizedBox(height: 16.h),
                              ),
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(
                                  child: Image.asset(Images.noNotification),
                                ),
                              ],
                            ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationWidget extends StatelessWidget {
  final List<Color> colors;
  final int index;

  const NotificationWidget(this.colors, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    final notificationVM = Provider.of<NotificationViewModel>(context);
    final themeVM = Provider.of<ThemesViewModel>(context);
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(
                color: index < colors.length ? colors[index] : Colors.black,
                width: 15.0,
              ),
              /*
              color: themeVM.isDark == true ? Colors.white : Colors.transparent,
              width: .3,
        */
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(32.r),
            ),
            color: themeVM.isDark == true
                ? ColorResources.black
                : ColorResources.white1,
          ),
          //margin: EdgeInsets.only(left: 24.w),
          padding: EdgeInsets.only(left: 24.w),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 24.h),
                child: SizedBox(
                  width: 280.w,
                  child: Column(
                    //padding: EdgeInsets.all(10.dm),

                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          notificationVM.notificationModel!.data![index].title!,
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
                      ),
                      SizedBox(height: 4.h),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                        notificationVM.notificationModel!.data![index].body!,
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
                                ),  ),
                      ),
                    ],
                  ),
                ),
              ),

              //SizedBox(width: 20.w),
            ],
          ),
        ),
        /*
        Positioned(
          right: 0,
          height: double.infinity,
          child: Container(
            padding: EdgeInsets.only(left: 24.w),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(32.r),
                bottomRight: Radius.circular(32.r),
              ),
              color: index < colors.length ? colors[index] : Colors.black,
            ),
          ),
        ),
      */
      ],
    );
  }
}
