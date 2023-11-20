
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_anglish_app/presentation/screens/registration/create_new_password/create_new_password.dart';
import 'package:learning_anglish_app/presentation/widgets/button/custom_button.dart';
import 'package:learning_anglish_app/utils/app_constants/app_constants.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';
import 'package:learning_anglish_app/utils/icons/icons.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ForgetPasswordCode extends StatefulWidget {
  const ForgetPasswordCode({super.key});

  @override
  State<ForgetPasswordCode> createState() => _ForgetPasswordCodeState();
}


class _ForgetPasswordCodeState extends State<ForgetPasswordCode> with TickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Animation duration (2 seconds in this example)
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0), // Start position (bottom of the screen)
      end: const Offset(0.0, 0.0),   // End position (original position)
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn, // Adjust the curve as needed
      ),
    );

    _controller.forward();
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding:EdgeInsets.only(top: 40.h,left: 25.w,right: 25.w,bottom: 10.h),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                      onTap: ()
                      {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 40.r, // Set the width and height to your desired size
                        height: 40.r,padding: EdgeInsets.only(right: 4.w),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white, // White background
                          border: Border.all(
                            color: Colors.grey, // Grey border color
                            width: 1.0, // Border width
                          ),
                        ),
                        child: Center(child: SvgPicture.asset(IconResources.arrowleft,height: 25.h,)),),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Text('رمز التحقق',style: TextStyle(fontSize: 20.sp,fontFamily: AppConstants.arabicFont1,fontWeight: FontWeight.bold),),
                  SizedBox(height: 8.h,),
                  Text('ادخل رمز التحقق الذي ارسلناه للتو علي عنوان بريدك الألكتروني',style: TextStyle(fontSize: 15.sp,fontFamily: AppConstants.arabicFont1,color: ColorResources.appGreyColor),),
                  SizedBox(height: 64.h),
                  PinCodeTextField(
                    length: 4,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    enableActiveFill: true,
                    enablePinAutofill: true,
                    backgroundColor: Colors.transparent,
                    scrollPadding: EdgeInsets.zero,
                    cursorColor: Colors.black,
                    separatorBuilder: (context,int)=>SizedBox(width: 3.w,),
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(32.r),
                      fieldHeight: 64.h,
                      fieldWidth: 64.w,
                      activeColor: const Color(0xFFEEEEEE),
                      activeFillColor: Colors.white,
                      inactiveColor: const Color(0xFFEEEEEE),
                      selectedColor: const Color(0xFFEEEEEE),
                      inactiveFillColor: Colors.white,
                      disabledColor: const Color(0xFFEEEEEE),
                      selectedFillColor: const Color(0xFFEEEEEE),
                      fieldOuterPadding: EdgeInsets.zero,
                    ),
                    animationDuration: const Duration(milliseconds: 300),

                    onChanged: (value) {

                    }, appContext: context,
                  ),
                  SizedBox(height: 24.h),
                  SlideTransition(
                    position: _offsetAnimation,
                    child: CustomButton(text: '        التحقق',color: ColorResources.buttonColor,colorTxt: Colors.white,
                      onTap: ()
                      {
                        Navigator.push(
                            context, SlideTransition1(const CreateNewPassword()));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}