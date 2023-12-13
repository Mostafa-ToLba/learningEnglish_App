
 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_anglish_app/presentation/widgets/text/custom_text.dart';

 PreferredSizeWidget connectionAppBar()=>AppBar(
   leadingWidth: 100.w,
   title: CustomText(text: 'لا يوجد اتصال بالانترنت',txtSize: 15.sp,color: Colors.white),
   leading: Row(
     children: [
       SizedBox(width: 30.w),
       const Icon(
         Icons.wifi_off,
         color: Colors.red,
       ),
     ],
   ),
 );