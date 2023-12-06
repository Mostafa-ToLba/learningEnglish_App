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
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              SizedBox(height: 12.h),
              Text(
                name,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      height: 0.07.h,
                    ),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: onMenuPressed,
            icon: Icon(
              Icons.menu,
              color: Theme.of(context).iconTheme.color,
              size: 30.dg,
            ),
          ),
        ],
      ),
    );
  }
}
