import 'package:get/get.dart';
import '../models/ruang.dart';

class RuangService extends GetConnect {
  final baseurl = 'http://192.168.1.7:8000/api';
  Future<Response> fetchRuangs() {
    return get('$baseurl/ruangs-mobile');
  }

  Future<Response> fetchAvailableRooms() {
    return get('$baseurl/ruang-tersedia');
  }

  Future<Response> createRuang(Room room) {
    final jsonData = room.toJson();
    return post('$baseurl/ruang', jsonData);
  }

  Future<Response> editRuang(Room room, int ruangId) {
    final jsonData = room.toJson();
    return put(
      '$baseurl/ruang-edit/$ruangId',
      jsonData,
      headers: {
        'Content-Type': 'application/json',
      },
    );
  }

  Future<bool> deleteRuang(int ruangId) async {
    try {
      final response = await delete(
        '$baseurl/ruang/$ruangId',
      );
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}
