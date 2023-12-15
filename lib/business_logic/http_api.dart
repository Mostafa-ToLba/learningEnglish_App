import 'package:dio/dio.dart';
import '../data/web_services/end_points.dart';
import '../data/web_services/web_services.dart';

class HttpApi {
  CustomDio customDio = CustomDio();
  //*******************   upload images
  Future<dynamic> uploadImages({FormData? body}) async {
    final res = await customDio.request(
      EndPoints.UPLOAD_IMAGES,
      body: body,
      type: RequestType.Post,
    );
    return res;
  }

  //*******************   upload images
  Future<dynamic> uploadImagesWeb({body}) async {
    final res = await customDio.request(
      "${EndPoints.UPLOAD_IMAGES}/64",
      body: body,
      type: RequestType.Post,
    );
    return res;
  }


  //*******************   update user image   *************************//
  Future<dynamic> updateUserImage({String? imageURL}) async {
    final res = await customDio.request(
      EndPoints.UPDATE_IMAGE,
      body: {"pictureUrl": imageURL},
      type: RequestType.Put,
    );
    return res;
  }

  //*******************   Get user data   *************************//
  Future<dynamic> getUserData() async {
    final res = await customDio.request(
      EndPoints.USER,
      type: RequestType.Get,
    );
    return res;
  }
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
}


