import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';
import 'package:localization/localization.dart';

class QuestionBankPerLessonScreen extends StatefulWidget {
  const QuestionBankPerLessonScreen({super.key});

  @override
  State<QuestionBankPerLessonScreen> createState() =>
      _QuestionBankPerLessonScreenState();
}

class _QuestionBankPerLessonScreenState
    extends State<QuestionBankPerLessonScreen> {
  int? _value = 1;

  @override
  Widget build(BuildContext context) {
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
                                  // color: ColorResources.black,
                                  fontWeight: FontWeight.w400, height: 0.07.h,
                                ),
                          ),
                        ],
                      ),
                      //SizedBox(width: 10),
                    ],
                  ),
                
                  Container(
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

              /*
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const FaIcon(
                        FontAwesomeIcons.circleChevronLeft,
                        color: Colors.brown,
                      ), //circle_chevron_left
                    ),
                    const Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('الوحدة الأولى'),
                            Text('Getting away'),
                          ],
                        ),
                        //SizedBox(width: 10),
                      ],
                    ),
                  ],
                ),
              ),
              */
              SizedBox(height: 32.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 32.w),
                //margin: EdgeInsets.symmetric(horizontal: 6.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(56.r),
                    topRight: Radius.circular(56.r),
                  ),
                ),
                child: Row(
                  children: [
                    const Spacer(),
                    Wrap(
                      //spacing: 16.w,
                      children: List<Widget>.generate(
                        2,
                        (int index) {
                          final list = ["all_questions", "marked_questions"];
                          return ChoiceChip(
                            label: Text(
                              list.elementAt(index).i18n(),
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                    fontSize: 14.sp,
                                    /*
                                    color: _value == index
                                        ? ColorResources.white1
                                        : Theme.of(context).primaryColor
                                            .withOpacity(0.75),
                                    */
                                    // color: ColorResources.black,
                                    fontWeight: FontWeight.w400, height: 0.09.h,
                                  ),
                            ),
                            backgroundColor: _value == index
                                ? ColorResources.brownDark
                                : Theme.of(context).primaryColor,
                            selected: _value == index,
                            onSelected: (bool selected) {
                              setState(() {
                                _value = selected ? index : null;
                              });
                            },
                          );
                        },
                      ).toList(),
                      /*/
                      children: List<Widget>.from(
                          ["all_questions", "marked_questions"]).toList(),
(
                        3,
                        (int index) {
                          return ChoiceChip(
                            label: Text('Item $index'),
                            selected: _value == index,
                            onSelected: (bool selected) {
                              setState(() {
                                _value = selected ? index : null;
                              });
                            },
                          );
                        },
                          */
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(right: 24.w, left: 24.w),
                  //margin: EdgeInsets.symmetric(horizontal: 6.w),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      
                      SizedBox(height: 40.h),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.bookmark,
                                  size: 24.dm,
                                  //color: ColorResources.black,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '1- Last year, when I last met her, she told me she  _____ a letter every day for the last two months.  ',
                                  textAlign: TextAlign.left,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
                                        fontSize: 16.sp,
                                        // color: ColorResources.black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'A. had written',
                            textAlign: TextAlign.left,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  fontSize: 16.sp,
                                  // color: ColorResources.black,
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                          Text(
                            'B. has written',
                            textAlign: TextAlign.left,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  fontSize: 16.sp,
                                  color: ColorResources.greenDark,
                                  // color: ColorResources.black,
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                          Text(
                            'C. wrote',
                            textAlign: TextAlign.left,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  fontSize: 16.sp,
                                  color: ColorResources.redDark,
                                  // color: ColorResources.black,
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                          Text(
                            'D. had been writing',
                            textAlign: TextAlign.left,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  fontSize: 16.sp,
                                  // color: ColorResources.black,
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                        ],
                      ),
                      SizedBox(height: 40.h),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
