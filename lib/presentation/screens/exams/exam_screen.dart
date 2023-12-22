import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learning_anglish_app/business_logic/view_models/exams_vm/exams_vm.dart';
import 'package:learning_anglish_app/business_logic/view_models/themes_vm/themes_vm.dart';
import 'package:learning_anglish_app/data/models/answers/answers_model.dart';
import 'package:learning_anglish_app/presentation/widgets/exam/exam_widget.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';
import 'package:provider/provider.dart';
/*
class ExamScreen extends StatefulWidget {
  const ExamScreen({super.key});

  @override
  State<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
    @override
  void initState() {
    //final examVM = Provider.of<ExamsViewModel>(context, listen: false);
    //examVM.selectedIndex = 0;
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      context.read<ExamsViewModel>().getExams(13);
    });
    super.initState();
  }

  List<Result> answers = List.empty(growable: true);
  static Set<int> questionId = Set();
  @override
  Widget build(BuildContext context) {
    final themeVm = Provider.of<ThemesViewModel>(context);
    return Consumer<ExamsViewModel>(
      builder: (BuildContext contextt, model, Widget? child) {
        return model.busy == true
            ? Scaffold(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                body: const Center(
                  child: CircularProgressIndicator(),
                ),
              ) //: Text(model.notificationModel!.data.toString());
            : ((model.examModel?.data != null)
                ? ExamWidget(isShowExplanaion: false, model: model, QuestionsWidget: QuestionWidget(), onButtonTapped: (){


                   final examsResult = AnswersModel(
                                        examId: model.examModel!.data!.id,
                                        result: answers,
                                      );
                                      
                                     model.saveExamResult(
                                          context, examsResult);
                }) : Scaffold(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    body: const Center(
                      child: Text("No exams"),
                    ),
                  ));
      },
    );
  }
  
}


class QuestionWidget extends StatefulWidget {
  final int index;
  final Set<int> questionId;
  final List<Result> answers;
  const QuestionWidget({
    super.key,
    required this.index,
    required this.questionId,
    required this.answers,
  });

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  int? groupValue;
  @override
  Widget build(BuildContext context) {
    return Consumer<ExamsViewModel>(
      builder: (BuildContext context, model, Widget? child) {
        return Wrap(
          children: List<Widget>.generate(
            model.examModel!.data!.questions![widget.index].answers!.length,
            (int answerIndex) {
              return InkWell(
                onTap: () {
                  setState(() {
                    groupValue = answerIndex;
                    int questionId =
                        model.examModel!.data!.questions![widget.index].id!;
                    int answerId = model.examModel!.data!
                        .questions![widget.index].answers![answerIndex].id!;

                    bool exists = widget.answers
                        .any((answer) => answer.questionId == questionId);
                    if (exists) {
                      widget.answers[widget.index].changeAnswerId(answerId);
                    } else {
                      widget.questionId.add(questionId);
                      widget.answers.add(
                          Result(questionId: questionId, answerId: answerId));
                    }
                  });
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 5.h),
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: groupValue == answerIndex ? 2 : 1,
                        color: groupValue == answerIndex
                            ? ColorResources.brownDark
                            : ColorResources.grey2,
                      ),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    color: groupValue == answerIndex
                        ? ColorResources.brownLight
                        : Colors.transparent,
                  ),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        model.examModel!.data!.questions![widget.index]
                            .answers![answerIndex].answerBody!,
                        style:
                            Theme.of(context).textTheme.displayMedium?.copyWith(
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                      ),
                      const Spacer(),
                      if (groupValue == answerIndex)
                        FaIcon(
                          FontAwesomeIcons.check,
                          color: ColorResources.brownDark,
                          size: 20.dg,
                        ),
                      /*
                      Radio<int>(
                        activeColor: ColorResources.buttonColor,
                        value: answerIndex,
                        groupValue: groupValue,
                        toggleable: true,
                        */
                    ],
                  ),
                ),
              );
            },
          ).toList(),
        );
      },
    );
  }
}
*/
