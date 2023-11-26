import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';

class QuestionBankView extends StatelessWidget {
  const QuestionBankView({super.key});

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
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.menu,
                      color: Colors.black,
                      size: 30.h,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'بنك الأسئلة',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                // physics: AlwaysScrollableScrollPhysics(),
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: 24.w, right: 24.w, top: 16.h, bottom: 24.h),
                    padding: EdgeInsets.only(bottom: 24.h),
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32.r),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 16.h),
                        Theme(
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32.r),
                            ),
                            child: ExpansionTile(
                              iconColor: Colors.brown,
                              collapsedIconColor: Colors.brown,
                              //leading: I,
                              trailing: Container(
                                width: 40.w,
                                height: 40.h,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0),
                                  image: const DecorationImage(
                                      image:
                                          AssetImage("assets/icons/book.jpg")),
                                ),
                              ),
                              title: const Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'الوحدة الثانية: Supporting the community ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              controlAffinity: ListTileControlAffinity.leading,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 16.h, horizontal: 24.w),
                                  //height: MediaQuery.sizeOf(context).height * 0.1,
                                  //width: 300.w,
                                  //height: 56.h,
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 1,
                                        color: Colors.black.withOpacity(0.25),
                                      ),
                                      borderRadius: BorderRadius.circular(32.r),
                                    ),
                                  ),
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 2, horizontal: 12),
                                    title: const Align(
                                      alignment: Alignment.centerRight,
                                      child: Text('الحصة الاولى'),
                                    ),
                                    leading: Container(
                                      height: 24.h,
                                      width: 24.w,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(24.r),
                                        color: ColorResources.buttonColor,
                                      ),
                                      child: Icon(
                                        Icons.keyboard_arrow_left,
                                        color: Colors.white,
                                        size: 20.dm,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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
