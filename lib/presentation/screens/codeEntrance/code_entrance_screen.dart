import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_anglish_app/presentation/screens/exams/exams_screen.dart';
import 'package:learning_anglish_app/presentation/widgets/button/custom_button.dart';
import 'package:learning_anglish_app/utils/app_constants/app_constants.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';
import 'package:localization/localization.dart';

// TODO: maybe adding custom button for enter button in the future
class CodeEntranceScreen extends StatelessWidget {
  const CodeEntranceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorResources.grey5,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(right: 24.w, left: 24.w, top: 32.h),
          child: Container(
            alignment: Alignment.center,
            //margin: const EdgeInsets.all(16),
            padding: EdgeInsets.only(right: 24.w, left: 24.w, top: 32.h),
            width: 327.w,
            height: 520.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(46.r),
              ),
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 32.h),
                Container(
                  width: 96.w,
                  height: 96.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/enterUnitCode.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                Text(
                  "enter_unit_code".i18n(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 15.h),
                Text(
                  "enter_unit_code_subtitle".i18n(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 14.sp,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 24.h),
                Container(
                  width: 279.w,
                  height: 56.h,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: Colors.black.withOpacity(0.25),
                      ),
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  child: TextFormField(
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 14.sp,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      hintText: "enter_code".i18n(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 17.h, horizontal: 24.w),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                CustomButton(
                  text: "enter".i18n(),
                  color: ColorResources.buttonColor,
                  colorTxt: Colors.white,
                  onTap: () {
                    Navigator.push(
                      context,
                      SlideTransition1(
                        const ExamsScreen(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 4.h),
                /*
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          const MaterialStatePropertyAll<Color>(Colors.brown),
                      foregroundColor:
                          const MaterialStatePropertyAll<Color>(Colors.white),
                      fixedSize: MaterialStatePropertyAll<Size>(
                        Size(double.infinity,
                            MediaQuery.sizeOf(context).height * 0.09),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.1,
                        ),
                        Text("enter".i18n()),
                        Container(
                          height: 40,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          child: const Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  */
                TextButton(
                  child: Text(
                    "go_back".i18n(),
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      height: 0.12,
                    ),
                  ),
                  onPressed: () {},
                ),
                /*
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      elevation: const MaterialStatePropertyAll<double>(0),
                      backgroundColor:
                          const MaterialStatePropertyAll<Color>(Colors.white),
                      foregroundColor:
                          const MaterialStatePropertyAll<Color>(Colors.brown),
                      fixedSize: MaterialStatePropertyAll<Size>(
                        Size(double.infinity,
                            MediaQuery.sizeOf(context).height * 0.09),
                      ),
                    ),
                    child: Text("go_back".i18n()),
                  ),
                */
              ],
            ),
          ),
        ),
      ),
    );
  }
}
