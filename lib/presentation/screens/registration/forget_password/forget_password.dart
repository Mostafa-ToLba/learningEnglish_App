import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_anglish_app/presentation/screens/registration/forget_password_code/forget_password_code.dart';
import 'package:learning_anglish_app/presentation/widgets/button/custom_button.dart';
import 'package:learning_anglish_app/presentation/widgets/text/custom_text.dart';
import 'package:learning_anglish_app/presentation/widgets/textFeild/custom_text_field.dart';
import 'package:learning_anglish_app/utils/app_constants/app_constants.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';
import 'package:learning_anglish_app/utils/icons/icons.dart';
import 'package:localization/localization.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
          seconds: 2), // Animation duration (2 seconds in this example)
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0), // Start position (bottom of the screen)
      end: const Offset(0.0, 0.0), // End position (original position)
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
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.only(top: 40.h, left: 25.w, right: 25.w, bottom: 10.h),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child:  Container(
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
                ),
                  SizedBox(height: 30.h),
                  Text(
                    "forgot_password".i18n(),
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    "forgot_password_screen_subtitle".i18n(),
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontSize: 15.sp,
                        ),
                  ),
                  SizedBox(height: 64.h),
                  Text(
                    "email".i18n(),
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  SizedBox(height: 14.h),
                  CustomTextField(
                    isRegister: true,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "required_email".i18n();
                      }
                      return null;
                    },
                    textInputType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 24.h),
                  SlideTransition(
                    position: _offsetAnimation,
                    child: CustomButton(
                      widgetInCenter: Align(
                        alignment: Alignment.center,
                        child: CustomText(
                          text: "enter_verfication_code".i18n(),
                          textAlign: TextAlign.center,
                          color: Colors.white,
                          txtSize: 17.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      color: ColorResources.buttonColor,
                      onTap: () {
                        Navigator.push(context,
                            SlideTransition1(const ForgetPasswordCode()));
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
