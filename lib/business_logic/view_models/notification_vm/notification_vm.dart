//notification_vm

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:learning_anglish_app/business_logic/setup/base_notifier.dart';
import 'package:learning_anglish_app/models/notification_model.dart';
import 'package:learning_anglish_app/utils/generalMethods/general_methods.dart';
import 'package:logger/logger.dart';

class NotificationViewModel extends BaseNotifier {
  NotificationModel? notificationModel;

  void getNotification() async {
    setBusy();
    try {
      Response<dynamic> res = await api.notifications();
      General.showToast(message: res.data['errorMessage']);
      /*
      if (res.data['errorCode'] == 0) {
        notificationModel = res.data;
      }
      */
      notificationModel = res.data;
    } catch (e) {
      Logger().e(e.toString());
      setError();
    }
    setIdle();
  }
}
