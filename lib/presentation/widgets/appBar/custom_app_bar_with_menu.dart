import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';

class CustomAppBarWithMenu extends StatelessWidget {
  final VoidCallback onIconPressed;
  final IconData icon;
  final String text;
  const CustomAppBarWithMenu(
      {super.key,
      required this.onIconPressed,
      required this.icon,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.w, right: 24.w),
      child: Row(
        children: [
          IconButton(
            onPressed: onIconPressed,
            icon: Icon(
              //Icons.menu,
              icon,
              color: ColorResources.black,
              size: 30.h,
            ),
          ),
          const Spacer(),
          Text(
            //'بنك الأسئلة',
            text,
            style: TextStyle(
              color: ColorResources.black,
              fontSize: 18.sp,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
