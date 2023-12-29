
 import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:learning_anglish_app/business_logic/view_models/exams_vm/exams_vm.dart';
import 'package:learning_anglish_app/business_logic/view_models/home_vm/home_vm.dart';
import 'package:learning_anglish_app/utils/generalMethods/general_methods.dart';
import 'package:provider/provider.dart';

class ChooseExamScreen extends StatefulWidget {
  final int lessonId;
  final int unitId;
   const ChooseExamScreen(this.lessonId, this.unitId, {super.key});

   @override
   State<ChooseExamScreen> createState() => _ChooseExamScreenState();
 }

 class _ChooseExamScreenState extends State<ChooseExamScreen> {

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      final homeVm = Provider.of<HomeViewModel>(context,listen: false);
      context.read<HomeViewModel>().checkExamsByLessonn(widget.lessonId);
      context.read<HomeViewModel>().checkExamsByExamTypee(context, ExamType.exam);
      if (homeVm.examId != null) {
        // context.read<ExamsViewModel>().getExams(homeVm.examId!);
        context.read<ExamsViewModel>().isStudentTookExam(context, homeVm.examId!);
      } else {
        General.showToast(
            message:
            "No ${examTypeForToast.values.elementAt(ExamType.exam.index)} for this lesson yet");
      }
    });
    super.initState();
  }
   @override
   Widget build(BuildContext context) {
     return const Scaffold(
       body: Center(child: CircularProgressIndicator()),
     );
   }
 }
