import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
  static SharedPreferences? sharedPreferences ;

  static Future init() async{
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static dynamic getData(
      String  key
      )  {
    print('KEY :: $key');
    init();
    return  sharedPreferences?.get(key);
  }

  static Future<bool?> saveData(
    { 
      required String key,
      dynamic value
      }
      ) async {
    init();
    print('SAVED');
    if(value is String) return await sharedPreferences?.setString(key, value);
    if(value is int) return await sharedPreferences?.setInt(key, value);
    if(value is bool) return await sharedPreferences?.setBool(key, value);
    return await sharedPreferences?.setDouble(key, value);


  }

  static dynamic removeData(
      String token
      ){
    return sharedPreferences?.clear();
  }
}