import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_anglish_app/presentation/screens/lesson/paid_lesson_screen.dart';
import 'package:learning_anglish_app/presentation/widgets/button/custom_button.dart';
import 'package:learning_anglish_app/presentation/widgets/text/custom_text.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';
import 'package:localization/localization.dart';

// TODO: maybe adding custom button for enter button in the future
class CodeEntranceScreen extends StatefulWidget {
  const CodeEntranceScreen({super.key});

  @override
  State<CodeEntranceScreen> createState() => _CodeEntranceScreenState();
}

class _CodeEntranceScreenState extends State<CodeEntranceScreen>
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(right: 24.w, left: 24.w, top: 32.h),
          child: Container(
            alignment: Alignment.center,
            //margin: const EdgeInsets.all(16),
            padding: EdgeInsets.only(right: 24.w, left: 24.w, top: 32.h),
            width: 327.w,
            height: 520.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(46.r),
              ),
              //color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 32.h),
                Container(
                  width: 96.w,
                  height: 96.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/enterUnitCode.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                Text(
                  "enter_unit_code".i18n(),
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                      ),
                ),
                SizedBox(height: 15.h),
                Text(
                  "enter_unit_code_subtitle".i18n(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        //color: Theme.of(context).primaryColor.withOpacity(0.5),
                      ),
                ),
                SizedBox(height: 24.h),
                Container(
                  width: 279.w,
                  height: 56.h,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: Colors.black.withOpacity(0.25),
                      ),
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  child: TextFormField(
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.5),
                        ),
                    decoration: InputDecoration(
                      hintText: "enter_code".i18n(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 17.h, horizontal: 24.w),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                SlideTransition(
                  position: _offsetAnimation,
                  child: CustomButton(
                    widgetInCenter: Align(
                      alignment: Alignment.center,
                      child: CustomText(
                        text: "enter".i18n(),
                        textAlign: TextAlign.center,
                        color: Colors.white,
                        txtSize: 17.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    color: ColorResources.buttonColor,
                    onTap: () {
                      Route route = MaterialPageRoute(
                          builder: (context) => const PaidLessonScreen());
                      Navigator.pushReplacement(context, route);
                    },
                  ),
                ),
                SizedBox(height: 4.h),
                /*
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          const MaterialStatePropertyAll<Color>(Colors.brown),
                      foregroundColor:
                          const MaterialStatePropertyAll<Color>(Colors.white),
                      fixedSize: MaterialStatePropertyAll<Size>(
                        Size(double.infinity,
                            MediaQuery.sizeOf(context).height * 0.09),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.1,
                        ),
                        Text("enter".i18n()),
                        Container(
                          height: 40,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          child: const Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  */
                TextButton(
                  child: Text(
                    "go_back".i18n(),
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          height: 0.12.h,
                        ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                /*
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      elevation: const MaterialStatePropertyAll<double>(0),
                      backgroundColor:
                          const MaterialStatePropertyAll<Color>(Colors.white),
                      foregroundColor:
                          const MaterialStatePropertyAll<Color>(Colors.brown),
                      fixedSize: MaterialStatePropertyAll<Size>(
                        Size(double.infinity,
                            MediaQuery.sizeOf(context).height * 0.09),
                      ),
                    ),
                    child: Text("go_back".i18n()),
                  ),
                */
              ],
            ),
          ),
        ),
      ),
    );
  }
}
