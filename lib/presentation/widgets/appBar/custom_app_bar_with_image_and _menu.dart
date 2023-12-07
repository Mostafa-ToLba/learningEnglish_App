import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_anglish_app/utils/app_constants/app_constants.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';
import 'package:learning_anglish_app/utils/images/images.dart';
import 'package:localization/localization.dart';

class CustomAppBarWithImageAndMenu extends StatelessWidget {
  final VoidCallback onMenuPressed;
  final String imageURL;
  final String name;
  const CustomAppBarWithImageAndMenu(
      {super.key,
      required this.onMenuPressed,
      required this.imageURL,
      required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.w, right: 24.w),
      child: Row(
        children: [
          IconButton(
            onPressed: onMenuPressed,
            icon: const Image(image: AssetImage(Images.menu1),)
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'أهلا بك',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: AppConstants.arabicFont1,
                  color: ColorResources.appGreyColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: ColorResources.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  height: 0.07.h,
                ),
              ),
            ],
          ),
          SizedBox(width: 12.w),
          CircleAvatar(
            radius: 20.r,
            backgroundImage: NetworkImage(imageURL),
          ),

        ],
      ),
    );
  }
}
