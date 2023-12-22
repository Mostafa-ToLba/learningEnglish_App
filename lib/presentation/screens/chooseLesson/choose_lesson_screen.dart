import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learning_anglish_app/business_logic/view_models/home_vm/home_vm.dart';
import 'package:learning_anglish_app/business_logic/view_models/themes_vm/themes_vm.dart';
import 'package:learning_anglish_app/data/models/lessons/lessons.dart';
import 'package:learning_anglish_app/presentation/screens/lesson/unpaid_lesson_screen.dart';
import 'package:learning_anglish_app/utils/app_constants/app_constants.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';
import 'package:learning_anglish_app/utils/icons/icons.dart';
import 'package:provider/provider.dart';

class ChooseLessonScreen extends StatefulWidget {
  final int id;
  const ChooseLessonScreen(this.id, {super.key});
  @override
  State<ChooseLessonScreen> createState() => _ChooseLessonScreenState();
}

class _ChooseLessonScreenState extends State<ChooseLessonScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      context.read<HomeViewModel>().getLessons(unitId:widget.id);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final homeVm = Provider.of<HomeViewModel>(context);
    final themVm = Provider.of<ThemesViewModel>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: homeVm.lessonsModel==null?const Center(child: CircularProgressIndicator()):
        homeVm.lessonsModel!.data.isEmpty?const Center(child: Text('لا يوجد حصص')):Padding(
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
                          color: themVm.isDark == true
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
                          height: 25.h,
                          color: Theme.of(context).indicatorColor,
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
                            homeVm.lessonsModel?.data[0].unitName??'',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            'Getting away',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  fontSize: 16.sp,
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
              SizedBox(
                height: 34.h,
              ),
              Expanded(
                child: ListView.separated
                  (itemBuilder: (context,index)=> LessonWidget(index,homeVm.colors,homeVm.lessonsModel!.data[index],widget.id),
                    separatorBuilder: (context,index)=>SizedBox(height: 10.h),
                    itemCount:homeVm.lessonsModel!.data.length)
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LessonWidget extends StatelessWidget {
  final int index;
  final List<Color> colors;
  final Lesson data;
  final int unitId;

  const LessonWidget(this.index, this.colors, this.data, this.unitId, {super.key});

  @override
  Widget build(BuildContext context) {
    final themVm = Provider.of<ThemesViewModel>(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            SlideTransition1(UnpaidLessonScreen(data.studentOwnIt,data.unitName,data.name,
            data.videoUrl,data.id,unitId)));
      },
      child: Container(
        height: 90.h,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: ColorResources.shadow,
              blurRadius: 10.r,
              offset: const Offset(
                0,
                8,
              ),
              spreadRadius: -8,
            )
          ],
          color: themVm.isDark == true
              ? ColorResources.containerColor
              : Colors.white,
          borderRadius: BorderRadius.circular(32.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 24.w,
              height: 24.h,
              margin: EdgeInsets.only(left: 24.w),
              decoration: const ShapeDecoration(
                color: Color(0xFF49423A),
                shape: OvalBorder(),
              ),
              child: Icon(
                Icons.keyboard_arrow_left,
                color: Colors.white,
                size: 20.dm,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      data.name??'',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 5.h,),
                    Text(
                      'الوحده : ${data.unitName}',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 5.h,),
                    Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(radius: 5.r,backgroundColor: data.studentOwnIt!?Colors.green:Colors.red,),
                        SizedBox(width: 10.w,),
                        Text(
                          data.studentOwnIt! ?'الحصة مفتوحة':'لم يتم شرائها',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: 12.w),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(
                      Icons.folder,
                      color: index < colors.length
                          ? colors[index]
                          : Colors.black,
                      size: 30.dm,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 7.h),
                      child: Text(
                        '${index + 1}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.sp),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 20.w),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

