class Constants {
  Constants._();

  static const int passwordLength = 8; // Define password length which is used in whole app
  static const int mobileNumberLength = 10;
  static const int otpLength = 10;
  static const int pinCodeLength = 6;

  static const String firebaseApiKey = "AIzaSyApC4-wIYD8b92cTKajQX8cgjMm-sdenuU";
  static const String firebaseAppId = "1:568991366607:ios:6a8782e86717056f1ce6ba";
  static const String firebaseMessagingSenderId = "568991366607";
  static const String firebaseProjectId = "simmydriver-91286";

  // api status code

  static int isSuccess200 = 200;

  static int isSuccess201 = 201;

  static int isSuccess202 = 202;

  static int isTokenExpired = 401;
}
