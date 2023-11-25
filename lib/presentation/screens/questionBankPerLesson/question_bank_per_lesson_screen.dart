import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';

class QuestionBankPerLessonScreen extends StatefulWidget {
  const QuestionBankPerLessonScreen({super.key});

  @override
  State<QuestionBankPerLessonScreen> createState() =>
      _QuestionBankPerLessonScreenState();
}

class _QuestionBankPerLessonScreenState extends State<QuestionBankPerLessonScreen> {
  int? _value = 1;

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
                            style: TextStyle(
                              color: ColorResources.black,
                              fontSize: 18,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'الحصة الاولى',
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
                    ],
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
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    const Spacer(),
                    //TODO: Customize 
                    Wrap(
                      spacing: 5.0,
                      children: List<Widget>.generate(
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
                      ).toList(),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.white,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Expanded(
                                  child: Text(
                                    '1-  Last year, when I last met her, she told me she  _____ a letter every day for the last two months.  ',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.bookmark),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            const Text('A.  had written'),
                            const Text('B.  has written'),
                            const Text('C.  had been writing'),
                            const Text('D.  wrote'),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Expanded(
                                  child: Text(
                                    '1-  Last year, when I last met her, she told me she  _____ a letter every day for the last two months.  ',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.bookmark),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            const Text('A.  had written'),
                            const Text('B.  has written'),
                            const Text('C.  had been writing'),
                            const Text('D.  wrote'),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Expanded(
                                  child: Text(
                                    '1-  Last year, when I last met her, she told me she  _____ a letter every day for the last two months.  ',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.bookmark),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            const Text('A.  had written'),
                            const Text('B.  has written'),
                            const Text('C.  had been writing'),
                            const Text('D.  wrote'),
                          ],
                        ),
                      ),
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
