import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learning_anglish_app/data/cache_helper/cache_helper.dart';
import 'package:learning_anglish_app/data/web_services/end_points.dart';
import 'package:learning_anglish_app/utils/app_constants/app_constants.dart';
import 'package:learning_anglish_app/utils/color_resource/color_resources.dart';
class General {

  static Future<void> showToast(
      {required String message, Color? backColor, Color? textColor}) async {
    Fluttertoast.showToast(
        msg: message,

        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,

        webBgColor: "linear-gradient(to right, #000000, #000000)",
        backgroundColor: backColor ?? ColorResources.buttonColor,
        textColor: textColor ?? ColorResources.white1,
        webPosition: "center",
        fontSize: 18.0);
  }


  //***  refresh token */
  static Future<dynamic> refreshToke() async {
    if (AppConstants.token != "") {
      String? _oldtoken = CacheHelper.getData(key:PrefKeys.TOKEN) ?? "";
      debugPrint("=================refresh token start");
      try {
        final Response response = await Dio().post(
          EndPoints.baseURL + EndPoints.REFRESH_TOKEN,
          data: {"token": AppConstants.token, "refreshToken": AppConstants.refreshToken},
        );
        debugPrint("oldToken from refreshToken: $_oldtoken");
        debugPrint(
            "status code from refreshToken =========${response.statusCode}");
        debugPrint(
            "response from refreshToken ============${response.data["token"]}");
        AppConstants.token = response.data["token"];
        AppConstants.refreshToken = response.data["refreshToken"];
        await CacheHelper.SaveData(key:PrefKeys.TOKEN, value: response.data["token"].toString());

        await CacheHelper.SaveData(key:PrefKeys.REFRESH_TOKEN,
            value: response.data["refreshToken"].toString());

        String? newtoken = CacheHelper.getData(key: PrefKeys.TOKEN) ?? "";
        print("newtoken from refreshToken: $newtoken");
      } on DioError catch (error) {
        print(
            "status code from refreshToken =========${error.response!.statusCode}");
        print(
            "response from refreshToken ============${error.response!.data.toString()}");

        print("catch from refreshToken ============$error");
      }
    }
  }



  static bool get isMobile{
    return 1.sw <= 768;
  }

}




