import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_anglish_app/utils/app_constants/app_constants.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';
import 'package:localization/localization.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 25.h),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 24.w, right: 24.w),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20.r,
                    backgroundImage: const NetworkImage(
                        'https://images.unsplash.com/photo-1508184964240-ee96bb9677a7?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
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
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Mostafa Mahmoud',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: AppConstants.arabicFont1,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.menu,
                      color: Colors.black,
                      size: 30.h,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            SizedBox(height: 16.h),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24.w),
              padding: EdgeInsets.all(24.dg),
              height: 170.h,
              //height: MediaQuery.sizeOf(context).height * 0.2,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(32.r),
                ),
                color: ColorResources.white1,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        //mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Getting away الوحدة الأولى',
                            style: TextStyle(
                              color: ColorResources.black,
                              fontSize: 16.sp,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          //SizedBox(height: 4.h),
                          Text(
                            'عدد الدروس : 8',
                            style: TextStyle(
                              color: ColorResources.black.withOpacity(0.5),
                              fontSize: 14.sp,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0),
                          image: const DecorationImage(
                              image: AssetImage("assets/icons/book.jpg")),
                        ),
                      ),
                      // Icon(Icons.book, size: 32.dg, color: ColorResources.blue,),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 24.w,
                        height: 24.h,
                        margin: EdgeInsets.only(left: 24.w),
                        decoration: const ShapeDecoration(
                          color: Color(0xFF49423A),
                          shape: OvalBorder(),
                        ),
                        child: Icon(
                          Icons.keyboard_arrow_left,
                          color: Colors.white,
                          size: 20.dm,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          LinearPercentIndicator(
                            isRTL: true,
                            width: 200.w,
                            lineHeight: 8.0,
                            percent: 0.9,
                            progressColor: ColorResources.brownDark,
                          ),
                          Text(
                            '52/%',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: ColorResources.black,
                              fontSize: 12.sp,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
