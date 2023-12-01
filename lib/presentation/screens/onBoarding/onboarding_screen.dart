import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_anglish_app/blocs/settings_bloc/settings_bloc.dart';
import 'package:learning_anglish_app/presentation/screens/onBoarding/widgtes/build_onboarding.dart';
import 'package:learning_anglish_app/presentation/screens/onBoarding/widgtes/onboarding_pages.dart';
import 'package:learning_anglish_app/presentation/screens/registration/login_screen/login_screen.dart';
import 'package:learning_anglish_app/utils/app_constants/app_constants.dart';
import 'package:learning_anglish_app/utils/icons/icons.dart';
import 'package:localization/localization.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../utils/color_resource/color_resources.dart';
import '../../../utils/images/images.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  static var controller = PageController();

  static bool isLast = false;

  static List<OnBoardingPages> boarding = [
    OnBoardingPages(
      image: Images.onBoarding1,
      title: "welcome".i18n(),
      text: "onboarding_subtitle1".i18n(),
    ),
    OnBoardingPages(
      image: Images.onBoarding2,
      title: "onboarding_title2".i18n(),
      text: "onboarding_subtitle2".i18n(),
    ),
    OnBoardingPages(
      image: Images.onBoarding3,
      title: "onboarding_title3".i18n(),
      text: "onboarding_subtitle3".i18n(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorResources.grey5,
        body: Column(
          children: [
            Expanded(
              child: Container(
                height: 375.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(65.r),
                    bottomLeft: Radius.circular(65.r),
                  ),
                ),
                child: PageView.builder(
                  //reverse: true,
                  controller: controller,
                  itemBuilder: (context, index) =>
                      BuildOnBoarding(boarding: boarding[index]),
                  itemCount: boarding.length,
                  onPageChanged: (index) {
                    if (index == boarding.length - 1) {
                      isLast = true;
                    } else {
                      isLast = false;
                    }
                  },
                ),
              ),
            ),
            SizedBox(
              height: 200.h,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: Column(
                  children: [
                    SmoothPageIndicator(
                      controller: controller,
                      count: boarding.length,
                      effect: ExpandingDotsEffect(
                        activeDotColor: ColorResources.black,
                        dotColor: ColorResources.grey4,
                        dotHeight: 6.h,
                        dotWidth: 7.w,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    InkWell(
                      onTap: () {
                        if (isLast) {
                          context.read<SettingsBloc>().add(
                              const SettingsEvent.boardingScreensWatched());

                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ));
                        } else {
                          controller.nextPage(
                              duration: const Duration(milliseconds: 1000),
                              curve: Curves.easeInOutCubicEmphasized);
                        }
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 32.r,
                        child: SvgPicture.asset(
                          IconResources.arrowRight,
                          height: 20.h,
                          width: 10.w,
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    InkWell(
                      onTap: () {
                        //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen(),));
                        
                        context.read<SettingsBloc>().add(
                              const SettingsEvent.boardingScreensWatched());
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "skip".i18n(),
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: AppConstants.arabicFont2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
