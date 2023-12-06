import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_anglish_app/presentation/screens/codeEntrance/code_entrance_screen.dart';
import 'package:learning_anglish_app/presentation/screens/exams/exams_screen.dart';
import 'package:learning_anglish_app/utils/app_constants/app_constants.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';
import 'package:learning_anglish_app/utils/icons/icons.dart';
import 'package:localization/localization.dart';
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
    return Scaffold(
      backgroundColor: ColorResources.grey5,
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
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'الوحدة الأولى',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: ColorResources.black,
                              fontSize: 18,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            'Getting away',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: ColorResources.primary,
                              fontSize: 16,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              height: 0.07,
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
                  Navigator.push(
                      context, SlideTransition1(const CodeEntranceScreen()));
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
              SizedBox(height: 16.h),
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
                  decoration: ShapeDecoration(
                    color: ColorResources.white1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.r),
                    ),
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
                            "test_yourself".i18n(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: ColorResources.black,
                              fontSize: 16,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              letterSpacing: -0.17,
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
              SizedBox(height: 16.h),
              Container(
                height: 80.h,
                width: double.infinity,
                padding: EdgeInsets.all(24.dg),
                //margin: EdgeInsets.all(24.dg),
                decoration: ShapeDecoration(
                  color: ColorResources.white1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.r),
                  ),
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
                          "homework".i18n(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: ColorResources.black,
                            fontSize: 16,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            letterSpacing: -0.17,
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Container(
                          height: 32.r,
                          width: 32.r,
                          decoration:  BoxDecoration(borderRadius: BorderRadius.circular(10.r),
                              image: const DecorationImage(image: AssetImage(
                                "assets/images/homework.png",
                              ),
                              )
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
