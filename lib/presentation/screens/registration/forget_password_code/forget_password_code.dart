import 'dart:async';
import 'package:learning_anglish_app/business_logic/view_models/forgetPassword_vm/forgetPassword_vm.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_anglish_app/presentation/widgets/button/custom_button.dart';
import 'package:learning_anglish_app/presentation/widgets/text/custom_text.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class ForgetPasswordCode extends StatefulWidget {
  final String email;
  const ForgetPasswordCode({super.key, required this.email});

  @override
  State<ForgetPasswordCode> createState() => _ForgetPasswordCodeState();
}

class _ForgetPasswordCodeState extends State<ForgetPasswordCode>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  bool isReadyToResend = false;
  @override
  void initState() {
    activateTimer();

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

  int _current = 60;
  void activateTimer() {
    setState(() {
      isReadyToResend = false;
    });
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_current == 0) {
        setState(() {
          timer.cancel();
          isReadyToResend = true;
          _current = 60;
        });
      } else {
        setState(() {
          _current--;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Consumer<ForgetPasswordViewModel>(
      builder: (BuildContext context, model, Widget? child) {
        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                  top: 40.h, left: 25.w, right: 25.w, bottom: 10.h),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
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
                              size: 16.dg,
                            ), //circle_chevron_left
                          ),
                        ),
                      ),
                      SizedBox(height: 30.h),
                      Text(
                        "رمز التحقق",
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                                fontSize: 20.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        "أدخل رمز التحقق الذي أرسلناه للتو على عنوان بريدك",
                        textAlign: TextAlign.end,
                        style:
                            Theme.of(context).textTheme.displayMedium?.copyWith(
                                  fontSize: 15.sp,
                                ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        "الالكتروني",
                        textAlign: TextAlign.end,
                        style:
                            Theme.of(context).textTheme.displayMedium?.copyWith(
                                  fontSize: 15.sp,
                                ),
                      ),
                      SizedBox(height: 64.h),
                      PinCodeTextField(
                        autoDisposeControllers: false,
                        length: 4,
                        obscureText: false,
                        animationType: AnimationType.fade,
                        enableActiveFill: false,
                        enablePinAutofill: true,
                        //backgroundColor: Colors.transparent,
                        scrollPadding: EdgeInsets.zero,
                        cursorColor: Colors.black,
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(
                          width: 3.w,
                        ),
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.circle,
                          borderRadius: BorderRadius.circular(64.r),
                          fieldHeight: 72.h,
                          fieldWidth: 72.w,
                          activeColor:
                              Theme.of(context).indicatorColor.withOpacity(0.5),
                          //activeFillColor: Colors.white,
                          inactiveColor:
                              Theme.of(context).indicatorColor.withOpacity(0.5),
                          selectedColor:
                              Theme.of(context).indicatorColor.withOpacity(0.5),
                          inactiveFillColor: Colors.white,
                          disabledColor:
                              Theme.of(context).indicatorColor.withOpacity(0.5),
                          selectedFillColor:
                              Theme.of(context).indicatorColor.withOpacity(0.5),
                          fieldOuterPadding: EdgeInsets.zero,
                        ),
                        animationDuration: const Duration(milliseconds: 300),
                        onChanged: (value) {},
                        appContext: context,
                        controller: model.codeControler,
                      ),
                      SizedBox(height: 24.h),
                      SlideTransition(
                        position: _offsetAnimation,
                        child: CustomButton(
                          widgetInCenter: Align(
                            alignment: Alignment.center,
                            child: CustomText(
                              text: 'التحقق',
                              textAlign: TextAlign.center,
                              color: Colors.white,
                              txtSize: 17.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          color: ColorResources.buttonColor,
                          onTap: () {
                            model.forgetPasswordCode(
                              context: context,
                              email: widget.email,
                            );
                          },
                          loading: model.busy,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      isReadyToResend
                          ? TextButton(
                              child: Text(
                                "ارسال بريد اخر",
                                textAlign: TextAlign.justify,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(
                                      fontSize: 16.sp,
                                      // color: ColorResources.black,
                                      fontWeight: FontWeight.w400,
                                      height: 0.12.h,
                                    ),
                              ),
                              onPressed: () {
                                activateTimer();
                                model.resendEmail(context: context);
                              },
                            )
                          : Padding(
                              padding: EdgeInsets.only(top: 20.h),
                              child: Text(
                                'لارسال بريد اخر انتظر $_current ثانية',
                                textAlign: TextAlign.justify,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(
                                      fontSize: 16.sp,
                                      // color: ColorResources.black,
                                      fontWeight: FontWeight.w400,
                                      height: 0.12.h,
                                    ),
                              ),
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
