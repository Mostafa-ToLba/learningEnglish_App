
 import 'package:flutter/material.dart';
import 'package:learning_anglish_app/business_logic/view_models/exams_vm/exams_vm.dart';
import 'package:learning_anglish_app/business_logic/view_models/home_vm/home_vm.dart';
import 'package:learning_anglish_app/utils/generalMethods/general_methods.dart';
import 'package:provider/provider.dart';

class ChooseExamScreen extends StatefulWidget {
  final int lessonId;

   const ChooseExamScreen(this.lessonId, {super.key});

   @override
   State<ChooseExamScreen> createState() => _ChooseExamScreenState();
 }

 class _ChooseExamScreenState extends State<ChooseExamScreen> {

  @override
  void initState() {
    final homeVm = Provider.of<HomeViewModel>(context,listen: false);
    homeVm.checkExamsByLesson(widget.lessonId);
    homeVm.checkExamsByExamType(context, ExamType.exam);
    if (homeVm.examId != null) {
      // context.read<ExamsViewModel>().getExams(homeVm.examId!);
      context.read<ExamsViewModel>().isStudentTookExam(context, homeVm.examId!);
    } else {
      General.showToast(
          message:
          "No ${examTypeForToast.values.elementAt(ExamType.exam.index)} for this lesson yet");
    }
    super.initState();
  }
   @override
   Widget build(BuildContext context) {
     return const Scaffold(
       body: Center(child: CircularProgressIndicator()),
     );
   }
 }
