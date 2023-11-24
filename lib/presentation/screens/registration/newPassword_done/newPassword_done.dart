import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_anglish_app/presentation/screens/registration/login_screen/login_screen.dart';
import 'package:learning_anglish_app/presentation/widgets/button/custom_button.dart';
import 'package:learning_anglish_app/utils/app_constants/app_constants.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';
import 'package:learning_anglish_app/utils/icons/icons.dart';
import 'package:localization/localization.dart';

class NewPasswordDoneScreen extends StatefulWidget {
  const NewPasswordDoneScreen({super.key});

  @override
  State<NewPasswordDoneScreen> createState() => _NewPasswordDoneScreenState();
}

class _NewPasswordDoneScreenState extends State<NewPasswordDoneScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
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
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.only(top: 40.h, left: 25.w, right: 25.w, bottom: 10.h),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 40
                            .r, // Set the width and height to your desired size
                        height: 40.r, padding: EdgeInsets.only(right: 4.w),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white, // White background
                          border: Border.all(
                            color: Colors.grey, // Grey border color
                            width: 1.0, // Border width
                          ),
                        ),
                        child: Center(
                            child: SvgPicture.asset(
                          IconResources.arrowleft,
                          height: 25.h,
                        )),
                      ),
                    ),
                  ),
                  SizedBox(height: 50.h),
                  Container(
                    width:
                        120.h, // Set the width and height to your desired size
                    height: 120.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green, // White background
                      border: Border.all(
                        color: Colors.transparent, // Grey border color
                        width: 4.0, // Border width
                      ),
                    ),
                    child: Icon(Icons.check, size: 56.sp),
                  ),
                  SizedBox(
                    height: 52.h,
                  ),
                  Text(
                    "password_confirmation_complete".i18n(),
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontFamily: AppConstants.arabicFont1,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Center(
                      child: Text(
                    "password_confirmation_screen_subtitle".i18n(),
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontFamily: AppConstants.arabicFont1,
                        color: ColorResources.appGreyColor),
                  )),
                  SizedBox(height: 32.h),
                  SlideTransition(
                    position: _offsetAnimation,
                    child: CustomButton(
                      text: "sign_in".i18n(),
                      color: ColorResources.buttonColor,
                      colorTxt: Colors.white,
                      onTap: () {
                        Navigator.push(
                            context, SlideTransition1(const LoginScreen()));
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
