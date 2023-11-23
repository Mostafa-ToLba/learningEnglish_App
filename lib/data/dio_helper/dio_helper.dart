import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:learning_anglish_app/data/local_storage/cache_helper/cache_helper.dart';
import '../../../utils/app_constants/app_constants.dart';
import '../../../utils/color_resource/color_resources.dart';

class DioHelper{
  static Dio? dio;
  static init(){
    dio=Dio(
        BaseOptions(
          baseUrl: AppConstants.baseUrl,
          receiveDataWhenStatusError: true,
        )
    );
  }

  static Future<dynamic> getData(
      {required String url, Map<String, dynamic>? query , String? token , data})async{
   try {
      init();
      Response? response = await dio?.get(url+token!,
          queryParameters: query,
          data: data,
          options: Options(headers: {
            'Authorization': 'Bearer $token',
          }));
      if (response?.statusCode == 200) {
        print('Get Data Success');
        print(response);


        return response;
      }

      else {
        print(response);
        return ("Get Data Failed");
      }
    } on DioError catch (e){
     print('GEt Data ERROR ::: ${e.toString()}');
     print(e.response?.statusMessage);
     bool result = await InternetConnectionChecker().hasConnection;
     if(result == false) {
       Fluttertoast.showToast(
         msg: "no internet connection",
         toastLength: Toast.LENGTH_SHORT,
         gravity: ToastGravity.SNACKBAR,
         timeInSecForIosWeb: 1,
         backgroundColor: ColorResources.black,
         textColor: ColorResources.white,
         fontSize: 18.0,
       );
     }

     else if(e.response?.statusCode == 401||e.response?.statusCode == 404){
       print(e.response?.statusCode);
       print(e.response);
       print('response?.statusCode == 401');
       Fluttertoast.showToast(
         msg: "invalid user",
         toastLength: Toast.LENGTH_SHORT,
         gravity: ToastGravity.SNACKBAR,
         timeInSecForIosWeb: 1,
         backgroundColor: ColorResources.black,
         textColor: ColorResources.white,
         fontSize: 18.0,
       );

       CacheHelper.removeData('token');
       // MagicRouter.navigateAndPopAll(LoginScreen());
     }
     else {
       Fluttertoast.showToast(
         msg: "invalid credential",
         toastLength: Toast.LENGTH_SHORT,
         gravity: ToastGravity.SNACKBAR,
         timeInSecForIosWeb: 1,
         backgroundColor: ColorResources.black,
         textColor: ColorResources.white,
         fontSize: 18.0,
       );
     }
   }
  }

  static Future<dynamic> postData(
      {required String url , required Map<String , dynamic> data , required String token}
      )async{
    try{
      init();
      Response response= await Dio().post(
          url+token,
          data: data,
          options: Options(headers: {
            // 'Content-Type': 'application/x-www-form-urlencoded',
            'Cookie':'OpenIdConnect.nonce.S88qwWwOQp%2F3TqKJ0Nepxv5bu7H7Z440Zlf6jGWl4xA%3D=QVFBQUFOQ01uZDhCRmRFUmpIb0F3RV9DbC1zQkFBQUF2X05OTDdlbElVT21fbEpEWVdfR2hBQUFBQUFDQUFBQUFBQVFaZ0FBQUFFQUFDQUFBQUNqQTNCcnVPSGI2akc5cmtTeUd2VHJBMVFqdUlzNVRYQ1VJLURvSi03MEt3QUFBQUFPZ0FBQUFBSUFBQ0FBQUFBUGxqaWxxb1dSQlhJLWN4eWxpZTdFSHl2ZThTZGYyM1h6b1JmcXljMW5ZSUFBQUFEREtDdFhRcGIzdm9NdmlKT2VSMG1kSXg0T282dlJMSThjZ2ZCZzFhNTh0T19oRTU1STV5M00yaFdjcjFHaVRGVEplTVp5X1FuU3lTSWF0eTJncXh5ZUdac2czQ2YxNVh2bzRORTRXMWVOWHlycU1OOVktcDJjSTh3c0YyNEc4bTN6Tmc1eGg5Vi00RTNGdnpIb0FZbFVjM3lkRmo2MWREajlMcU1QQmw4b3MwQUFBQUJMQk82NVMtQzBEdGJ0NjA1ME4zTGNZS2RoTTlUdUdwSUpEcVBwRWkwVmliMHpnMG9DcXc2bUp3bGZoYjdOb2VHVW9TT0c4NDRkMUNtUXFpY2ptMHR2; OpenIdConnect.nonce.TNmcQjU6a8IK156dgG3SdSV%2Fzg7P7oK3MseSgclbaYw%3D=QVFBQUFOQ01uZDhCRmRFUmpIb0F3RV9DbC1zQkFBQUF2X05OTDdlbElVT21fbEpEWVdfR2hBQUFBQUFDQUFBQUFBQVFaZ0FBQUFFQUFDQUFBQUQ1ak9hWWN4Skd3d1hqZFA1YzZGSHRkX05nYTNmQ29mZUQ5ZF9TZWU4eEN3QUFBQUFPZ0FBQUFBSUFBQ0FBQUFBWm10OW5EdWd1UGkxc0pjNlVtZFZ5djZNel9sTy1rMlRuYzF3UTJqMlJINEFBQUFEeXV0MDk5OGc5RWdLMnJ0dlBSMENESEF5YnBVb09hcFpMZmxfelRCSEloSXNxY2tGakQ5OXFLbzVuTXRLbjM2Z3VEcnFXbnJiZ0pPZy1nVVdJeDVfbm5aWXJtcEhGb2Q5ZndXbTU1UnNpY2NFVDFzV0ZVRFlrWlUxVllIV3ZsR25HVGdSOFFHQUFmOWVJeFNrUS1zczNUZ2Q3c2xtUFBWamozNnpFdHhvVWEwQUFBQUJPdjAtTnR5WEZBTTZsQTlJVHQxbGk4bGU2cnp5MVB2cUdZUVUzbjV4QTdZMldXSnNpWjQ3Um5HT0pUMG02VUgwc2FCeHZmYTY5ZDBmLUVTOGpqeE1k',
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token'
          },
          followRedirects: true,
            validateStatus: (status) => true,
          ));
      if (response.statusCode == 200) {
        print('data success');
        print(response);
        return response;

      }
      else{
        print(response);
        return("request failed");
      }
    } catch(e){
      print('POSTERROR ::: ${e.toString()}');
    }
  }

  static Future<dynamic> putData(
      {required String url , required Map<String , dynamic> data , String? token}
      )async{
    try{
      init();
      Response response= await Dio().patch(
        url,
        data: data,
        options: Options(headers: {
          'Cookie': 'OpenIdConnect.nonce.S88qwWwOQp%2F3TqKJ0Nepxv5bu7H7Z440Zlf6jGWl4xA%3D=QVFBQUFOQ01uZDhCRmRFUmpIb0F3RV9DbC1zQkFBQUF2X05OTDdlbElVT21fbEpEWVdfR2hBQUFBQUFDQUFBQUFBQVFaZ0FBQUFFQUFDQUFBQUNqQTNCcnVPSGI2akc5cmtTeUd2VHJBMVFqdUlzNVRYQ1VJLURvSi03MEt3QUFBQUFPZ0FBQUFBSUFBQ0FBQUFBUGxqaWxxb1dSQlhJLWN4eWxpZTdFSHl2ZThTZGYyM1h6b1JmcXljMW5ZSUFBQUFEREtDdFhRcGIzdm9NdmlKT2VSMG1kSXg0T282dlJMSThjZ2ZCZzFhNTh0T19oRTU1STV5M00yaFdjcjFHaVRGVEplTVp5X1FuU3lTSWF0eTJncXh5ZUdac2czQ2YxNVh2bzRORTRXMWVOWHlycU1OOVktcDJjSTh3c0YyNEc4bTN6Tmc1eGg5Vi00RTNGdnpIb0FZbFVjM3lkRmo2MWREajlMcU1QQmw4b3MwQUFBQUJMQk82NVMtQzBEdGJ0NjA1ME4zTGNZS2RoTTlUdUdwSUpEcVBwRWkwVmliMHpnMG9DcXc2bUp3bGZoYjdOb2VHVW9TT0c4NDRkMUNtUXFpY2ptMHR2; OpenIdConnect.nonce.TNmcQjU6a8IK156dgG3SdSV%2Fzg7P7oK3MseSgclbaYw%3D=QVFBQUFOQ01uZDhCRmRFUmpIb0F3RV9DbC1zQkFBQUF2X05OTDdlbElVT21fbEpEWVdfR2hBQUFBQUFDQUFBQUFBQVFaZ0FBQUFFQUFDQUFBQUQ1ak9hWWN4Skd3d1hqZFA1YzZGSHRkX05nYTNmQ29mZUQ5ZF9TZWU4eEN3QUFBQUFPZ0FBQUFBSUFBQ0FBQUFBWm10OW5EdWd1UGkxc0pjNlVtZFZ5djZNel9sTy1rMlRuYzF3UTJqMlJINEFBQUFEeXV0MDk5OGc5RWdLMnJ0dlBSMENESEF5YnBVb09hcFpMZmxfelRCSEloSXNxY2tGakQ5OXFLbzVuTXRLbjM2Z3VEcnFXbnJiZ0pPZy1nVVdJeDVfbm5aWXJtcEhGb2Q5ZndXbTU1UnNpY2NFVDFzV0ZVRFlrWlUxVllIV3ZsR25HVGdSOFFHQUFmOWVJeFNrUS1zczNUZ2Q3c2xtUFBWamozNnpFdHhvVWEwQUFBQUJPdjAtTnR5WEZBTTZsQTlJVHQxbGk4bGU2cnp5MVB2cUdZUVUzbjV4QTdZMldXSnNpWjQ3Um5HT0pUMG02VUgwc2FCeHZmYTY5ZDBmLUVTOGpqeE1k',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
          followRedirects: true,
          validateStatus: (status) => true,)
    );
    if (response.statusCode == 200) {
      print('data success');
      print(response);
      return response;

    }
    else{
      print(response);
      return("request failed");
    }
  } catch(e){
  print('POSTERROR ::: ${e.toString()}');
  }

  }

}