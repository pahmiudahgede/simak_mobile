import 'package:get/get.dart';

class LoginProvider extends GetConnect {
  final baseUrlLogin = 'http://192.168.1.3:8000/api/login';
  final baseUrlChangePassword = 'http://192.168.1.3:8000/api/changepassword';
  Future<Response> attempt(var data) {
    var myHeader = {
      'Accept': 'application/json',
    };
    return post(baseUrlLogin, data, headers: myHeader);
  }

  Future<Response> changePassword(String token, Map<String, String> data) {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    return post(baseUrlChangePassword, data, headers: headers);
  }
}
