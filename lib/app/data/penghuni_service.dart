import 'package:get/get.dart';
import '../models/penghuni.dart';

class PenghuniService extends GetConnect {
  Future<Response> fetchPenghunis() {
    return get('http://192.168.1.3:8000/api/penghunis-mobile');
  }

  Future<Response> createPenghuni(
      Penghuni penghuni, List<int> imageBytes, String imageName) {
    final formData = FormData({
      'penghuni': penghuni.toJson(),
      'image': MultipartFile(imageBytes, filename: imageName),
    });

    return post('http://192.168.1.3:8000/api/penghuni', formData);
  }

  Future<bool> deletePenghuni(int penghuniId) async {
    try {
      final response = await delete(
        'http://192.168.1.3:8000/api/penghuni/$penghuniId',
      );
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}
