
 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:learning_anglish_app/presentation/screens/registration/forget_password_code/forget_password_code.dart';
import 'package:learning_anglish_app/presentation/widgets/button/custom_button.dart';
import 'package:learning_anglish_app/presentation/widgets/textFeild/custom_text_field.dart';
import 'package:learning_anglish_app/utils/app_constants/app_constants.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';
import 'package:learning_anglish_app/utils/icons/icons.dart';

class ForgetPassword extends StatefulWidget {
   const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}


class _ForgetPasswordState extends State<ForgetPassword> with TickerProviderStateMixin{
 late AnimationController _controller;
 late Animation<Offset> _offsetAnimation;
 @override
  void initState() {
   _controller = AnimationController(
     vsync: this,
     duration: Duration(seconds: 2), // Animation duration (2 seconds in this example)
   );

   _offsetAnimation = Tween<Offset>(
     begin: Offset(0.0, 1.0), // Start position (bottom of the screen)
     end: Offset(0.0, 0.0),   // End position (original position)
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
                   Text('نسيت كلمة السر',style: TextStyle(fontSize: 20.sp,fontFamily: AppConstants.arabicFont1,fontWeight: FontWeight.bold),),
                   SizedBox(height: 8.h,),
                   Text('لا تقلق! هذا يحدث الرجاء ادخال عنوان بريدك الالكتروني المرتبط بحسابك',style: TextStyle(fontSize: 15.sp,fontFamily: AppConstants.arabicFont1,color: ColorResources.appGreyColor),),
                   SizedBox(height: 64.h),
                   Text('البريد الالكتروني',style: TextStyle(fontSize: 16.sp,fontFamily: AppConstants.arabicFont1,fontWeight: FontWeight.w500),),
                   SizedBox(height: 14.h),
                   CustomTextField(isRegister: true,validator:(value)
                   {
                     if (value.isEmpty) {
                       return 'البريد الالكتروني مطلوب';
                     }
                     return null;
                   },textInputType: TextInputType.emailAddress, ),
                   SizedBox(height: 24.h),
                   SlideTransition(
                     position: _offsetAnimation,
                     child: CustomButton(text: 'ارسال الرمز',color: ColorResources.buttonColor,colorTxt: Colors.white,
                       onTap: ()
                       {
                         Navigator.push(
                             context, SlideTransition1(const ForgetPasswordCode()));
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
