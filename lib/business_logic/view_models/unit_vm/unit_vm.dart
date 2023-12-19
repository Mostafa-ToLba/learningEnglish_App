import 'package:dio/dio.dart';
import 'package:learning_anglish_app/business_logic/setup/base_notifier.dart';
import 'package:learning_anglish_app/data/models/unit/unit_model.dart';
import 'package:learning_anglish_app/utils/generalMethods/general_methods.dart';
import 'package:logger/logger.dart';

class UnitViewModel extends BaseNotifier {
  UnitModel? unitModel;

  void getUnits(String unitId) async {
    Map<String, dynamic> body = {"id": int.parse(unitId)};
    setBusy();
    try {
      Response<dynamic> res = await api.units(body: body);
      General.showToast(message: res.data['errorMessage']);
      unitModel = UnitModel.fromJson(res.data);
    } catch (e) {
      print(e.toString());
      Logger().e(e.toString());
      setError();
    }
    setIdle();
  }
}
