

 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:learning_anglish_app/presentation/widgets/button/custom_button.dart';
import 'package:learning_anglish_app/utils/app_constants/app_constants.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';


class ChooseClass extends StatefulWidget {
   const ChooseClass({super.key});

  @override
  State<ChooseClass> createState() => _ChooseClassState();
}

class _ChooseClassState extends State<ChooseClass> {
  int selectedIndex = 0;
  List<String> classList = ['الصف الأول الثانوي','الصف الثاني الثانوي','الصف الثالث الثانوي'];
   @override
   Widget build(BuildContext context) {
     return   Scaffold(
       backgroundColor:HexColor('#f7f7f7'),
        body: SafeArea(child:
        Padding(
          padding: EdgeInsets.only(top: 25.h),
          child:  Column(
            children:
            [
              Padding(
                padding: EdgeInsets.only(left: 24.w,right: 24.w),
                child: Row(
                  children:
                  [
                    CircleAvatar(
                      radius: 20.r,
                      backgroundImage: const NetworkImage('https://images.unsplash.com/photo-1508184964240-ee96bb9677a7?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                    ),
                    SizedBox(width: 12.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                      [
                        Text('أهلا بك',style: TextStyle(fontSize: 14.sp,fontFamily: AppConstants.arabicFont1,color: ColorResources.appGreyColor,fontWeight: FontWeight.w500),),
                        Text('Mostafa Mahmoud',style: TextStyle(fontSize: 16.sp,fontFamily: AppConstants.arabicFont1,fontWeight: FontWeight.bold),),
                      ],
                    ),
                    const Spacer(),
                    IconButton(onPressed: (){}, icon: Icon(Icons.menu,color: Colors.black,size: 30.h,)),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(56.r),topRight: Radius.circular(56.r))),
                height: 656.h,
                width: 1.sw,
                padding: EdgeInsets.only(top: 34.h,right: 24.w,left:24.w ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  [
                    Text('اختر الصف',style: TextStyle(fontSize: 16.sp,fontFamily: AppConstants.arabicFont1,color: ColorResources.black,fontWeight: FontWeight.w500),),
                    SizedBox(height: 40.h),
                    Container(
                      height: 220.h,
                      child: ListView.separated(
                          itemBuilder: (context,index)=>InkWell(
                              onTap: ()
                              {
                                setState(() {
                                  selectedIndex=index;
                                });
                                print(selectedIndex);
                              },
                              child: AnimationConfiguration.staggeredList(
                                position: index,
                                delay: const Duration(milliseconds: 100),
                                child: SlideAnimation(
                                  duration: const Duration(milliseconds: 2500),
                                  curve: Curves.fastLinearToSlowEaseIn,

                                  child: FadeInAnimation(
                                      curve: Curves.fastLinearToSlowEaseIn,
                                      duration: const Duration(milliseconds: 2500),
                                      child: Class(classList[index],isChosen: selectedIndex==index)),
                                ),
                              )),
                          separatorBuilder: (context,index)=>SizedBox(height: 16.h),
                          itemCount: 3),
                    ),
                    SizedBox(height: 25.h),
                    CustomButton(text: 'اختيار                ',color: ColorResources.buttonColor,colorTxt: Colors.white,
                      onTap: ()
                      {
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        )),
     );
   }
}

 Widget Class(classList ,{bool isChosen=false})=> Container(
   height: 56.h,
   width: 1.sw,
   padding: EdgeInsets.only(right: 24.w,left:24.w),
   decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(30.r),
       border: Border.all(color: isChosen?Colors.green:Colors.black,width: isChosen?2.w:.3.w,)),
   child: Row(
     crossAxisAlignment:CrossAxisAlignment.center,
     children:
     [
       Text(classList,style: TextStyle(fontSize: 16.sp,fontFamily: AppConstants.arabicFont1,color: ColorResources.black,fontWeight: FontWeight.w500),),
       const Spacer(),
       Container(
         height: 24.h,
         width: 24.w,
         decoration: BoxDecoration(shape: BoxShape.circle,border: Border.all(color: isChosen?Colors.green:Colors.black,width: 1.w)),
         child: Icon(Icons.check,size: 15.h,color:isChosen?Colors.green:Colors.black),
       )
     ],
   ),
 );