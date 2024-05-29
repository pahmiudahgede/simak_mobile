import 'package:get/get.dart';
import '../models/penghuni.dart';

class PenghuniService extends GetConnect {
  final baseurl = 'http://192.168.1.3:8000/api';

  Future<Response> fetchPenghunis() {
    return get('$baseurl/penghunis-mobile');
  }

  Future<Response> createPenghuni(Penghuni penghuni) {
    final jsonData = penghuni.toJson();
    return post('$baseurl/penghuni', jsonData);
  }

  Future<Response> editPenghuni(Penghuni penghuni, int penghuniId) {
    final jsonData = penghuni.toJson();
    return put(
      '$baseurl/penghuni-edit/$penghuniId',
      jsonData,
      headers: {
        'Content-Type': 'application/json',
      },
    );
  }

  Future<bool> deletePenghuni(int penghuniId) async {
    try {
      final response = await delete(
        '$baseurl/penghuni/$penghuniId',
      );
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}
