import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:learning_anglish_app/presentation/screens/chooseClass/choose_class_screen.dart';
import 'package:learning_anglish_app/presentation/screens/registration/forget_password/forget_password.dart';
import 'package:learning_anglish_app/presentation/screens/registration/register_screen/register_screen.dart';
import 'package:learning_anglish_app/presentation/widgets/button/custom_button.dart';
import 'package:learning_anglish_app/presentation/widgets/text/custom_text.dart';
import 'package:learning_anglish_app/presentation/widgets/textFeild/custom_text_field.dart';
import 'package:learning_anglish_app/utils/app_constants/app_constants.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';
import 'package:learning_anglish_app/utils/icons/icons.dart';
import 'package:localization/localization.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
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
              EdgeInsets.only(top: 60.h, left: 25.w, right: 25.w, bottom: 10.h),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '! أهلا بعودتك',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    "اهلا بك من فضلك ادخلك بيانات حسابك",
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontSize: 15.sp,
                        ),
                  ),
                  SizedBox(height: 30.h),
                  Text(
                    'البريد الالكتروني',
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
                  SizedBox(height: 16.h),
                  Text(
                    "كلمة السر",
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  SizedBox(height: 14.h),
                  CustomTextField(
                    isRegister: true,
                    suffix: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.remove_red_eye,
                          color: Colors.black,
                        )),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "required_password".i18n();
                      }
                      return null;
                    },
                    textInputType: TextInputType.visiblePassword,
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Checkbox(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.r)),
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                        activeColor:
                            Colors.white10, // Customize the checkbox color
                        checkColor: Colors.green,
                        fillColor:
                            MaterialStateProperty.all(ColorResources.grey1),
                        side: BorderSide(
                          color: ColorResources.appGreyColor,
                        ),
                      ),
                      SizedBox(width: 0.w),
                      Text(
                        "تذكرني",
                        style:
                            Theme.of(context).textTheme.displayMedium?.copyWith(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              SlideTransition1(const ForgetPassword()));
                        },
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "هل نسيت كلمة السر؟",
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: HexColor('#FF004C'),
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 43.h),
                  SlideTransition(
                    position: _offsetAnimation,
                    child: CustomButton(
                      widgetInCenter: Align(
                        alignment: Alignment.center,
                        child: CustomText(
                          text: "تسجيل الدخول",
                          textAlign: TextAlign.center,
                          color: ColorResources.white1,
                          txtSize: 17.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      color: ColorResources.buttonColor,
                      onTap: () {
                       {
                          Navigator.pushReplacement(context,
                              SlideTransition1(const ChooseClassScreen()));
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Center(
                    child: Text(
                      "أو تسجيل الدخول بواسطة",
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                    ),
                  ),
                  SizedBox(height: 25.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 32.h,
                          width: 32.w,
                          child: FaIcon(
                            FontAwesomeIcons.apple,
                            size: 32.dg,
                          )),

                      //Fa.asset(IconResources.Apple)),
                      SizedBox(width: 24.w),
                      SizedBox(
                          height: 32.h,
                          width: 32.w,
                          child: SvgPicture.asset(IconResources.Google)),
                      SizedBox(width: 24.w),
                      SizedBox(
                          height: 32.h,
                          width: 32.w,
                          child: SvgPicture.asset(IconResources.Facebook)),
                    ],
                  ),
                  //     Spacer(),
                  SizedBox(height: 70.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              SlideTransition1(const RegisterScreen()));
                        },
                        //style: ButtonStyle()
                        child: Text(
                          "تسجيل جديد",
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      Text(
                        "ليس لديك حساب؟",
                        style:
                            Theme.of(context).textTheme.displayMedium?.copyWith(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                      ),
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
