import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_anglish_app/presentation/screens/registration/newPassword_done/newPassword_done.dart';
import 'package:learning_anglish_app/presentation/widgets/button/custom_button.dart';
import 'package:learning_anglish_app/presentation/widgets/text/custom_text.dart';
import 'package:learning_anglish_app/presentation/widgets/textFeild/custom_text_field.dart';
import 'package:learning_anglish_app/utils/app_constants/app_constants.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';
import 'package:localization/localization.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword>
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
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // TODO: arrow back in new password screen?
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
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
                    'كلمه سر جديده',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    'يجب أن تكون كلمة السر الجديدة مختلفة عن تلك',
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontSize: 15.sp,
                        ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    'المستخدمة سابقا',
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontSize: 15.sp,
                        ),
                  ),
                  SizedBox(height: 30.h),
                  Text(
                    'كلمة السر الجديدة',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  SizedBox(height: 14.h),
                  CustomTextField(
                    suffix: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.remove_red_eye,
                          color: ColorResources.black,
                        )),
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
                    'تأكيد كلمة السر',
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
                        icon: Icon(
                          Icons.remove_red_eye,
                          color: ColorResources.black,
                        )),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "required_password".i18n();
                      }
                      return null;
                    },
                    textInputType: TextInputType.visiblePassword,
                  ),
                  SizedBox(height: 43.h),
                  SlideTransition(
                    position: _offsetAnimation,
                    child: CustomButton(
                      widgetInCenter: Align(
                        alignment: Alignment.center,
                        child: CustomText(
                          text: 'تغيير كلمة السر',
                          textAlign: TextAlign.center,
                          color: ColorResources.white1,
                          txtSize: 17.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      color: ColorResources.buttonColor,
                      onTap: () {
                        Navigator.push(context,
                            SlideTransition1(const NewPasswordDoneScreen()));
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
