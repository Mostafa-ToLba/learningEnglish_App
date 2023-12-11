import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'onboarding_pages.dart';

class BuildOnBoarding extends StatelessWidget {
  const BuildOnBoarding({super.key, required this.boarding});

  final OnBoardingPages boarding;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
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
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
           // color: Colors.white,

                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
              ),
        ),
        SizedBox(height: 8.h),
        Text(
          boarding.text,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontFamily: "Inter",
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                /*
                color: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .color
                    ?.withOpacity(0.6499999761581421),
                    */
   
              ),
        )
      ],
    );
  }
}
