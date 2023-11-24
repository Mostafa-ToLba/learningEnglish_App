import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_anglish_app/utils/app_constants/app_constants.dart';
import '../../../../utils/color_resource/color_resources.dart';
import '../../../widgets/text/custom_text.dart';
import 'circle_container.dart';
import 'onboarding_pages.dart';

class BuildOnBoarding extends StatelessWidget {
  const BuildOnBoarding({super.key, required this.boarding});

  final OnBoardingPages boarding;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            height: 300.h,
            width: 240.w,
            child: Image(
              image: AssetImage(
                boarding.image,
              ),
            )),
        Text(
          boarding.title,
          style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              color: ColorResources.black,
              fontFamily: AppConstants.arabicFont2),
        ),
        Text(
          boarding.text,
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: ColorResources.appGreyColor,
              fontFamily: AppConstants.arabicFont2),
        )
      ],
    );
  }
}
