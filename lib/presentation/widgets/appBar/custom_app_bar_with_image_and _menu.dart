import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_anglish_app/utils/app_constants/app_constants.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';
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
          CircleAvatar(
            radius: 20.r,
            backgroundImage: NetworkImage(imageURL),
          ),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "welcome_back".i18n(),
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: AppConstants.arabicFont1,
                  color: ColorResources.appGreyColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                name,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: AppConstants.arabicFont1,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: onMenuPressed,
            icon: Icon(
              Icons.menu,
              color: ColorResources.black,
              size: 30.dg,
            ),
          ),
        ],
      ),
    );
  }
}
