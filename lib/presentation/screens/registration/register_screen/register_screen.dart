
 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:learning_anglish_app/presentation/screens/registration/login_screen/login_screen.dart';
import 'package:learning_anglish_app/presentation/widgets/button/custom_button.dart';
import 'package:learning_anglish_app/presentation/widgets/textFeild/custom_text_field.dart';
import 'package:learning_anglish_app/utils/app_constants/app_constants.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';
import 'package:learning_anglish_app/utils/icons/icons.dart';

class RegisterScreen extends StatefulWidget {
   const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with TickerProviderStateMixin {
 late AnimationController _controller;
 late Animation<Offset> _offsetAnimation;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  //  nameController.addListener(_updateTypingStatus);
  //  phoneController.addListener(_updateTypingStatus);
  //  phone2Controller.addListener(_updateTypingStatus);
  //  emailController.addListener(_updateTypingStatus);
  //  passwordController.addListener(_updateTypingStatus);
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
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  bool isChecked = false;
  TextEditingController  nameController = TextEditingController();
  TextEditingController  phoneController = TextEditingController();
  TextEditingController  phone2Controller = TextEditingController();
  TextEditingController  emailController = TextEditingController();
  TextEditingController  passwordController = TextEditingController();
  bool isTyping = false;
  bool phoneTyping = false;
  bool phone2Typing = false;
  bool emailTyping = false;
  bool passwordTyping = false;

  void _updateTypingStatus() {
    setState(() {
      isTyping = nameController.text.isNotEmpty;
      phoneTyping = phoneController.text.isNotEmpty;
      phone2Typing = phone2Controller.text.isNotEmpty;
      emailTyping = emailController.text.isNotEmpty;
      passwordTyping = passwordController.text.isNotEmpty;
    });
  }
   @override
   Widget build(BuildContext context) {

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
                   Text('أهلا بك !',style: TextStyle(fontSize: 20.sp,fontFamily: AppConstants.arabicFont1,fontWeight: FontWeight.bold),),
                   SizedBox(height: 8.h,),
                   Text('أهلا بك من فضلك سجل بيانات حسابك',style: TextStyle(fontSize: 15.sp,fontFamily: AppConstants.arabicFont1,color: ColorResources.appGreyColor),),
                   SizedBox(height: 30.h),
                   Text('الأسم',style: TextStyle(fontSize: 16.sp,fontFamily: AppConstants.arabicFont1,fontWeight: FontWeight.w500),),
                   SizedBox(height: 14.h),
                   CustomTextField(isRegister: true,controller: nameController,validator:(value)
                   {
                     if (value.isEmpty) {
                       return 'البريد الالكتروني مطلوب';
                     }
                     return null;
                   },textInputType: TextInputType.name, ),
                   SizedBox(height: 16.h),
                   Text('رقم الهاتف',style: TextStyle(fontSize: 16.sp,fontFamily: AppConstants.arabicFont1,fontWeight: FontWeight.w500),),
                   SizedBox(height: 14.h),
                   CustomTextField(isRegister: true,controller: phoneController,
                       validator:(value)
                       {
                         if (value.isEmpty) {
                           return 'كلمة السر مطلوبة';
                         }
                         return null;
                       },textInputType: TextInputType.phone, ),
                   SizedBox(height: 20.h),
                   Text('رقم ولي الأمر',style: TextStyle(fontSize: 16.sp,fontFamily: AppConstants.arabicFont1,fontWeight: FontWeight.w500),),
                   SizedBox(height: 20.h),
                   CustomTextField(isRegister: true,validator:(value)
                   {
                     if (value.isEmpty) {
                       return 'البريد الالكتروني مطلوب';
                     }
                     return null;
                   },controller: phone2Controller,textInputType: TextInputType.phone,  ),
                   SizedBox(height: 16.h),
                   Text('البريد الالكتروني',style: TextStyle(fontSize: 16.sp,fontFamily: AppConstants.arabicFont1,fontWeight: FontWeight.w500),),
                   SizedBox(height: 14.h),
                   CustomTextField(isRegister: true,validator:(value)
                   {
                     if (value.isEmpty) {
                       return 'البريد الالكتروني مطلوب';
                     }
                     return null;
                   },controller: emailController,textInputType: TextInputType.emailAddress,  ),
                   SizedBox(height: 16.h),
                   Text('كلمة السر',style: TextStyle(fontSize: 16.sp,fontFamily: AppConstants.arabicFont1,fontWeight: FontWeight.w500),),
                   SizedBox(height: 14.h),
                   CustomTextField(isRegister: true,suffix: IconButton(onPressed: (){}, icon: const Icon(Icons.remove_red_eye,color: Colors.black,)),
                       validator:(value)
                       {
                         if (value.isEmpty) {
                           return 'كلمة السر مطلوبة';
                         }
                         return null;
                       },textInputType: TextInputType.visiblePassword,controller: passwordController, ),
                   SizedBox(height: 43.h),
                   SlideTransition(
                     position: _offsetAnimation,
                     child: CustomButton(
                       text: 'انشاء حساب',color: ColorResources.buttonColor,colorTxt: Colors.white,
                       onTap: ()
                       {
                         if (formKey.currentState!.validate()) {
                           //     formKey.currentState!.save();
                         }
                       },
                     ),
                   ),
                   SizedBox(height: 40.h),
                   Center(child: Text('أو التسجيل بواسطه',style: TextStyle(fontSize: 16.sp,fontFamily: AppConstants.arabicFont1,fontWeight: FontWeight.w500,color:ColorResources.appGreyColor),)),
                   SizedBox(height: 25.h),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children:
                     [
                       Container(
                           height: 32.h,
                           width: 32.w,
                           child: SvgPicture.asset(IconResources.Apple)),
                       SizedBox(width: 24.w),
                       Container(
                           height: 32.h,
                           width: 32.w,
                           child: SvgPicture.asset(IconResources.Google)),
                       SizedBox(width: 24.w),
                       Container(
                           height: 32.h,
                           width: 32.w,
                           child: SvgPicture.asset(IconResources.Facebook)),
                     ],
                   ),
                   //     Spacer(),
                   SizedBox(height: 30.h),
                   Row(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     mainAxisAlignment: MainAxisAlignment.center,
                     children:
                     [
                       Text(
                         'هل لديك حساب بالفعل؟',
                         style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w400,color:ColorResources.appGreyColor),
                       ),
                       TextButton(onPressed: ()
                       {
                         Navigator.push(
                             context, SlideTransition1(const LoginScreen()));
                       }, child: Text('تسجيل الدخول',style: TextStyle(fontSize:16.sp,color:HexColor('#FF004C'),fontFamily: AppConstants.arabicFont1),))
                     ],
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


 //isTyping||phoneTyping||phone2Typing||emailTyping||passwordTyping ?Colors.blue:Colors.black