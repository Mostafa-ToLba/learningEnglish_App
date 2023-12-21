import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:learning_anglish_app/business_logic/setup/base_notifier.dart';
import 'package:learning_anglish_app/presentation/screens/registration/create_new_password/create_new_password.dart';
import 'package:learning_anglish_app/presentation/screens/registration/forget_password_code/forget_password_code.dart';
import 'package:learning_anglish_app/presentation/screens/registration/newPassword_done/newPassword_done.dart';
import 'package:learning_anglish_app/utils/app_constants/app_constants.dart';
import 'package:learning_anglish_app/utils/generalMethods/general_methods.dart';
import 'package:logger/logger.dart';

class ForgetPasswordViewModel extends BaseNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController codeControler = TextEditingController();

  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    codeControler.dispose();
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
    super.dispose();
  }

  void forgetPassword({required BuildContext context}) async {
    Map<String, dynamic> body = {
      "email": emailController.text,
    };
    setBusy();
    try {
      Response<dynamic> res = await api.forgetPassword(body: body);
      General.showToast(message: res.data['errorMessage']);
      if (res.data['data'] == null) {
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

  void forgetPasswordCode(
      {required BuildContext context, required String email}) async {
    Map<String, dynamic> body = {
      "randomCode": codeControler.text,
      "email": email
    };
    setBusy();
    try {
      Response<dynamic> res = await api.forgetPasswordCode(body: body);
      General.showToast(message: res.data['errorMessage']);
      if (res.data['data'] == null) {
        final String userId = res.data['data']['userId'];
        // TODO: CHANGE push TO pushReplacement?
        Navigator.push(
            context, SlideTransition1(CreateNewPassword(userId: userId)));
      }
    } catch (e) {
      print(e.toString());
      Logger().e(e.toString());
      setError();
    }
    setIdle();
  }

  // TODO: Check response body
  void resendEmail(
      {required BuildContext context}) async {
        
    Map<String, dynamic> body = {"email": emailController.text};
    setBusy();
    try {
      Response<dynamic> res = await api.resendEmail(body: body);
      General.showToast(message: res.data['errorMessage']);
    } catch (e) {
      print(e.toString());
      Logger().e(e.toString());
      setError();
    }
    setIdle();
  }

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
        Navigator.pushReplacement(
            context, SlideTransition1(NewPasswordDoneScreen()));
      }
    } catch (e) {
      print(e.toString());
      Logger().e(e.toString());
      setError();
    }
    setIdle();
  }
}
