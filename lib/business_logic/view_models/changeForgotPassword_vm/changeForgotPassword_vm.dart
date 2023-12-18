import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:learning_anglish_app/business_logic/setup/base_notifier.dart';
import 'package:learning_anglish_app/presentation/screens/registration/newPassword_done/newPassword_done.dart';
import 'package:learning_anglish_app/utils/app_constants/app_constants.dart';
import 'package:learning_anglish_app/utils/generalMethods/general_methods.dart';
import 'package:logger/logger.dart';

class ChangeForgotPasswordViewModel extends BaseNotifier {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();
  // TODO: I neeb user id from forgot password code view model
  void changeForgotPassword(
      {required BuildContext context, required String userId}) async {
    Map<String, dynamic> body = {
      "password": newPasswordController.text,
      "confirmPassword": confirmNewPasswordController.text,
      "userId": userId
    };
    setBusy();
    try {
      Response<dynamic> res = await api.changeForgotPassword(body: body);
      General.showToast(message: res.data['errorMessage']);
      // TODO: CJECK THIS CONDITION
      if (res.data['data'] == null) {
        // TODO: CHANGE push TO pushReplacement?
        Navigator.push(context,
            SlideTransition1(NewPasswordDoneScreen()));
      }
    } catch (e) {
      print(e.toString());
      Logger().e(e.toString());
      setError();
    }
    setIdle();
  }
}
