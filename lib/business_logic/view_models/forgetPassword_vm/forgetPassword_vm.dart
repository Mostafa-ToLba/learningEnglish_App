
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:learning_anglish_app/business_logic/setup/base_notifier.dart';
import 'package:learning_anglish_app/presentation/screens/registration/forget_password_code/forget_password_code.dart';
import 'package:learning_anglish_app/utils/app_constants/app_constants.dart';
import 'package:learning_anglish_app/utils/generalMethods/general_methods.dart';
import 'package:logger/logger.dart';

class ForgetPasswordViewModel extends BaseNotifier
{
  TextEditingController emailController = TextEditingController();

  void forgetPassword({required BuildContext context}) async {
    Map<String, dynamic> body = {
      "email": emailController.text,
    };
    setBusy();
    try {
      Response<dynamic> res= await api.forgetPassword(body: body);
      General.showToast(message: res.data['errorMessage']);
      if(res.data['data']==null)
      {
        Navigator.push(context,
            SlideTransition1(ForgetPasswordCode(email: emailController.text)));
      }
    } catch (e) {
      print(e.toString());
      Logger().e(e.toString());
      setError();
    }
    setIdle();
  }
}