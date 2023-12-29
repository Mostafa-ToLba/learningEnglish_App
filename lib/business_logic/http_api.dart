import '../data/web_services/end_points.dart';
import '../data/web_services/web_services.dart';

class HttpApi {
  CustomDio customDio = CustomDio();

//////////////////////////////////////////////////////////////////////////////////////////////////

//*******************  Register   *************************//

  Future<dynamic> register({Map<String, dynamic>? body}) async {
    final res = await customDio.request(EndPoints.register,
        type: RequestType.Post, body: body);
    return res;
  }

  //*******************  login   *************************//

  Future<dynamic> login({Map<String, dynamic>? body}) async {
    final res = await customDio.request(EndPoints.login,
        type: RequestType.Post, body: body);
    return res;
  }

  //*******************  Forget Password   *************************//

  Future<dynamic> forgetPassword({Map<String, dynamic>? body}) async {
    final res = await customDio.request(EndPoints.forgetPassword,
        type: RequestType.Post, body: body);
    return res;
  }

  //*******************  Forget Password Code  *************************//

  Future<dynamic> forgetPasswordCode({Map<String, dynamic>? body}) async {
    final res = await customDio.request(EndPoints.changePasswordConfirm,
        type: RequestType.Post, body: body);
    return res;
  }

  //*******************  Resend email  *************************//

  Future<dynamic> resendEmail({Map<String, dynamic>? body}) async {
    final res = await customDio.request(EndPoints.resendEmail,
        type: RequestType.Post, body: body);
    return res;
  }

  //*******************  Change Forgot Password  *************************//

  Future<dynamic> changeForgotPassword({Map<String, dynamic>? body}) async {
    final res = await customDio.request(EndPoints.changeForgotPassword,
        type: RequestType.Put, body: body);
    return res;
  }
  //*******************  Get units  *************************//

  Future<dynamic> units({int levelId = 1}) async {
    final res = await customDio.request(
      EndPoints.getUnits(levelId),
      type: RequestType.Get,
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

  //*******************  update user profile   *************************//

  Future<dynamic> updateProfile({Map<String, dynamic>? body}) async {
    final res = await customDio.request(
      EndPoints.updateProfile,
      type: RequestType.Put,
      body: body,
    );
    return res;
  }

  //*******************  get notifications  *************************//

  Future<dynamic> notifications() async {
    final res = await customDio.request(
      EndPoints.notification,
      type: RequestType.Get,
    );
    return res;
  }

  //*******************  get lessons  *************************//

  Future<dynamic> lessons({unitId}) async {
    final res = await customDio.request(
      EndPoints.getLessons(unitId),
      type: RequestType.Get,
    );
    return res;
  }

  //*******************  lesson codes  *************************//

  Future<dynamic> lessonCode({Map<String, dynamic>? body}) async {
    final res = await customDio.request(EndPoints.lessonCodes,
        type: RequestType.Post, body: body);
    return res;
  }
  //*******************  Get exams  *************************//

  Future<dynamic> exams({required int examId}) async {
    final res = await customDio.request(
      EndPoints.getExams(examId),
      type: RequestType.Get,
    );
    return res;
  }

  //******************* Save Exam Result  *************************//

  Future<dynamic> saveExamResult({Map<String, dynamic>? body}) async {
    final res = await customDio.request(EndPoints.saveExamResult,
        type: RequestType.Post, body: body);
    return res;
  }
  //*******************  Get Student Exams  *************************//

  Future<dynamic> getStudentExams() async {
    final res = await customDio.request(
      EndPoints.getStudentExams,
      type: RequestType.Get,
    );
    return res;
  }

  //******************* Get Student Exam Result Details  *************************//

  Future<dynamic> getStudentExamResultDetails(int examResultId) async {
    final res = await customDio.request(
        EndPoints.getStudentExamResultDetails(examResultId),
        type: RequestType.Get);
    return res;
  }

  //******************* signOut  *************************//

  Future<dynamic> signOut() async {
    final res = await customDio.request(
        EndPoints.signOut,
        type: RequestType.Post
    );
    return res;
  }

  //******************* add device token  *************************//

  Future<dynamic> addDeviceToken({Map<String, dynamic>? body}) async {
    final res = await customDio.request(
        EndPoints.deviceToken,
        type: RequestType.Post,
        body: body,
    );
    return res;
  }


}
