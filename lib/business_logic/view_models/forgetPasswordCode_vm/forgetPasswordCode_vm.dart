
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:learning_anglish_app/business_logic/setup/base_notifier.dart';
import 'package:learning_anglish_app/presentation/screens/registration/create_new_password/create_new_password.dart';
import 'package:learning_anglish_app/utils/app_constants/app_constants.dart';
import 'package:learning_anglish_app/utils/generalMethods/general_methods.dart';
import 'package:logger/logger.dart';

class ForgetPasswordCodeViewModel extends BaseNotifier
{
  TextEditingController codeControler = TextEditingController();

  void forgetPasswordCode({required BuildContext context, required String email}) async {
    Map<String, dynamic> body = {
      "randomCode": codeControler.text,
      "email": email
    };
    setBusy();
    try {
      Response<dynamic> res= await api.forgetPasswordCode(body: body);
      General.showToast(message: res.data['errorMessage']);
      if(res.data['data']==null)
      {
        final String userId = res.data['data']['userId'];
        // TODO: CHANGE push TO pushReplacement?
        Navigator.push(context,
            SlideTransition1(CreateNewPassword(userId: userId)));
      }
    } catch (e) {
      print(e.toString());
      Logger().e(e.toString());
      setError();
    }
    setIdle();
  }
  // TODO: Check response body
   void resendEmail({required BuildContext context, required String email}) async {
    Map<String, dynamic> body = {
      "email": email
    };
    setBusy();
    try {
      Response<dynamic> res= await api.resendEmail(body: body);
      General.showToast(message: res.data['errorMessage']);
    } catch (e) {
      print(e.toString());
      Logger().e(e.toString());
      setError();
    }
    setIdle();
  }
}