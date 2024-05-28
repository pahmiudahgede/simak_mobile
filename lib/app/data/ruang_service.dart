import 'package:get/get.dart';
import '../models/ruang.dart';

class RuangService extends GetConnect {
  Future<Response> fetchRuangs() {
    return get('http://192.168.1.3:8000/api/ruangs-mobile');
  }

  Future<Response> fetchAvailableRooms() {
    return get('http://192.168.1.3:8000/api/ruang-tersedia');
  }

  Future<Response> createRuang(Room room) {
    final jsonData = room.toJson();
    return post('http://192.168.1.3:8000/api/ruang', jsonData);
  }

  Future<Response> editRuang(Room room, int ruangId) {
    final jsonData = room.toJson();
    return put(
      'http://192.168.1.3:8000/api/ruang-edit/$ruangId',
      jsonData,
      headers: {
        'Content-Type': 'application/json',
      },
    );
  }

  Future<bool> deleteRuang(int ruangId) async {
    try {
      final response = await delete(
        'http://192.168.1.3:8000/api/ruang/$ruangId',
      );
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}
