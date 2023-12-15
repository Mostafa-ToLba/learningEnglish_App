
import 'package:flutter/material.dart';
import 'package:learning_anglish_app/business_logic/setup/base_notifier.dart';
import 'package:logger/logger.dart';

class RegisterViewModel extends BaseNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController parentPhoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  void register({required BuildContext context}) async {
    Map<String, dynamic> body =   {
      "fullName": nameController.text,
      "email": emailController.text,
      "phoneNumber": phoneController.text,
      "parentPhoneNumber": parentPhoneController.text,
      "password": passwordController.text,
      "confirmPassword": passwordController.text,
      "img": "string"
    };
    setBusy();
    try {
      var res = await api.register(body: body);

    } catch (e) {
      Logger().e(e.toString());
      setError();
    }
    setIdle();
  }
}