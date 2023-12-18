import 'package:dio/dio.dart';
import 'package:learning_anglish_app/business_logic/setup/base_notifier.dart';
import 'package:learning_anglish_app/data/models/notification/notification_model.dart';
import 'package:learning_anglish_app/data/models/unit/unit_model.dart';
import 'package:learning_anglish_app/utils/generalMethods/general_methods.dart';
import 'package:logger/logger.dart';

class UnitsViewModel extends BaseNotifier {
  UnitModel? unitModel;

  void getNotification() async {
    setBusy();
    try {
      Response<dynamic> res = await api.notifications();
      General.showToast(message: res.data['errorMessage']);
      /*
      if (res.data['errorCode'] == 0) {
        unitModel = res.data;
      }
      */
      unitModel = res.data;
    } catch (e) {
      Logger().e(e.toString());
      setError();
    }
    setIdle();
  }
}
