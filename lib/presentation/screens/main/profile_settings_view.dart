import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:learning_anglish_app/presentation/screens/registration/login_screen/login_screen.dart';
import 'package:learning_anglish_app/presentation/widgets/button/custom_button.dart';
import 'package:learning_anglish_app/presentation/widgets/phoneTextField/phoneTextField.dart';
import 'package:learning_anglish_app/presentation/widgets/profileTextField/profileTextField.dart';
import 'package:learning_anglish_app/presentation/widgets/text/custom_text.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';
import 'package:learning_anglish_app/utils/icons/icons.dart';
import 'package:localization/localization.dart';

class ProfileSettingsView extends StatefulWidget {
  const ProfileSettingsView({super.key});

  @override
  State<ProfileSettingsView> createState() => _ProfileSettingsViewState();
}

class _ProfileSettingsViewState extends State<ProfileSettingsView>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
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
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          ProfileHeader(
            coverImageColor: ColorResources.buttonColor,
            avatar:
                'https://imgs.search.brave.com/56g8QfAqZ3wo8_Mz6y8bGT4Wi8heVdsTraSdeC3ifrc/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9wdWIt/c3RhdGljLmZvdG9y/LmNvbS9hc3NldHMv/cHJvamVjdHMvcGFn/ZXMvYmMzOTJiM2Jk/OGUzNDIyY2JiNjEx/OGQ3OGU2Zjc3YmUv/Zm90b3ItYzVkMmVk/NjIyMWFhNGQxOWE2/ZjY4NjZhYmU2Yzdh/NTAuanBn',
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 20.h, right: 24.w, left: 24.w),
              //padding: EdgeInsets.all(16.dg),
              child: ListView(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "الأسم",
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                                fontSize: 16.sp,
                                color: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .color
                                    ?.withOpacity(0.6499999761581421),
                                //color: Theme.of(context).primaryColor,
                                // color: ColorResources.black,
                                fontWeight: FontWeight.w400,
                              ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                    CustomProfileTextField(hintText: 'Your name',hintColor:Colors.grey[500],
                    ),
                  SizedBox(height: 16.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "البريد الالكتروني",
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                                fontSize: 16.sp,
                                color: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .color
                                    ?.withOpacity(0.6499999761581421),
                                //color: Theme.of(context).primaryColor,
                                // color: ColorResources.black,
                                fontWeight: FontWeight.w400,
                              ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  CustomProfileTextField(hintText: 'Your email',hintColor:Colors.grey[500],
                  ),
                  SizedBox(height: 16.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'رقم الهاتف',
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                                fontSize: 16.sp,
                                color: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .color
                                    ?.withOpacity(0.6499999761581421),
                                //color: Theme.of(context).primaryColor,
                                // color: ColorResources.black,
                                fontWeight: FontWeight.w400,
                              ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  CustomPhoneTextField(hintText: '1023223332',hintColor: Colors.grey[500],textColor: Colors.black,),
                  SizedBox(height: 16.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "رقم ولي الأمر",
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                                fontSize: 16.sp,
                                color: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .color
                                    ?.withOpacity(0.6499999761581421),
                                //color: Theme.of(context).primaryColor,
                                // color: ColorResources.black,
                                fontWeight: FontWeight.w400,
                              ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  CustomPhoneTextField(hintText: '1023223332',hintColor: Colors.grey[500],textColor: Colors.black,),
                  SizedBox(height: 25.h),
                  SlideTransition(
                    position: _offsetAnimation,
                    child: CustomButton(
                      widgetInCenter: Align(
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            CustomText(
                              text: "change_password".i18n(),
                              textAlign: TextAlign.center,
                              color: Colors.white,
                              txtSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(width: 10.w),
                            SvgPicture.asset(
                              fit: BoxFit.scaleDown,
                              IconResources.lock,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      color: ColorResources.buttonColor,
                      onTap: () {
                        Route route = MaterialPageRoute(
                            builder: (context) => const LoginScreen());
                        Navigator.pushReplacement(context, route);
                      },
                    ),
                  ),
                  SizedBox(height: 4.h),
                  TextButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "log_out".i18n(),
                          //textAlign: TextAlign.justify,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                fontSize: 16.sp,
                                color: ColorResources.red,
                                fontWeight: FontWeight.w400,
                              ),
                        ),
                        Icon(
                          Icons.logout,
                          color: ColorResources.red,
                          size: 16.sp,
                        ),
                      ],
                    ),
                    onPressed: () {
                      Route route = MaterialPageRoute(
                          builder: (context) => const LoginScreen());
                      Navigator.pushReplacement(context, route);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
          suffixIcon: isPasswordTextField
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  icon: const Icon(
                    Icons.remove_red_eye,
                    color: Colors.grey,
                  ),
                )
              : null,
          contentPadding: const EdgeInsets.only(bottom: 3),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontSize: 16.sp,
                color: Theme.of(context).textTheme.displayMedium!.color?.withOpacity(0.6499999761581421),
                //color: Theme.of(context).primaryColor,
                // color: ColorResources.black,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  final Color coverImageColor;
  final String avatar;

  const ProfileHeader({
    super.key,
    required this.coverImageColor,
    required this.avatar,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,
      child: Stack(
        children: <Widget>[
          Container(
            height: 120.h,
            color: coverImageColor,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Column(
              children: <Widget>[
                Avatar(
                  image: avatar,
                  radius: 60.r,
                  iconBackgroudColor: coverImageColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Avatar extends StatelessWidget {
  final String image;
  final double radius;
  final Color iconBackgroudColor;
  const Avatar({
    super.key,
    required this.image,
    required this.radius,
    required this.iconBackgroudColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: radius,
          backgroundImage: NetworkImage(image),
        ),
        Positioned(
          bottom: 6.h,
          left: 6.w,
          child: Container(
            height: 24.h,
            width: 24.w,
            decoration: ShapeDecoration(
              color: ColorResources.brownDark,
              shape: const OvalBorder(),
            ),
            child: Icon(
              Icons.edit,
              color: Colors.white,
              size: 12.dg,
            ),
          ),
        ),
      ],
    );
  }
}
