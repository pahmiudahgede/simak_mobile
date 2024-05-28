import 'package:get/get.dart';

class RuangService extends GetConnect {
  Future<Response> fetchRuangs() {
    return get('http://192.168.1.3:8000/api/ruangs-mobile');
  }

  Future<Response> fetchAvailableRooms() {
    return get('http://192.168.1.3:8000/api/ruang-tersedia');
  }
}
