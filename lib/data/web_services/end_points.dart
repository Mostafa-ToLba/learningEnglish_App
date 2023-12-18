
class RequestType {
  static const String Get = 'get';
  static const String Post = 'post';
  static const String Put = 'put';
  static const String Delete = 'delete';
}

class EndPoints {  
  static const String baseURL = "http://mostafatolba-001-site1.etempurl.com/api/";
  static const String imagesUrl = "http://mostafatolba-001-site1.etempurl.com";
  static const String REFRESH_TOKEN = 'identity/refresh';
  static const String register = "Users/Register";
  static const String login = "Users/login";
  static const String forgetPassword = "Users/ForgetPassword";
  static const String resendEmail = "Users/ResendEmail";
  static const String changePasswordConfirm = "Users/ChangePasswordConfirm";
  static const String changeForgotPassword = "Users/changeForgotPassword";
  static const String getLevels = "EducationalLevels/Get";
  static const String userProfile = "Users/GetUserInfo";
  static const String notification = "Notification/GetAllNotifications";
  static const String getUnits = 'Units/Get';
}
