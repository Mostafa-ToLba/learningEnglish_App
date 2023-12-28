
import 'package:dio/dio.dart';
import 'package:learning_anglish_app/business_logic/setup/base_notifier.dart';
import 'package:learning_anglish_app/data/models/studentExams/student_exams_model.dart';
import 'package:logger/logger.dart';

class StudentExamsViewModel extends BaseNotifier {
  StudentExamsModel? studentExamsModel;
  void getStudentExams() async {
    setBusy();
    try {
      Response<dynamic> res = await api.getStudentExams();
      if(res.data['errorCode']==0)
      {
        studentExamsModel = StudentExamsModel.fromJson(res.data);
      }

    } catch (e) {
      print(e.toString());
      Logger().e(e.toString());
      setError();
    }
    setIdle();
  }

  getPercentage({degree,score})
  {
    double percentage = (degree / score) * 100; // Calculate percentage

// Cap the maximum value at 100% (1.0 in LinearPercentIndicator)
    percentage = percentage > 100 ? 100 : percentage;

    double percentValue = percentage / 100;
    return percentValue;
  }
}
