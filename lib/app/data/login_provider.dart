import 'package:get/get.dart';

class LoginProvider extends GetConnect {
  Future<Response> attempt(var data) {
    var myHeader = {
      'Accept': 'application/json',
    };
    // ini pakek ip local komputer kalian rek : caranya buka cmd=>ipconfig terus yang ipVaddres
    return post('http://192.168.1.3:8000/api/login', data, headers: myHeader);
  }
}
