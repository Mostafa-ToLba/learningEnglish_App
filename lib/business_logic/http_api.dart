import 'package:dio/dio.dart';
import '../data/web_services/end_points.dart';
import '../data/web_services/web_services.dart';

class HttpApi {
  CustomDio customDio = CustomDio();

//////////////////////////////////////////////////////////////////////////////////////////////////

//*******************  Register   *************************//

  Future<dynamic> register({Map<String, dynamic>? body}) async {
    final res = await customDio.request(
      EndPoints.register,
      type: RequestType.Post,
      body: body
    );
    return res;
  }

  //*******************  Register   *************************//

  Future<dynamic> login({Map<String, dynamic>? body}) async {
    final res = await customDio.request(
        EndPoints.login,
        type: RequestType.Post,
        body: body
    );
    return res;
  }

  //*******************  Register   *************************//

  Future<dynamic> forgetPassword({Map<String, dynamic>? body}) async {
    final res = await customDio.request(
        EndPoints.forgetPassword,
        type: RequestType.Post,
        body: body
    );
    return res;
  }

  //*******************  get education levels   *************************//

  Future<dynamic> educationLevels() async {
    final res = await customDio.request(
        EndPoints.getLevels,
        type: RequestType.Get,
    );
    return res;
  }

  //*******************  get user profile   *************************//

  Future<dynamic> userProfile() async {
    final res = await customDio.request(
      EndPoints.userProfile,
      type: RequestType.Get,
    );
    return res;
  }
  //*******************  get user profile   *************************//

}


