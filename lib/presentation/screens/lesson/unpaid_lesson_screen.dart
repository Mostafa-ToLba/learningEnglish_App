import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_anglish_app/business_logic/view_models/themes_vm/themes_vm.dart';
import 'package:learning_anglish_app/presentation/screens/codeEntrance/code_entrance_screen.dart';
import 'package:learning_anglish_app/presentation/screens/exams/exams_screen.dart';
import 'package:learning_anglish_app/presentation/screens/lesson/paid_lesson_screen.dart';
import 'package:learning_anglish_app/presentation/widgets/button/custom_button.dart';
import 'package:learning_anglish_app/presentation/widgets/customDialog/customDialog.dart';
import 'package:learning_anglish_app/presentation/widgets/text/custom_text.dart';
import 'package:learning_anglish_app/utils/app_constants/app_constants.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';
import 'package:learning_anglish_app/utils/icons/icons.dart';
import 'package:localization/localization.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class UnpaidLessonScreen extends StatefulWidget {
  const UnpaidLessonScreen({super.key});

  @override
  State<UnpaidLessonScreen> createState() => _UnpaidLessonScreenState();
}

class _UnpaidLessonScreenState extends State<UnpaidLessonScreen> {
  final String videoURL = 'https://youtu.be/YMx8Bbev6T4?si=Wl1_dabKsy51h8RJ';
  late YoutubePlayerController _controller;

  @override
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(videoURL);
    _controller = YoutubePlayerController(
      initialVideoId: videoID!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
    super.initState();
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeVm = Provider.of<ThemesViewModel>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 25.h, left: 24.w, right: 24.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          color: themeVm.isDark?Colors.black:Colors.white, // White background
                          border: Border.all(
                            color: Colors.grey, // Grey border color
                            width: 1.0, // Border width
                          ),
                        ),
                        child: Center(
                            child: SvgPicture.asset(
                              IconResources.arrowleft,
                              color: themeVm.isDark?Colors.white:Colors.black,
                              height: 25.h,
                            )),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'الوحدة الأولى',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  fontSize: 18.sp,
                                  //color: Theme.of(context).primaryColor,
                                  // color: ColorResources.black,
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            'Getting away',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  fontSize: 16.sp,
                                  //color: Theme.of(context).primaryColor,
                                  // color: ColorResources.black,
                                  fontWeight: FontWeight.w400,
                                  height: 0.07.h,
                                ),
                          ),
                        ],
                      ),
                      //SizedBox(width: 10),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 32.h),
              GestureDetector(
                onTap: () {
           //       Navigator.push(context, SlideTransition1(const CodeEntranceScreen()));

                  ShowCustomDialog(
                    context: context,
                    content: StatefulBuilder(
                      builder: (BuildContext context, void Function(void Function()) setStatee) {
                        return Container(
                          height: 550.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius:BorderRadius.circular(16.r) ,
                             border: Border.all(
                               color: themeVm.isDark?Colors.white:Colors.transparent,
                               width: .1
                             )
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(25.sp),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
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
                                  "قم بإدخال الكود",
                                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(height: 15.h),
                                Text(
                                  "كي تتمكن من مشاهده الفيديو ، يجب إدخال الكود. يمكنك الحصول عليه من المعلم",
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
                                    ),
                                    decoration: InputDecoration(
                                      hintText: "ادخل الكود",
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 17.h, horizontal: 24.w),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 24.h),
                                CustomButton(
                                  widgetInCenter: Align(
                                    alignment: Alignment.center,
                                    child: CustomText(
                                      text: "إدخال".i18n(),
                                      textAlign: TextAlign.center,
                                      color: Colors.white,
                                      txtSize: 17.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  color: ColorResources.buttonColor,
                                  onTap: () {
                                    /*
                                    Route route = MaterialPageRoute(
                                        builder: (context) => const PaidLessonScreen());
                                    Navigator.pushReplacement(context, route);

                                     */
                                  },
                                ),
                                SizedBox(height: 4.h),
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
                              ],
                            ),
                          ),
                        );
                      },
                    ),).showCustomDialg();


                },
                child: Container(
                  width: 327.w,
                  height: 200.h,
                  decoration: ShapeDecoration(
                    image: const DecorationImage(
                      image: AssetImage("assets/images/lessonTeacherjpg.jpg"),
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  child: Center(
                    child: Container(
                      height: 36.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.dg),
                        color: ColorResources.red,
                      ),
                      child: Icon(Icons.lock, color: ColorResources.white1),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, SlideTransition1(const ExamsScreen()));
                },
                child: Container(
                  height: 80.h,
                  width: double.infinity,
                  padding: EdgeInsets.all(24.dg),
                  //margin: EdgeInsets.all(24.dg),
                  decoration:BoxDecoration(
                    color: themeVm.isDark?ColorResources.containerColor:Colors.white,
                    borderRadius: BorderRadius.circular(32.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          width: 28.r,
                          height: 28.r,
                          padding: EdgeInsets.only(right: 3.w),
                          decoration: const ShapeDecoration(
                            color: Color(0xFF49423A),
                            shape: OvalBorder(),
                          ),
                          child: SvgPicture.asset(IconResources.arrowleft,color: Colors.white,)
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                           'اختبر نفسك',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              letterSpacing: -0.17.h,
                            ),
                          ),
                          SizedBox(width: 16.w),
                          Container(
                            height: 32.r,
                            width: 32.r,
                            decoration:  BoxDecoration(borderRadius: BorderRadius.circular(10.r),
                              image: const DecorationImage(image: AssetImage(
                                "assets/images/testYourself.png",
                              ),
                              )
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                height: 80.h,
                width: double.infinity,
                padding: EdgeInsets.all(24.dg),
                //margin: EdgeInsets.all(24.dg),
                decoration:BoxDecoration(
                  color: themeVm.isDark?ColorResources.containerColor:Colors.white,
                  borderRadius: BorderRadius.circular(32.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        width: 28.r,
                        height: 28.r,
                        padding: EdgeInsets.only(right: 3.w),
                        decoration: const ShapeDecoration(
                          color: Color(0xFF49423A),
                          shape: OvalBorder(),
                        ),
                        child: SvgPicture.asset(IconResources.arrowleft,color: Colors.white,)
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'الواجب المنزلي',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                            fontSize: 16.sp,
                            //color: Theme.of(context).primaryColor,
                            // color: ColorResources.black,
                            fontWeight: FontWeight.w400,
                            letterSpacing: -0.17.h,
                          ),
                        ),
                        CircleAvatar(
                          radius: 32.r,
                          backgroundImage: const AssetImage(
                            "assets/images/homework.png",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
