import 'package:dio/dio.dart';
import 'package:learning_anglish_app/business_logic/setup/base_notifier.dart';
import 'package:learning_anglish_app/data/models/notification/notification_model.dart';
import 'package:logger/logger.dart';

class NotificationViewModel extends BaseNotifier {
  NotificationModel? notificationModel;
  void getNotification() async {
    setBusy();
    try {
      Response<dynamic> res = await api.notifications();
      notificationModel = NotificationModel.fromJson(res.data);
    } catch (e) {
      Logger().e(e.toString());
      setError();
    }
    setIdle();
  }
}
