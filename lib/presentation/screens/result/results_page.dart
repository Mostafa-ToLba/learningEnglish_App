import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_anglish_app/presentation/widgets/button/custom_button.dart';
import 'package:learning_anglish_app/presentation/widgets/text/custom_text.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';
import 'package:localization/localization.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ResultsScreen extends StatefulWidget {
  const ResultsScreen({super.key});

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

//ResultsScreen
class _ResultsScreenState extends State<ResultsScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
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

  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.white1,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 25.h, left: 24.w, right: 24.w),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40.w,
                height: 40.h,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: Colors.black.withOpacity(0.25),
                    ),
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: ColorResources.brownDark,
                    size: 20.dm,
                  ), //circle_chevron_left
                ),
              ),
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 150.w,
                      height: 150.h,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/trophy.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(height: 36.h),
                    CircularPercentIndicator(
                      radius: 80.r,
                      lineWidth: 10.0,
                      animation: true,
                      percent: 0.7,
                      center: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "70.0%",
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  fontSize: 32.sp,

                                  //color: Theme.of(context).primaryColor,
                                  // color: ColorResources.black,
                                  fontWeight: FontWeight.w900,
                                ),
                          ),
                          Text(
                            '10 of 10',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  fontSize: 16.sp,

                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.5),
                                  // color: ColorResources.black,
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                        ],
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: ColorResources.brownDark,
                    ),
                    SizedBox(height: 85.h),
                    Text(
                      'results_perfect_title'.i18n(),
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                                fontSize: 22.sp,

                                //color: Theme.of(context).primaryColor.withOpacity(0.5),
                                // color: ColorResources.black,
                                fontWeight: FontWeight.w400,
                              ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'results_perfect_subtitle'.i18n(),
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(
                            fontSize: 16.sp,

                            color:
                                Theme.of(context).primaryColor.withOpacity(0.5),
                            // color: ColorResources.black,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                    SizedBox(height: 40.h),
                    SlideTransition(
                      position: _offsetAnimation,
                      child: CustomButton(
                        widgetInCenter: Align(
                          alignment: Alignment.center,
                          child: CustomText(
                            text: "next_lesson".i18n(),
                            textAlign: TextAlign.center,
                            color: Colors.white,
                            txtSize: 17.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        color: ColorResources.buttonColor,
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    SizedBox(height: 4.h),
                    TextButton(
                      child: Text(
                        "try_again".i18n(),
                        textAlign: TextAlign.justify,
                        style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(
                            fontSize: 16.sp,

                            color:
                                Theme.of(context).primaryColor.withOpacity(0.5),
                            // color: ColorResources.black,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
