import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learning_anglish_app/presentation/widgets/button/custom_button.dart';
import '../../../utils/app_constants/app_constants.dart';
import '../../../utils/color_resource/color_resources.dart';
import '../../../utils/images/images.dart';
import '../../widgets/text/custom_text.dart';
import '../onBoarding/onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(25.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              CustomText(
                text: 'إجعل تعليمك ',
                txtSize: 30.sp,
                color: ColorResources.primary,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //     const Image(image: AssetImage(Images.coding),),
                  SizedBox(
                    width: 10.w,
                  ),
                  CustomText(
                    text: 'أسهل',
                    txtSize: 30.sp,
                    color: ColorResources.black,
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.only(right: 20.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'كل الوسائل ستكون متاحة لك ',
                      txtSize: 16.sp,
                      color: ColorResources.primary,
                    ),
                    CustomText(
                      text: 'عبر الإنترنت',
                      txtSize: 16.sp,
                      color: ColorResources.primary,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Image(
                  image: const AssetImage(Images.onBoarding3),
                  fit: BoxFit.cover),
              Spacer(),
              CustomButton(
                onTap: () {
                  Navigator.push(
                      context, SlideTransition1(const OnBoardingScreen()));
                },
                text: 'البدء',
                color: ColorResources.black,
                colorTxt: ColorResources.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
