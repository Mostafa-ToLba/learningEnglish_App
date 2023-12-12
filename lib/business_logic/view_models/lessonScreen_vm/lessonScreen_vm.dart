
import 'package:flutter/cupertino.dart';
import 'package:learning_anglish_app/business_logic/setup/base_notifier.dart';

class LessonScreenViewModel extends BaseNotifier {

  int lessonCode = 0;
  bool codeDone =false;
  TextEditingController lessonCodeController = TextEditingController();

  showVideo()
  {
    if(lessonCodeController.text=='12345')
    {
      codeDone = true;
    }
    else
    {
      codeDone =false;
    }
        notifyListeners();
  }
}