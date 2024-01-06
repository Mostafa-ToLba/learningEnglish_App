import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:learning_anglish_app/utils/app_constants/app_constants.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';
import 'package:learning_anglish_app/utils/images/images.dart';

class CustomAppBarWithMenu extends StatefulWidget {
  final VoidCallback onIconPressed;
  final String text;
  const CustomAppBarWithMenu(
      {super.key, required this.onIconPressed, required this.text});

  @override
  State<CustomAppBarWithMenu> createState() => _CustomAppBarWithMenuState();
}

class _CustomAppBarWithMenuState extends State<CustomAppBarWithMenu> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.w, right: 24.w),
      child: Row(
        children: [
          IconButton(
            onPressed: widget.onIconPressed,
            icon: Image(
              height: 35.r,
              width: 35.r,
              image: const AssetImage(Images.menu1),
              color: Theme.of(context).textTheme.displayMedium!.color,
            ),
          ),
          const Spacer(),
          Text(
            //'بنك الأسئلة',
            widget.text,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: 18.sp,
                  color: Colors.red,
                  fontFamily: AppConstants.arabicFont1,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    );
  }
}
