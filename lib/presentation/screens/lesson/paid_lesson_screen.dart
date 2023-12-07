import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_anglish_app/presentation/screens/exams/exams_screen.dart';
import 'package:learning_anglish_app/utils/app_constants/app_constants.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';
import 'package:localization/localization.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PaidLessonScreen extends StatefulWidget {
  const PaidLessonScreen({super.key});

  @override
  State<PaidLessonScreen> createState() => _PaidLessonScreenState();
}

class _PaidLessonScreenState extends State<PaidLessonScreen> {
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
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
      ),
      builder: (context, player) {
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
                  Container(
                    width: 40.w,
                    height: 40.h,
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
                        //color: ColorResources.brownDark,
                        size: 20.dg,
                      ), //circle_chevron_left
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32.h),
              Container(
                    width: 327.w,
                    height: 200.h,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                    child: player,
                  ),SizedBox(height: 16.h),
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
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.r),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                       Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 32.r,
                            backgroundImage: const AssetImage(
                              "assets/images/testYourself.png",
                            ),
                          ),
                          Text(
                            "test_yourself".i18n(),
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
                          
                        ],
                      ),
                    
                      Container(
                        width: 26.w,
                        height: 26.h,
                        decoration: ShapeDecoration(
                          color: ColorResources.buttonColor,
                          shape: const OvalBorder(),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.arrow_back_ios_new_outlined,
                            size: 16.dm,
                          ),
                        ),
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
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.r),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                     Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 32.r,
                          backgroundImage: const AssetImage(
                            "assets/images/homework.png",
                          ),
                        ),
                        Text(
                          "homework".i18n(),
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
                        
                      ],
                    ),
                  
                    Container(
                      width: 26.w,
                      height: 26.h,
                      decoration: ShapeDecoration(
                        color: ColorResources
                            .buttonColor, // TODO: Check this color
                        shape: const OvalBorder(),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.arrow_back_ios_new_outlined,
                          size: 16.dm,
                        ),
                      ),
                    ),
                   ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    /*
  Scaffold(
          backgroundColor: ColorResources.grey5,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 25.h, left: 24.w, right: 24.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              color: Colors.black.withOpacity(0.25),
                            ),
                            borderRadius: BorderRadius.circular(32),
                          ),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_back_ios_new_outlined,
                            color: Colors.brown,
                          ), //circle_chevron_left
                        ),
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'الوحدة الاولى : Getting away',
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(
                                      fontSize: 18.sp,
                                      color: ColorResources.red,
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                              Text(
                                'الحصة الاولى',
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(
                                      fontSize: 16.sp,
                                      //color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.w400,
                                      height: 0.07.h,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 32.h),
                  
                  SizedBox(height: 16.h),
                  Container(
                    width: 327.w,
                    height: 80.h,
                    clipBehavior: Clip.antiAlias,
                    margin: EdgeInsets.all(24.dg),
                    decoration: ShapeDecoration(
                      color: ColorResources.white1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: Colors.brown,
                          ),
                          child: const Icon(
                            Icons.keyboard_arrow_left,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          width: 24.w,
                          height: 24.h,
                          decoration: ShapeDecoration(
                            color: ColorResources
                                .buttonColor, // TODO: Check this color
                            shape: const OvalBorder(),
                          ),
                          child: const Center(
                            child: Icon(Icons.arrow_back_ios_new_outlined),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "test_yourself".i18n(),
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
                                    letterSpacing: -0.17.h,
                                  ),
                            ),
                            CircleAvatar(
                              radius: 32.r,
                              backgroundImage: const AssetImage(
                                "assets/images/testYourself.png",
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Container(
                    width: 327.w,
                    height: 80.h,
                    clipBehavior: Clip.antiAlias,
                    margin: EdgeInsets.all(24.dg),
                    decoration: ShapeDecoration(
                      color: ColorResources.white1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: Colors.brown,
                          ),
                          child: const Icon(
                            Icons.keyboard_arrow_left,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          width: 24.w,
                          height: 24.h,
                          decoration: ShapeDecoration(
                            color: ColorResources
                                .buttonColor, // TODO: Check this color
                            shape: const OvalBorder(),
                          ),
                          child: const Center(
                            child: Icon(Icons.arrow_back_ios_new_outlined),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "homework".i18n(),
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
        */
      },
    );

  }
}
