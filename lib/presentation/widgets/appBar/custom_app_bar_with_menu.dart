import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_anglish_app/utils/app_constants/app_constants.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';
import 'package:learning_anglish_app/utils/images/images.dart';

class CustomAppBarWithMenu extends StatelessWidget {
  final VoidCallback onIconPressed;
  final String text;
  const CustomAppBarWithMenu(
      {super.key,
      required this.onIconPressed,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.w, right: 24.w),
      child: Row(
        children: [
          IconButton(
            onPressed: onIconPressed,
            icon:  Image(
              image: AssetImage(Images.menu1),
            ),
          ),
          const Spacer(),
          Text(
            //'بنك الأسئلة',
            text,
            style: TextStyle(
              color: ColorResources.black,
              fontFamily: AppConstants.arabicFont1,
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
