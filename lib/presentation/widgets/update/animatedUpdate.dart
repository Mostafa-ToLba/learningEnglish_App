

 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class AnimatedUpdate extends StatefulWidget {
  final String updatedMassage ;
    AnimatedUpdate({super.key, this.updatedMassage=''});

  @override
  State<AnimatedUpdate> createState() => _AnimatedUpdateState();
}

class _AnimatedUpdateState extends State<AnimatedUpdate> {
   @override
   Widget build(BuildContext context) {

     return Container(
       padding:  EdgeInsets.symmetric(vertical: 40.h),
       height: 350.h,
       width: 250.w,
       child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           SizedBox(
             height: 230.h,
             width:  230.w,
             child: Lottie.asset('assets/animations/update2.json',fit: BoxFit.fill),
           ),
           Center(child: Text(widget.updatedMassage,style:TextStyle(color:Colors.blueGrey,fontSize:13.sp,fontWeight: FontWeight.bold))),
         ],
       ),
     );
   }
}
