import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:learning_anglish_app/business_logic/view_models/register_vm/register_vm.dart';
import 'package:learning_anglish_app/presentation/screens/registration/login_screen/login_screen.dart';
import 'package:learning_anglish_app/presentation/widgets/button/custom_button.dart';
import 'package:learning_anglish_app/presentation/widgets/text/custom_text.dart';
import 'package:learning_anglish_app/presentation/widgets/textFeild/custom_text_field.dart';
import 'package:learning_anglish_app/utils/app_constants/app_constants.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';
import 'package:learning_anglish_app/utils/icons/icons.dart';
import 'package:localization/localization.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
          seconds: 2), // Animation duration (2 seconds in this example)
    );

    _offsetAnimation = Tween<Offset>(
      begin: Offset(0.0, 1.0), // Start position (bottom of the screen)
      end: Offset(0.0, 0.0), // End position (original position)
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


  @override
  Widget build(BuildContext context) {
   final registerVm = Provider.of<RegisterViewModel>(context);
    return Consumer<RegisterViewModel>(
      builder: (BuildContext context, model, Widget? child) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding:
              EdgeInsets.only(top: 40.h, left: 25.w, right: 25.w, bottom: 10.h),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "! أهلا بك",
                        style: Theme.of(context).textTheme.displayMedium?.copyWith(
                            fontSize: 20.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        "اهلا بك ، من فضلك سجل بيانات حسابك",
                        style: Theme.of(context).textTheme.displayMedium?.copyWith(
                            fontSize: 15.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 30.h),
                      Text(
                        "الأسم",
                        style: Theme.of(context).textTheme.displayMedium?.copyWith(
                            fontSize: 16.sp, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 14.h),
                      CustomTextField(
                        isRegister: true,
                        controller: registerVm.nameController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "required_email".i18n();
                          }
                          return null;
                        },
                        textInputType: TextInputType.name,
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        "رقم الهاتف",
                        style: Theme.of(context).textTheme.displayMedium?.copyWith(
                            fontSize: 16.sp, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 14.h),
                      CustomTextField(
                        isRegister: true,
                        controller: registerVm.phoneController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "required_phone_number".i18n();
                          }
                          return null;
                        },
                        textInputType: TextInputType.phone,
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        "رقم ولي الأمر",
                        style: Theme.of(context).textTheme.displayMedium?.copyWith(
                            fontSize: 16.sp, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 20.h),
                      CustomTextField(
                        isRegister: true,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "required_parent_phone_number".i18n();
                          }
                          return null;
                        },
                        controller: registerVm.parentPhoneController,
                        textInputType: TextInputType.phone,
                      ),
                      SizedBox(height: 16.h),
                      // TODO: check if the email is after the parent's phone number in the figma ui design
                      Text(
                        "البريد الألكتروني",
                        style: Theme.of(context).textTheme.displayMedium?.copyWith(
                            fontSize: 16.sp, fontWeight: FontWeight.w500),
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
                        controller: registerVm.emailController,
                        textInputType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        "كلمة السر",
                        style: Theme.of(context).textTheme.displayMedium?.copyWith(
                            fontSize: 16.sp, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 14.h),
                      CustomTextField(
                        obscure:model.obscure,
                        isRegister: true,
                        suffix: IconButton(
                            onPressed: ()
                            {
                              model.changeObscureText();
                            },
                            icon:  Icon(
                              model.obscure?Icons.remove_red_eye:Icons.remove_red_eye_outlined,
                              color: Colors.black,
                            )),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "required_password".i18n();
                          }
                          return null;
                        },
                        textInputType: TextInputType.visiblePassword,
                        controller: registerVm.passwordController,
                      ),
                      SizedBox(height: 43.h),
                      SlideTransition(
                        position: _offsetAnimation,
                        child: CustomButton(
                          widgetInCenter: Align(
                            alignment: Alignment.center,
                            child: CustomText(
                              text: "انشاء حساب",
                              textAlign: TextAlign.center,
                              color: Colors.white,
                              txtSize: 17.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          color: ColorResources.buttonColor,
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              model.register(context: context);
                            }
                          },
                          loading: model.busy,
                        ),
                      ),
                      SizedBox(height: 40.h),
                      Center(
                          child: Text(
                            "أو التسجيل بواسطة",
                            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                      SizedBox(height: 25.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: 32.h,
                              width: 32.w,
                              child: FaIcon(FontAwesomeIcons.apple, size: 32.dg,)),
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
                      SizedBox(height: 30.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context, SlideTransition1(const LoginScreen()));
                            },
                            child: Text(
                              'تسجيل الدخول',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                fontSize: 16.sp,
                                color: HexColor('#FF004C'),
                              ),
                            ),
                          ),
                          Text(
                            "هل لديك حساب بالفعل ؟",
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
      },
    );
  }
}


 //isTyping||phoneTyping||phone2Typing||emailTyping||passwordTyping ?Colors.blue:Colors.black