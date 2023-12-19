
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_anglish_app/business_logic/view_models/themes_vm/themes_vm.dart';
import 'package:learning_anglish_app/utils/icons/icons.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreen extends StatefulWidget {
  final String videoUrl;

   const VideoScreen(this.videoUrl, {super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late String videoURL;
  late YoutubePlayerController _controller;

  @override
  void initState() {
    videoURL = 'https://www.youtube.com/watch?v=${widget.videoUrl}';
    final videoID = YoutubePlayer.convertUrlToId(videoURL);
    _controller = YoutubePlayerController(
      initialVideoId: videoID!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,controlsVisibleAtStart: true,disableDragSeek: true,
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
     return  YoutubePlayerBuilder(
       player: YoutubePlayer(
         controller: _controller,
         onReady: ()
         {

         },
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
                               color: themeVm.isDark == true
                                   ? Colors.black
                                   : Colors.white, // White background
                               border: Border.all(
                                 color: Colors.grey, // Grey border color
                                 width: 1.0, // Border width
                               ),
                             ),
                             child: Center(
                                 child: SvgPicture.asset(
                                   IconResources.arrowleft,
                                   color: themeVm.isDark == true
                                       ? Colors.white
                                       : Colors.black,
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
                   Container(
                     width: 327.w,
                     height: 200.h,
                     decoration: ShapeDecoration(
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(32),
                       ),
                     ),
                     child: player,
                   ),
                 ],
               ),
             ),
           ),
         );
       },
     );
   }
}
