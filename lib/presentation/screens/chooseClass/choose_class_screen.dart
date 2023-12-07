import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:learning_anglish_app/blocs/settings_bloc/settings_bloc.dart';
import 'package:learning_anglish_app/presentation/screens/main/main_screen.dart';
import 'package:learning_anglish_app/presentation/widgets/appBar/custom_app_bar_with_image_and%20_menu.dart';
import 'package:learning_anglish_app/presentation/widgets/button/custom_button.dart';
import 'package:learning_anglish_app/presentation/widgets/drawer/app_drawer.dart';
import 'package:learning_anglish_app/presentation/widgets/text/custom_text.dart';
import 'package:learning_anglish_app/utils/app_constants/app_constants.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';
import 'package:localization/localization.dart';

class ChooseClassScreen extends StatefulWidget {
  const ChooseClassScreen({super.key});

  @override
  State<ChooseClassScreen> createState() => _ChooseClassScreenState();
}

class _ChooseClassScreenState extends State<ChooseClassScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
          seconds: 2), // Animation duration (2 seconds in this example)
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0), // Start position (bottom of the screen)
      end: const Offset(0.0, 0.0), // End position (original position)
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn, // Adjust the curve as needed
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  int selectedIndex = 0;
  List<String> classList = [
    "first_class".i18n(),
    "second_class".i18n(),
    "third_class".i18n(),
  ];
  @override
  Widget build(BuildContext context) {
    final mode = context.watch<SettingsBloc>().state.mode;
    /*
    final appTheme =
        mode ? appThemeData[AppTheme.dark] : appThemeData[AppTheme.light];
    */
    return Scaffold(
      key: _key,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      drawer: AppDrawer(
        mode: mode,
        onExitPressed: () => _key.currentState!.closeDrawer(),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(top: 25.h),
        child: Column(
          children: [
            CustomAppBarWithImageAndMenu(
              onMenuPressed: () {
                _key.currentState!.openDrawer();
              },
              imageURL:
                  'https://images.unsplash.com/photo-1508184964240-ee96bb9677a7?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              name: 'Mostafa Mahmoud',
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(56.r),
                  topRight: Radius.circular(56.r),
                ),
              ),
              height: 656.h,
              width: 1.sw,
              padding: EdgeInsets.only(top: 34.h, right: 24.w, left: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "choose_class".i18n(),
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 16.sp, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 40.h),
                  SizedBox(
                    height: 220.h,
                    child: ListView.separated(
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: AnimationConfiguration.staggeredList(
                          position: index,
                          delay: const Duration(milliseconds: 100),
                          child: SlideAnimation(
                            duration: const Duration(milliseconds: 2500),
                            curve: Curves.fastLinearToSlowEaseIn,
                            child: FadeInAnimation(
                              curve: Curves.fastLinearToSlowEaseIn,
                              duration: const Duration(milliseconds: 2500),
                              child: classContainer(
                                classList[index],
                                context,
                                isChosen: selectedIndex == index,
                              ),
                            ),
                          ),
                        ),
                      ),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 16.h),
                      itemCount: 3,
                    ),
                  ),
                  SizedBox(height: 25.h),
                  SlideTransition(
                    position: _offsetAnimation,
                    child: CustomButton(
                      widgetInCenter: Align(
                        alignment: Alignment.center,
                        child: CustomText(
                          text: "choose".i18n(),
                          textAlign: TextAlign.center,
                          color: ColorResources.white1,
                          txtSize: 17.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      color: ColorResources.buttonColor,
                      onTap: () {
                        context
                            .read<SettingsBloc>()
                            .add(const SettingsEvent.choosingClassDone());
                        Route route = MaterialPageRoute(
                            builder: (context) => const MainScreen());
                        Navigator.pushReplacement(context, route);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}

Widget classContainer(String classList, BuildContext context,
        {bool isChosen = false}) =>
    Container(
      height: 56.h,
      width: 1.sw,
      padding: EdgeInsets.only(right: 24.w, left: 24.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          border: Border.all(
            color: isChosen ? Colors.green : Theme.of(context).indicatorColor,
            width: isChosen ? 2.w : .3.w,
          )),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            classList,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
          ),
          const Spacer(),
          Container(
            height: 24.h,
            width: 24.w,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: isChosen
                        ? Colors.green
                        : Theme.of(context).indicatorColor,
                    width: 1.w)),
            child: Icon(Icons.check,
                size: 15.h,
                color:
                    isChosen ? Colors.green : Theme.of(context).indicatorColor),
          )
        ],
      ),
    );
