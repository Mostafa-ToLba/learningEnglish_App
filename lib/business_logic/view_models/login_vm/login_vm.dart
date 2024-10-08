import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:learning_anglish_app/business_logic/setup/base_notifier.dart';
import 'package:learning_anglish_app/data/cache_helper/cache_helper.dart';
import 'package:learning_anglish_app/presentation/screens/chooseClass/choose_class_screen.dart';
import 'package:learning_anglish_app/utils/app_constants/app_constants.dart';
import 'package:learning_anglish_app/utils/generalMethods/general_methods.dart';
import 'package:logger/logger.dart';

class LoginViewModel extends BaseNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login({required BuildContext context}) async {
    Map<String, dynamic> body = {
      "email": emailController.text,
      "password": passwordController.text,
      "isPersist": true,
      "returnUrl": "string"
    };
    setBusy();
    try {
      Response<dynamic> res = await api.login(body: body);
      General.showToast(message: res.data['errorMessage']);
      if (res.data['errorCode']== 0) {
        AppConstants.token = res.data['data']['token'];
        final String userName = res.data['data']['fullName'];
        CacheHelper.SaveData(key: PrefKeys.TOKEN, value: AppConstants.token);
        Navigator.pushReplacement(
            context, SlideTransition1(ChooseClassScreen(userName)));
      }
      else
      {
        General.showToast(message: res.data['errorMessage']);
      }
    } catch (e) {
      Logger().e(e.toString());
      setError();
    }
    setIdle();
  }
  bool obscure = false;
  changeObscureText()
  {
    obscure = !obscure;
    notifyListeners();
  }
}
