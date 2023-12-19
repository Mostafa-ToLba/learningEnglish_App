import 'package:dio/dio.dart';
import 'package:learning_anglish_app/business_logic/setup/base_notifier.dart';
import 'package:learning_anglish_app/data/models/units/units_model.dart';
import 'package:learning_anglish_app/utils/generalMethods/general_methods.dart';
import 'package:logger/logger.dart';

class HomeViewModel extends BaseNotifier {
  UnitModel? unitModel;
  void getUnits({levelId}) async {
    setBusy();
    try {
      Response<dynamic> res = await api.units(levelId: levelId);
      unitModel = UnitModel.fromJson(res.data);
    } catch (e) {
      print(e.toString());
      Logger().e(e.toString());
      setError();
    }
    setIdle();
  }
}
