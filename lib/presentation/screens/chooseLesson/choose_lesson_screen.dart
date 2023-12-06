import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_anglish_app/presentation/screens/lesson/unpaid_lesson_screen.dart';
import 'package:learning_anglish_app/utils/app_constants/app_constants.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';

class ChooseLessonScreen extends StatelessWidget {
  const ChooseLessonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 25.h, left: 24.w, right: 24.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'الوحدة الأولى',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            'Getting away',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  height: 0.07.h,
                                ),
                          ),
                        ],
                      ),
                      //SizedBox(width: 10),
                    ],
                  ),
                  Container(
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          color: Theme.of(context).indicatorColor,
                        ),
                        borderRadius: BorderRadius.circular(32.r),
                      ),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        size: 20.dg,
                      ), //circle_chevron_left
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(top: 16.h),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              SlideTransition1(const UnpaidLessonScreen()));
                        },
                        child: Container(
                          //margin: EdgeInsets.all(25.dg),
                          //width: 327.w,
                          height: 80.h,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            //color: ColorResources.white1,
                            border: Border.all(
                              width: 1,
                              color: Theme.of(context).indicatorColor,
                            ),
                            borderRadius: BorderRadius.circular(32.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(width: 24.w),
                                  Icon(
                                    Icons.folder,
                                    color: Colors.green,
                                    size: 30.dm,
                                  ),
                                  SizedBox(width: 12.w),
                                  Text(
                                    'الحصة الأولى',
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400,
                                          height: 0.07.h,
                                        ),
                                  ),
                                  
                                ],
                              ),
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
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
